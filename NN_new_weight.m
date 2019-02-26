function[u0,u,v0,v,W]=NN_new_weight(u0,u,v0,v,dEdu0,dEdu,dEdv0,dEdv,alpha)

u0 = u0+ alpha*(-1)*(dEdu0);
u  =  u+ alpha*(-1)*(dEdu);
v0 = v0+ alpha*(-1)*(dEdv0);
v  =  v+ alpha*(-1)*(dEdv);

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
