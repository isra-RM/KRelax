function label = getlabel(x)

if x<10
    label = '000';
    
elseif (x>=10)&(x<100)
    label = '00';
    
elseif(x>=100)&(x<1000)
    label = '0';
    
elseif (x>=1000)&(x<100000000)
    label = '';
    
end

