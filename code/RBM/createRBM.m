function [ rbm ] = createRBM( n_v, n_h, t_v, scale, sparsity, sparsity_decay)
%CREATE_RBM Summary of this function goes here
%   Detailed explanation goes here

rbm.n_v = n_v;
rbm.n_h = n_h;
rbm.t_v = t_v;
rbm.scale = scale;
rbm.sparsity = sparsity;
rbm.sparsity_decay = sparsity_decay;

rbm.binary = true;
if strcmp('binary', t_v)==0
    rbm.binary = false;
end

rbm.v_b = scale * rand(1,n_v);
rbm.h_b = scale  * rand(1,n_h);
rbm.W = normrnd(zeros(n_h,n_v), .01);

end

