function [ v_expected ] = crbmVExpectation( crbm, hidden )


% MATLAB suggested this to reduce overhead in parfor.
W = crbm.W;
vbias = crbm.vbias;

v_expected = convcut(hidden, W);

k_dim = length(size(W)) -1;
v_expected = sigmoid(sum(v_expected, k_dim)+vbias);

