function [Int,Tiempos,DS] = ExtCentInt(DataReg,Centers,T )
%encontrar las posiciones de los centroides
% pos=find(DataReg(:,1)==max(DataReg(:,1))& DataReg(:,2)==min(DataReg(:,2)));
% %guardar esos centroides en un arreglo
% Xc=DataReg(pos,3);
% Yc=DataReg(pos,4);
% Coord=[Xc Yc];
Centers=round(Centers);
Xc=Centers(:,1);
Yc=Centers(:,2);

Tiempos=cell(1,size(Xc,1));
Int=cell(1,size(Xc,1));
DS=cell(1,size(Xc,1));
for i=1:size(Xc,1)
    poscent=find(DataReg(:,2)==Xc(i)& DataReg(:,3)==Yc(i));
    if strcmp(T,'T1-SE')
        %organizar los TR y obtener los indices 
        [Tiempos{i},ind]=sort(DataReg(poscent,1));
        Int{i}=DataReg(poscent,4);
        %reorganizar la matriz de intensidades usando los indices
        %calculados
        Int{i}=Int{i}(ind);
        DS{i}=DataReg(poscent,5);
        %reorganizar la matriz de desv std usando los indices
        %calculados
        DS{i}=DS{i}(ind);
        %anadir la condicion de que M(TR=0)=0;
%         Int{i}=[0;Int{i}];
%         Tiempos{i}=[0;Tiempos{i}];
%         DS{i}=[0;DS{i}];
    end
    
    if strcmp(T,'T2-SE')||strcmp(T,'T1-IR')||strcmp(T,'T1-GE') 
        %organizar los TE y obtener los indices
        [Tiempos{i},ind]=sort(DataReg(poscent,1));
        Int{i}=DataReg(poscent,4);
        %reorganizar la matriz de intensidades usando los indices
        %calculados
        Int{i}=Int{i}(ind);
        DS{i}=DataReg(poscent,5);
        %reorganizar la matriz de desv std usando los indices
        %calculados
        DS{i}=DS{i}(ind);            
    end
        
end



end

