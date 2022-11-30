function [Mask,umb] = quitfondIR(I, niv)   
% Quita el fondo de imagen de RM
% 
% autor: Evelio.
if nargin==1
    niv=0.05;
end    
[h,longit] = histogr(I, max(max(I))); % se calcula el histograma
                                                                                                   % con una ventana de 5
h= smoothzero(h);
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
Mask=I>umb;
                    
