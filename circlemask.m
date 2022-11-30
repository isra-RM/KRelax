function  Ic=circlemask(dim,Cent,radio)
%parametros de entrada:centroides como vector columna
%dimensiones de la mascara como vector fila (largo,ancho)
%radio de los circulos a pintar como vector columna

% si el radio es igual para todos los circulos
if size(radio,1)==1
    radio=repmat(radio,size(Cent,1),1);
end

Xc=Cent(:,2);
Yc=Cent(:,1);

Ic=zeros(dim);
for i=1:size(Xc,1);        
    [y,x]=ndgrid(-(Xc(i)-1):(dim(1)-Xc(i)),-(Yc(i)-1):(dim(2)-Yc(i)));
    Ic=Ic+((x.^2+y.^2)<=radio(i).^2);
end

Ic=logical(Ic);



end

