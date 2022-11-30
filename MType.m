function TM = MType(cimg)


Tseq=zeros(length(cimg),4);

for k=1:length(cimg)
    if isfield(cimg{k},'InversionTime');
        Tseq(k,3)=cimg{k}.InversionTime;
    end
    Tseq(k,4)=cimg{k}.FlipAngle;
    Tseq(k,1)=cimg{k}.RepetitionTime;
    Tseq(k,2)=cimg{k}.EchoTime; 
end

TI=unique(Tseq(:,3));
FA=unique(Tseq(:,4));
TR=unique(Tseq(:,1));
TE=unique(Tseq(:,2));

if size(TR,1)==1 && size(TI,1)==1 && size(FA,1)==1; 
    TM='T2-SE';
elseif size(TE,1)==1 && size(TI,1)==1 && size(FA,1)==1;   
    TM='T1-SE';
elseif size(TE,1)==1 && size(TR,1)==1 && size(FA,1)==1;
    TM='T1-IR';
elseif size(TE,1)==1 && size(TR,1)==1 && size(FA,1)~=1;
    TM='T1-GE';
end

end

