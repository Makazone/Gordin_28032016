function [ ] = Fredg(  )
%FREDG Summary of this function goes here
%   Detailed explanation goes here
a=0;
b=1;
N=200;
ds=(b-a)/N;
ss=a:ds:b;
eps=1;
K=@(x,s)(x+s)*eps;
f=@(x)(x);
A=zeros(numel(ss),numel(ss));
b=zeros(numel(ss),1);
for i=1:numel(ss)
    for j=1:numel(ss)
        if((j==1) || (j==numel(ss)))
            if(i==j)
                A(i,j)=1+ds/2*K(ss(i),ss(j));
            else
                A(i,j)=ds/2*K(ss(i),ss(j));
            end;
        else
            if(i==j)
                A(i,j)=1+ds*K(ss(i),ss(j));
            else
                A(i,j)=ds*K(ss(i),ss(j));
            end;
        end;
    end;
    b(i)=f(ss(i));
end;
solution=A\b;
figure;
title('Fredgolm Solution');
xlabel('X');
ylabel('Y');
grid on; hold on;
plot(ss,solution);

end

