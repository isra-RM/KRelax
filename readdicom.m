function [I,cimg] = readdicom(ImageFolder)

%hallar la cantidad de archivos en la carpeta del estudio
Files = dir(ImageFolder);
NFiles = size(Files,1);
%veriicar que no hallan carpetas
NFilesinit = NFiles;
i=0;
cont = 0;
while cont~=NFilesinit
    cont = cont+1;
    i = i+1;
    if Files(i).isdir || strcmp(Files(i).name,'.') || strcmp(Files(i).name,'..')
        Files(i)=[];
        NFiles = NFiles-1;
        i = i-1;
    end;
end;
%volver al directorio de las imagenes
cd(ImageFolder);
%inicializar las variables de salida
NFiles = size(Files,1);
cimg=cell(NFiles,1);
I=cell(NFiles,1);
ImagesDescription=cell(NFiles,1);
%Obtener informacion de cada imagen dicom dentro de la carpeta
for i=1:NFiles
    %nombre de la imagen
    Imagename=Files(i).name;
    %camino completo de la imagen
    cname=[ImageFolder '\' Imagename];
    %extraer el header del DICOM de la imagen
    cimg{i}=dicominfo(cname);
    %leer y guardar la imagen
    I{i} = double(dicomread(cname));

end





