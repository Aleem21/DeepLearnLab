function [ h_expected ] = crbmHExpectation( crbm, visible )

% V is (1xn) a cell array with each cell holding an input. n input in all
n = length(visible);
h_expected_k = cell(1, crbm.n_maps);

% MATLAB suggests this to reduce overhead in parfor.
W = crbm.W;
hbias = crbm.h_b;

for k=1:crbm.n_maps
%parfor k=1:crbm.n_maps
    h_expected_k{k} = convcut(visible, kthMap(W,k)') + hbias(1,k);
end

s = size(h_expected_k{1});
h_expected = zeros([s(1:end-1) crbm.n_maps s(end)]); 

for k=1:crbm.n_maps
%parfor k=1:crbm.n_maps
    h_expected(:,:,k,:) = h_expected_k{k};
end

h_expected = sigmoid(h_expected);

