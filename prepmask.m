function [Mask,Cent] = prepmask( imTemplate,cimg,Trelaj )

%si es inversion recovery rescalar los valores
if strcmp('T1-IR',Trelaj) && isfield(cimg,'RescaleIntercept')&& isfield(cimg,'RescaleSlope')
    imTemplate=cimg.RescaleIntercept+cimg.RescaleSlope*imTemplate;
    Ia=abs(imTemplate);
    %se prepara la mascara
    nivel = 0.01; % porciento de ruido para quitar el fondo
    [Mask,umb] = quitfondIR(Ia,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    BW = imerode(Mask, se);
    
elseif strcmp('T1-IR',Trelaj) && ~isfield(cimg,'RescaleIntercept') && ~isfield(cimg,'RescaleSlope')
    imTemplate=-4096+2*imTemplate;
    Ia=abs(imTemplate);
    %se prepara la mascara
    nivel = 0.01; % porciento de ruido para quitar el fondo
    [Mask,umb] = quitfondIR(Ia,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    BW = imerode(Mask, se);
else
    %se prepara la mascara
    nivel = 0.05; % porciento de ruido para quitar el fondo
    [imTemplate,umb] = quitfond5(imTemplate,nivel);  % Quita el fondo usando el algoritmo del porciento de ruido nivel%%
    se =strel('disk', 2); % erosiona la imagen
    imTemplate = imerode(imTemplate, se);
    BW = medfilt2(imTemplate, [5 5])> umb; % Se filtra pasa bajo para quitar remanentes
    % y se binariza   
end

% se extraen las propiedades de las regiones detectadas
S = regionprops(BW,imTemplate,{'Centroid','WeightedCentroid','Area', 'EquivDiameter'});
numObj = numel(S);
% se guardan las areas y los centroides de las areas detectadas
Area=zeros(numObj,1);
Cent=zeros(numObj,2);
for i=1:numObj
    Cent(i,1)=floor(S(i).Centroid(1));
    Cent(i,2)=floor(S(i).Centroid(2));
    Area(i)=S(i).Area;
end
%se ordenan los centroides
Cent=OrdCent(Cent);

% se establece como area umbral el 80% de la mediana de las areas
AreaC = 0.8*median(Area);
radio=fix(sqrt(AreaC/pi));
pos=find(Area<=AreaC);
Cent(pos,:)=[];
% se crea la mascara con los centroides que cumplen el criterio
Mask=circlemask(size(imTemplate),Cent,radio);

end

