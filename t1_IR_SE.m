function S = t1_IR_SE(param,TI)
% funcion para optimizar T1 a partir de secuencia de IR con SE
S = param(1).*(1-param(3).*exp(-TI/param(2)));

        