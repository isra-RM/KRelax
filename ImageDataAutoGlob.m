function DataImagen=ImageDataAutoGlob(I,Mask,cimg,Trelaj)
% si es inversion recover rescalar los valores
%si es inversion recovery rescalar los valores
if strcmp('T1-IR',Trelaj) && isfield(cimg,'RescaleIntercept')&& isfield(cimg,'RescaleSlope')
    I=cimg.RescaleIntercept+cimg.RescaleSlope*I;
elseif strcmp('T1-IR',Trelaj) && ~isfield(cimg,'RescaleIntercept') && ~isfield(cimg,'RescaleSlope')
    I=-4096+2*I;
end
% se detectan los viales y sus propiedades
s = regionprops(Mask, I, {'Centroid','WeightedCentroid','PixelValues','MeanIntensity','EquivDiameter', 'Area', 'PixelList'});
numObj = numel(s);
Mean=zeros(numObj,1);
DS=zeros(numObj,1);
CV=zeros(numObj,1);
XCent=zeros(numObj,1);
YCent=zeros(numObj,1);
Radii=zeros(numObj,1);
for k = 1 : numObj
    Mean(k) = s(k).MeanIntensity;
    s(k).StandardDeviation = std(double(s(k).PixelValues));
    DS(k)=s(k).StandardDeviation;
    CV(k)=round(100*DS(k)./Mean(k));
    XCent(k)=s(k).Centroid(1);
    YCent(k)=s(k).Centroid(2); 
    Radii(k)=0.5*round(s(k).EquivDiameter);
end
    

Stats=[XCent,YCent,Mean,DS,CV];

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











