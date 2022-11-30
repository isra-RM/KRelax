function F = t1_GE(param,xdata,ydata,TR,opt)
xdata=xdata*(pi/180);
% funcion para optimizar T1 a partir de secuencia de GE
F = param(1)*(sin(xdata).*(1-exp(-TR/param(2)))./(1-cos(xdata).*exp(-TR/param(2))));

if opt== upper('s')
    plot(xdata,ydata,'o')
    hold on
    plot(xdata,F, 'r')
    xlabel('TR (ms)')
    ylabel('Amplitud')
    drawnow
    hold off
end