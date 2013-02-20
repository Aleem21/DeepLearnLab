function [ rbm ] = createRBM( n_v, n_h, t_v, scale, sparsity, sparsity_decay)
%CREATE_RBM Summary of this function goes here
%   Detailed explanation goes here

rbm.n_v = n_v;
rbm.n_h = n_h;
rbm.t_v = t_v;
rbm.scale = scale;
rbm.sparsity = sparsity;
rbm.sparsity_decay = sparsity_decay;

rbm.v_b = scale * rand(1,n_v);
rbm.h_b = 2 * sparsity * rand(1,n_h);
rbm.W = scale * rand(n_h, n_v);

end

