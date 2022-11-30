function OCent=OrdCent(Cent)

[X,indx]=sort(Cent(:,1));
Y=Cent(:,2);
Y=Y(indx);

% X=Cent(:,1);
% Y=Cent(:,2);
N=size(X,1);

OX=zeros(N,1);
OY=zeros(N,1);

salto=1;

for i=1:N-1
    if ~(X(i)>=X(i+1)-5 && X(i)<=X(i+1)+5)
        salto=[salto,i+1];
    end   
end

salto=[salto,N+1];

for j=1:length(salto)-1
    A=X(salto(j):salto(j+1)-1);
    [B,ind]=sort(Y(salto(j):salto(j+1)-1));
    A=A(ind);
    OX(salto(j):salto(j+1)-1)=A;
    OY(salto(j):salto(j+1)-1)=B;
end

OCent=[OX,OY];

end


