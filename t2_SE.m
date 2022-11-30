function S = t2_SE(param,TE)
% funcion para optimizar T2 a partir de secuencia de SE
S = param(1).*exp(-TE/param(2));

        