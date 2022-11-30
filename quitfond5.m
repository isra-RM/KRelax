function [im_f, umb] = quitfond5(im, niv)   
% Quita el fondo de imagen de RM
% usando el 5% del fondo
% Input: I imagen de entrada
%        niv por ciento del histograma     
%  
% 02 Dic 2013   
% 
% autor: Evelio.
if nargin==1,niv=0.05;end    % si no definen el porciento del fondo se asume como el 5%
[h,longit] = histogr(im, max(max(im))); % se calcula el histograma
                                                    % y se filtra con medfilt1 
                                                    % con una ventana de 5

h= medfilt1(h,5);                                                    
[M,P] = max(h);
% se encuentran los valores q son mayores o igual q el valor definido 
for i=P:longit
    if  h(i)> (M*niv)
        i=i+1;
    else
        X1=i;
        break
    end
end
umb = X1;
[x,y] = find(im<= umb);
im_f = im;
for j=1:length(x)
    im_f(x(j),y(j))=0;               % pixels  con  tonos  por  debajo  del
end;                       % umbral  calculado (minimo en derivad

