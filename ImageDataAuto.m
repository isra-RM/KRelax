
function DataImagen=ImageDataAuto(I,cimg,Trelaj)
%si es inversion recovery rescalar los valores
if strcmp('T1-IR',Trelaj) && isfield(cimg,'RescaleIntercept')&& isfield(cimg,'RescaleSlope')
    I=cimg.RescaleIntercept+cimg.RescaleSlope*I;
    Ia=abs(I);
    %se prepara la mascara
    nivel = 0.01; % porciento de ruido para quitar el fondo
    [Mask,umb] = quitfondIR(Ia,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    BW = imerode(Mask, se);
    
elseif strcmp('T1-IR',Trelaj) && ~isfield(cimg,'RescaleIntercept') && ~isfield(cimg,'RescaleSlope')
    I=-4096+2*I;
    Ia=abs(I);
    %se prepara la mascara
    nivel = 0.01; % porciento de ruido para quitar el fondo
    [Mask,umb] = quitfondIR(Ia,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    BW = imerode(Mask, se);
else
    %se prepara la mascara
    nivel = 0.05; % porciento de ruido para quitar el fondo
    [im_f,umb] = quitfond5(I,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    im_f = imerode(im_f, se);
    BW = medfilt2(im_f, [5 5])> umb; % Se filtra pasa bajo para quitar remanentes
    % y se binariza
    
end
                                
s1 = regionprops(BW, I, {'Centroid','WeightedCentroid','PixelValues','MeanIntensity', 'Area', 'PixelList','EquivDiameter'}); 
numObj = numel(s1); 
%se hallan las areas de cada centroide
Areas = zeros(numObj,1);
for k = 1: numObj
    Areas(k) = s1(k).Area;   
end

% se determina el radio umbral al 80% de la mediana de las areas
radio = fix((sqrt(median(Areas)/pi))*0.8); 

% se calculan las medias,DS y CV de las regiones detectadas
for i=1:numel(s1)
    Mxy=s1(i).PixelList;
    M0=repmat(s1(i).WeightedCentroid,size(Mxy,1),1);
    D=(Mxy-M0).^2;
    d=sum(D,2);
    
    % si el area es mayor que el umbral se calculan las medias y ds
    if  Areas(i) >= (pi*radio*radio)
        ind=find(d <= repmat(radio.^2,size(d,1),1));
        valores=mean(s1(i).PixelValues(ind));
        s1(i).Med = valores;
        valores=std(s1(i).PixelValues(ind));
        s1(i).DS = valores;       
    else
        s1(i).Med = eps;
        s1(i).DS = eps;
    end
    
end

    XCentr=zeros(numel(s1),1);
    YCentr=zeros(numel(s1),1);
    Med=zeros(numel(s1),1);
    DS=zeros(numel(s1),1);
    CV=zeros(numel(s1),1);

%se llenan las matrices 

for j=1:numel(s1)
    XCentr(j)=s1(j).Centroid(1);
    YCentr(j)=s1(j).Centroid(2);
    Med(j)=s1(j).Med;
    DS(j)=s1(j).DS;
    CV(j)=(s1(j).DS/s1(j).Med)*100;
end
    
    
 Stats=[XCentr,YCentr,Med,DS,CV];

if strcmp(Trelaj,'T1-SE')
    P=repmat(cimg.RepetitionTime,numObj,1);
elseif strcmp(Trelaj,'T2-SE')
    P=repmat(cimg.EchoTime,numObj,1);
elseif strcmp(Trelaj,'T1-IR')
    P=repmat(cimg.InversionTime,numObj,1);
elseif strcmp(Trelaj,'T1-GE')
    P=repmat(cimg.FlipAngle,numObj,1);
end    
    
DataImagen=[P,Stats];
DataImagen(:,2:3) = floor(DataImagen(:,2:3));
%%Hallar centroide con CV mayor que 50% y borrarlo de la matriz de datos
pos=find(DataImagen(:,6)>50); % cv por encima de 50% se elimina
DataImagen(pos,:)=[];
%%Hallar centroide con NaN
pos=find(isnan(DataImagen(:,6)));
DataImagen(pos,:)=[];
end
