function [dEdu0,dEdu,dEdv0,dEdv,g]=NN_derivatives(v,z,x_train,y,d_train,op,in,hd)

% compute dy/du0N
for kk=1:op 
    for j=1:hd
        dydu0(kk,j)=v(j,kk)*z(j)*(1-z(j));
    end
end

% compute dy/duNm
for kk=1:op 
    for i=1:in
        for j=1:hd
            dydu(kk,i,j)=v(j,kk)*z(j)*(1-z(j))*x_train(i);
        end
    end
end

% compute dy/dv0m : not used in current program
% for k=1:m 
% for kk=1:m
%     if k==kk
%     dydv0(k,kk)=1;    
%     else
%         dydv0(k,kk)=0;
%     end
% 
% end
% end

% compute dy/dvNm
for kk=1:op 
    for j=1:hd
        dydv(j,kk)=z(j);
    end
end

%compute dE/du0N
du0=0;
for j=1:hd
    for kk=1:op
        du0=du0+(y(kk)-d_train(kk))*dydu0(kk,j);
    end
    dEdu0(j)=du0;
end

%compute dE/duNm
du=0;
for j=1:hd
    for i=1:in
        for kk=1:op
            du=du+(y(kk)-d_train(kk))*dydu(kk,i,j);
        end
        dEdu(i,j)=du;
    end
end

%dE/dv0m
for kk=1:op
    dEdv0(kk)=y(kk)-d_train(kk);
end

%dE/dvNm
for j=1:hd
    for kk=1:op
        dEdv(j,kk)=(y(kk)-d_train(kk))*z(j);
    end
end

f1=size(dEdu0);
f2=size(dEdu);
f3=size(dEdv0);
f4=size(dEdv);
g=dEdu0';

for var=1:f2(1)
    g=[g;dEdu(var,:)'];
end

g=[g;dEdv0'];

for var=1:f4(1)
    g=[g;dEdv(var,:)'];
end
end
