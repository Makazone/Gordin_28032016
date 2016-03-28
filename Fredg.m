function [ ] = Fredg(  )
%FREDG Summary of this function goes here
%   Detailed explanation goes here
a=0;
b=1;
N=20;
ds=(b-a)/N;
ss=a:ds:b;
K=@(x,s)(x+s);
f=@(x)(x);
A=zeros(numel(ss),numel(ss));
b=zeros(numel(ss),1);
for i=1:numel(ss)
    for j=1:numel(ss)
        if((i==1)||(i==numel(ss)))
            if(i==j)
                A(i,i)=1+ss(i)*ds/2*K(ss(i),ss(i));
            else
                A(i,j)=ss(i)*ds/2*K(ss(i),ss(j));
            end;
        else
            if(i==j)
                A(i,i)=1+ss(i)*ds*K(ss(i),ss(i));
            else
                A(i,j)=ss(i)*ds*K(ss(i),ss(j));
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

