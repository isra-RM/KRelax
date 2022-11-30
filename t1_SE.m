function S = t1_SE(param,TR)
% funcion para optimizar T1 a partir de secuencia de SE
S = param(1).*(1-param(3).*exp(-TR/param(2)));
