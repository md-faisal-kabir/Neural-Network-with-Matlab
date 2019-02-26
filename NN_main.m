% The main or top module
%function NN_main()

% Collect MLP details from the user

fprintf(1,'Enter number for hidden neurons');
prompt = '\n';
hd = input(prompt);
fprintf(1,'Enter the number of input neurons');
prompt = '\n';
in = input(prompt);
fprintf(1,'Enter the number of output neurons');
prompt = '\n';
op = input(prompt);
fprintf(1,'Enter the alpha value');
prompt = '\n';
alpha = input(prompt);
fprintf(1,'Enter the no of epochs');
prompt = '\n';
ep = input(prompt);
% prompt user for the optimization technique
fprintf('1 : Back Propagation \n 2: Quasi Newton \n');
fprintf(1,'Select one optimization Technique from the menu above:');
prompt = '\n';
tech = input(prompt);



% read data from the file
dataset=xlsread('NN_kernel_Dataset.xlsx');

% segregate the dataset into x_input(x data only) and d_input (d data only)
[x_input,d_input]=NN_segregation(dataset,in,op);

% scaling x_input
x_scaled=NN_scaling(x_input,1);

% scaling d_input
d_scaled=NN_scaling(d_input,0);

% merging the scaled x_input and d_input together
scaled_dataset=[x_scaled d_scaled];
[row,~]=size(scaled_dataset);

% Divide the scaled_dataset into training and validation sets
train_dataset=scaled_dataset(2:int8(2*row/3),:);
validation_dataset=scaled_dataset((size(train_dataset,1)+1):row,:);

% initialize the values of weights u, u0, v, v0
[u0,u,v0,v,W]=NN_weight(hd,in,op);

%
B0=eye(length(W));
g0=zeros(size(W));
W0=zeros(size(W));
% outer loop for epochs, inner loop for iterations
for epoch=1:ep
    Error=0;
    epoch
    
% initialize the derivative variables to zeros: dE_u0, dE_u, dE_v0, dE_v
dE_u0=zeros(size(u0));
dE_u=zeros(size(u));
dE_v0=zeros(size(v0));
dE_v=zeros(size(v));
    
    % randomize the train_dataset
randomized_data=NN_randomize(train_dataset);

% separate randomized_data into x_train and d_train
[x_train,d_train]=NN_segregation(randomized_data,in,op);

 for iteration=1:size(train_dataset,1)
  
 %%%%%% train the neural network %%%%%

% Feed-Forward equations
[gamma,z,y]=NN_feed_forward(hd,in,op,u0,u,v0,v,x_train);

% Error Calculation
Error=Error+NN_error_calc(y,d_train,op);

% Derivatives calculation
[dEdu0,dEdu,dEdv0,dEdv,g]=NN_derivatives(v,z,x_train,y,d_train,op,in,hd);

%

 end   % end of iteration loop
    Error
    E_training=Error/iteration
    E_arr(epoch)=E_training;
    ep_count(epoch)=epoch
    if E_training<0.01
     break;   
    else
        dE_u0= dE_u0 + dEdu0;
        dE_u= dE_u + dEdu;
        dE_v0= dE_v0 + dEdv0;
        dE_v= dE_v + dEdv;
        
        % Weight update: calculation of W_new
        if tech==1
            [u0,u,v0,v,W]=NN_new_weight(u0,u,v0,v,dE_u0,dE_u,dE_v0,dE_v,alpha);
        else
            [g0,W0,W,B0,u0,u,v0,v]= NN_quasiNewton(W,W0,g,g0,B0,u0,u,v0,v,alpha);
        end

    end

    u0
    u
    v0
    v

end % end of epoch loop
plot(ep_count,E_arr)
xlabel('Epoch');
ylabel('Error');
E_training
E_validation=NN_validation(validation_dataset,u0,u,v0,v,in,op,hd);

%end
