function [ Io,cimgo ] = OrderImag( I,cimg,T)
%esta funcion ordena el arreglo de imagenes adquirido usando la info del
%header del dicom

% se guardan  los TR , TE , TI o FA segun el estudio
TR=zeros(1,length(cimg));
TE=zeros(1,length(cimg));
TI=zeros(1,length(cimg));
FA=zeros(1,length(cimg));
for i=1:length(cimg)
    TR(i)=cimg{i}.RepetitionTime;
    TE(i)=cimg{i}.EchoTime;
    FA(i)=cimg{i}.FlipAngle;
    if isfield(cimg{i},'InversionTime');
        TI(i)=cimg{i}.InversionTime;
    end
end

% se ordenan los TR,TE,TI o FA 
if strcmp(T,'T1-SE')
    [~,Ind]=sort(TR);
elseif strcmp(T,'T2-SE')
    [~,Ind]=sort(TE);
elseif strcmp(T,'T1-IR')
    [~,Ind]=sort(TI);
elseif strcmp(T,'T1-GE')
    [~,Ind]=sort(FA);
end

% con los indices calculados se reestructura el cimg y el arreglo de
% imagenes
cimgo=cell(1,length(cimg));
Io=cell(1,length(I));
for k=1:length(cimg)
    cimgo{k}=cimg{Ind(k)};
    Io{k}=I{Ind(k)};
end

end

