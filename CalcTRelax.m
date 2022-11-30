function  [Tag,Mag,TRelaj]=CalcTRelax( Int,Tiempos,Cent,cimg,T,ficheroDir)
% Se reciben las intensidades ,TR\TE y Coordenadas de centroides
%para calcular M0 y T1\T2 y se escribe en un fichero de texto

%numero de centroides (viales)
nCent=size(Int,2);
MatrizDatos=zeros(nCent,5);
h=waitbar(0,['Waiting for ' T(1:2) ' calculation'],'Name',[T(1:2) ' Estimation']);

for i=1:nCent   
    waitbar(i/nCent,h,['Estimating ' T(1:2) ' from vial ' num2str(i) ' of ' num2str(nCent)]);  %setting progressbar
%     M=fiteve23_f(Int{i}',Tiempos{i}',T,'n');
    [Mag,TRelaj]=EstimateTRelax(Int{i}',Tiempos{i}',cimg{end},T);
    MatrizDatos(i,2:3)=Cent(i,1:2);
%     MatrizDatos(i,3:4)=M; 
    MatrizDatos(i,4)=Mag; 
    MatrizDatos(i,5)=TRelaj;
    MatrizDatos(i,1)=i;
end
close(h);

Tag=MatrizDatos(:,1);
Mag=MatrizDatos(:,4);
TRelaj=MatrizDatos(:,5);

fileID = fopen(ficheroDir,'w');  
fprintf(fileID,'%6s %6s %6s  %6s   %6s\r\n','Tag','XCentr','YCentr','Mo',T(1:2));  
fprintf(fileID,'%6i %6.1f %6.1f   %6.1f   %6.1f\r\n',MatrizDatos');                                                                                          % de hacer las busquedas
fclose(fileID);

end

