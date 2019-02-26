function [gamma,z,y]=NN_feed_forward(hd,in,op,u0,u,v0,v,x_train)

%N=no. of hidden neurons;
%n=number of inputs item(not value);
%m=number of outputs item(not value);
%u0=values of weights all u0;
%u=values of weights all u;
%v0=values of all v0;
%v=values of all v;
%x_train=scaled and randomized input( i.e. only x) values;
%r=gamma



for j=1:hd
    gamma(j)=u0(j);
    for i=1:in
        gamma(j)=gamma(j)+(u(i,j)*x_train(i));
    end
    z(j)=1/(1+exp(-gamma(j)));
    
end


    
for k=1:op
        y(k)=v0(k);
        
    for j=1:hd
        y(k)=y(k)+v(j,k)*z(j);
    end
end
end
    