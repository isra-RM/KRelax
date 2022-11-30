function  DataImagenes=ExtRegionsAuto(I,cimg,ficheroCamino,Trelaj)

numImag=length(I);
%%
% se recogen las propiedades de las imagenes
DataImagenes=cell(numImag);
% se extraen las caracteristicas de los viales en cada imagen
for t=1:numImag
    DataImagenes{t}=ImageDataAuto(I{t},cimg{t},Trelaj);
end

DataImagenes=cell2mat(DataImagenes);

[~,indord]=sort(DataImagenes(:,1));
DataImagenes=DataImagenes(indord,:);

%se escribe en el fichero de texto
fileID = fopen(ficheroCamino,'w');

%se escriben los datos de acuerdo al tipo de estudio
if strcmp('T1-SE',Trelaj)
    P='TR';
elseif strcmp('T2-SE',Trelaj)
    P='TE';
elseif strcmp('T1-IR',Trelaj)
    P='TI';
elseif strcmp('T1-GE',Trelaj)
    P='FA';
end
fprintf(fileID,'%5s  %6s  %6s %6s   %6s     %6s\r\n',P,'XCent','YCent','Mean','SDev','VCoeff');  
fprintf(fileID,'%6.1f %6.1f  %6.1f  %6.1f  %6.1f    %6.1f\r\n',DataImagenes');  
fclose(fileID);
end

