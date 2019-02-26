function[g0,W0,W,B0,u0,u,v0,v]= NN_quasiNewton(W,W0,g,g0,B0,u0,u,v0,v,alpha)
del_W=W-W0;
del_g=g-g0;

 % DFP
del_B=((del_W*(del_W)')/((del_W)'*del_g)) - ((B0*del_g*(del_g)'*B0)/((del_g)'*B0*del_g)); 

% BFGS
% del_B= (1 + (del_g*B0*del_g)/del_W*del_g)*(del_W*del_W'/(del_W*del_g)); 
B=B0+del_B;
g0=g;
W0=W;
%B0=B;
W=W-(alpha*B*g);
[u0,u,v0,v]=seperator(W,u0,u,v0,v);
B    % to display B
end
