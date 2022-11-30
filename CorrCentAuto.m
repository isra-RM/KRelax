function [DataImagenesC,Centr]=CorrCentAuto(DataImagenes,bias,ficheroCamino,Trelaj)

%de acuerdo al tipo de estudio se selecciona la imagen de mejor SNR para
%corregir
if strcmp('T1-SE',Trelaj)
    pos=find(DataImagenes(:,1)==max(DataImagenes(:,1)));
elseif strcmp('T2-SE',Trelaj)
    pos=find(DataImagenes(:,1)==min(DataImagenes(:,1)));
elseif strcmp('T1-IR',Trelaj)
    pos=find(DataImagenes(:,1)==max(DataImagenes(:,1)));
elseif strcmp('T1-GE',Trelaj)
    pos=find(DataImagenes(:,1)==max(DataImagenes(:,1)));
end

%guardar esos centroides en un arreglo
Xc=DataImagenes(pos,2);
Yc=DataImagenes(pos,3);
%ordenar centroides
Cent=[Xc Yc];
OCent=OrdCent(Cent);
Xc=OCent(:,1);
Yc=OCent(:,2);
%encontrar centroides en la data

for p=1:size(Xc,1);
    posc=find((DataImagenes(:,2)>=Xc(p)-bias & DataImagenes(:,2)<=Xc(p)+bias) & (DataImagenes(:,3)>=Yc(p)-bias & DataImagenes(:,3)<=Yc(p)+bias));
    DataImagenes(posc,2:3)=repmat([Xc(p) Yc(p)],size(posc,1),1);
end

Centr=[Xc,Yc];
DataImagenesC=DataImagenes;

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
fprintf(fileID,'%5s %6s %6s   %6s    %6s   %6s    %6s\r\n',P,'Xc','Yc','Mean','SD','VarC');
fprintf(fileID,'%6.1f %6.1f %6.1f   %6.1f    %6.1f  %6.1f   %6.1f\r\n',DataImagenesC');  % redondear para que sean                                                                                       % comparables a la hora                                                                                        % de hacer las busquedas
fclose(fileID);


end

