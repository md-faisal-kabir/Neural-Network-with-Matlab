% Validation Module
function E_validation=NN_validation(validation_dataset,u0,u,v0,v,in,op,hd)

Error=0;

% separate validation_dataset into x_train and d_train
[x_validate,d_validate]=NN_segregation(validation_dataset,in,op);

for iteration=1:size(validation_dataset,1)
    
    %%%%%% validate the neural network %%%%%
    
    % Feed-Forward equations
    [gamma,z,y]=NN_feed_forward(hd,in,op,u0,u,v0,v,x_validate);
    
    % Error Calculation
    Error=Error+NN_error_calc(y,d_validate,op);    
    
end   % end of iteration loop

E_validation=Error/(iteration);
E_validation

end