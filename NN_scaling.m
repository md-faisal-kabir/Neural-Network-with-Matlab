function [scaled_output]=NN_scaling(x,type)
%x=input values e.g. [-1 -2 -4 0 8];
%type= data type, input> type=1; output> type=0


[~,columns]=size(x)
if type==1
    c=-1;
    d=1;
else
    c=0;
    d=1
end
for col=1:columns
    p=x(:,col);
    a=min(p);
    b=max(p);
    for q=1:length(p)
        p_scale(q)= (((p(q)-a)*(d-c))/(b-a))+c;
    end
    scaled_output(:,col)=p_scale;
end

end

%x_scale
    