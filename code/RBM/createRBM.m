function [ rbm ] = createRBM( n_v, n_h, t_v, scale, sparsity, sparsity_decay)
% createRBM( n_v, n_h, t_v, scale, sparsity, sparsity_decay) creates a 
% definition of an RBM model based on the given parameters
% 
% INPUTS:
%   n_v.............: number of vissible units
%   n_h.............: number of hidden units
%   t_v.............: type of visible units
%                       possible types:
%                           'binary'
%                           'gauss'
%   scale...........: scale of initial weights
%   sparsity........: desired sparsity level of hidden units
%   sparsity_decay..: sparsity decay value, in range [0, 1]
%
% OUTPUTS:
%   rbm.....: an instatiation of a rbm model given the inputs    

% Set the model's variables
rbm.n_v = n_v;
rbm.n_h = n_h;
rbm.t_v = t_v;
rbm.scale = scale;
rbm.sparsity = sparsity;
rbm.sparsity_decay = sparsity_decay;

% Randomly generate biases and weights
rbm.v_b = scale * rand(1,n_v);
rbm.h_b = 2 * sparsity * rand(1,n_h);
rbm.W = scale * rand(n_h, n_v);

end

