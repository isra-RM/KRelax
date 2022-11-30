function [vect,longit]=histogr(mat,ntonos)
% Esta funcion calcula el histograma de una matriz y lo
% devuelve en un vector, asi como la longitud de este.
% 21/abril/95
% tic
mat = double(mat);
ntonos = double(ntonos);
[N1,Y1]=hist(mat,ntonos);
vect=rot90(N1,1);
vect=sum(vect);
longit=length(vect);
%toc

