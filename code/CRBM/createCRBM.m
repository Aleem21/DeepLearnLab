function [ crbm ] = createCRBM(n_maps, t_v, scale, w_dim, pool_dim, ...
                        sparsity, sparsity_decay)

% assertions to write later (need results asap!)
% w_dim and pool_dim be of size (1,2)

crbm.n_maps = n_maps;
crbm.t_v = t_v;
crbm.scale = scale;
crbm.w_dim = w_dim;
crbm.pool_dim = pool_dim; 
crbm.sparsity = sparsity;
crbm.sparsity_decay = sparsity_decay;


crbm.W = scale * rand([w_dim, n_maps]);
crbm.hbias = scale * rand(1, n_maps); % maybe switch this to a value near
                                      % target sparsity                                      
% currently all visual units have same bias. this is a terrible assumption
% for power spectrum density.
crbm.vbias = scale * rand(1);
end

