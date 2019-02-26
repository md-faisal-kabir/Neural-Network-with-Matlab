function [u0,u,v0,v,W]=NN_weight(hd,in,op)
%N=no. of hidden neurons; 
%n=number of inputs item(not value);
%m=number of outputs item(not value);

for j=1:hd
    u0(j)=(-1)^j;
    %u0
    for i=1:in
        u(i,j)=(-1)^(i+j);
    end
    %u
end

for k=1:op
    v0(k)=(-1)^k;
    %v0
    for j=1:hd
        v(j,k)=(-1)^(j+k);
    end
    %v
end

f1=size(u0);
f2=size(u);
f3=size(v0);
f4=size(v);
W=u0';

for var=1:f2
    W=[W;u(var,:)'];
end

W=[W;v0'];

for var=1:f4
    W=[W;v(var,:)'];
end
end
