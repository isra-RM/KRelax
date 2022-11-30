function [Mo,TRelaj] = EstimateTRelax(Int,Tiempos,cimg,Trelaj)
% Optimiza una funcion objetivo SI la variable a optimizar es x
% usa la funcion de optimizacion lsqcurvefit
% emplea el Algoritmo de levenberg-marquard
% Entrada de datos
% Int -> son los valores de intensidad medidos en las imagenes. Pasar los
% datos vector fila
% Tiempos -> tiempos de repeticion o de eco para hacer el ajsute. Pasar los datos
% como vector fila
% T-> T1 o T2
 

UB = 40000; 
LB = 0;
options = optimset('lsqcurvefit');
%optionsTRR=optimset(options,'Display', 'off', 'Algorithm','trust-region-reflective');
optionsLM = optimset(options,'Display', 'off', 'Algorithm','Levenberg-Marquardt'); % 'Display', 'off'  'Algorithm','levenberg-marquardt' 

N= size(Int,1);
Rc=zeros(N,3);
for i= 1: N
    SI = Int(i,:);
    Mo = max(SI);
    TR=cimg.RepetitionTime;
    %Mo = Mo + (Mo*1); % linea nueva pasar solo una variable a optimizar
    x0 = [Mo 100 0]; % valores iniciales para Mo y T1    
    if strcmp(Trelaj,'T1-SE')
        [x,~, ~] = lsqcurvefit(@(param,Tiempos) t1_SE(param,Tiempos),x0,Tiempos,SI,LB,UB,optionsLM);
        theta=acosd(1-x(3));
        disp(theta);
    elseif strcmp(Trelaj,'T2-SE')
        [x,~, ~] = lsqcurvefit(@(param,Tiempos) t2_SE(param,Tiempos),x0,Tiempos,SI,LB,UB,optionsLM);
    elseif strcmp(Trelaj,'T1-IR')
        [x,~, ~] = lsqcurvefit(@(param,Tiempos) t1_IR_SE(param,Tiempos),x0,Tiempos,SI,LB,UB,optionsLM);
        theta=acosd(1-x(3));
        disp(theta);
    elseif strcmp(Trelaj,'T1-GE')
        [x,~, ~] = lsqcurvefit(@(param,Tiempos) t1_GE(param,Tiempos,SI,TR,'n'),x0,Tiempos,SI,LB,UB,optionsLM);
    end
    Rc(i,:) = x;
    Mo= Rc(i,1);
    TRelaj=Rc(i,2);
%     A=Rc(i,3);
%     disp(A);
end


end

