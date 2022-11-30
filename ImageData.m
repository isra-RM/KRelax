function DataImagen=ImageData(I,Mask,cimg,Trelaj)

%si es inversion recover rescalalr los valores
% if strcmp('T1-IR',Trelaj) && isfield(cimg,'RescaleIntercept') && isfield(cimg,'RescaleSlope')
%     I=cimg.RescaleIntercept+cimg.RescaleSlope*I;
% elseif strcmp('T1-IR',Trelaj) && ~isfield(cimg,'RescaleIntercept') && ~isfield(cimg,'RescaleSlope')
%     I=-2048+2*I;
% end

% if strcmp('T1-IR',Trelaj)
%    I=-4096+2*I; 
% end

s = regionprops(Mask, I, {'Centroid','WeightedCentroid','PixelValues','MeanIntensity','BoundingBox', 'Area', 'PixelList'});
numObj = numel(s);
Mean=zeros(numObj,1);
DS=zeros(numObj,1);
CV=zeros(numObj,1);
CoordCent=zeros(numObj,2);
for k = 1 : numObj
    Mean(k) = s(k).MeanIntensity;
    s(k).StandardDeviation = std(double(s(k).PixelValues));
    DS(k)=s(k).StandardDeviation;
    CV(k)=round(100*abs(DS(k)./Mean(k)));
    CoordCent(k,1)=round(s(k).Centroid(1));
    CoordCent(k,2)=round(s(k).Centroid(2));            
end

Stats=[CoordCent,Mean,DS,CV];

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











