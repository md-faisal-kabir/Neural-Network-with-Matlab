function E=NN_error_calc(y,d_train,op)
%compute the error  
%m=number of output items
E=0;
for k=1:op
    E=E+0.5*(y(k)-d_train(k))^2;
end
end
