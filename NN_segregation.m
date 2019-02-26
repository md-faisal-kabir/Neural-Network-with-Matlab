% dataset Separation module: to separate input and output column data into
% two array variables 
function [x_input,d_output]=NN_segregation(randomized_data,in,op)

        x_input=randomized_data(:,1:in);     
    
        d_output=randomized_data(:,in+1:(in+op));
        
    
end