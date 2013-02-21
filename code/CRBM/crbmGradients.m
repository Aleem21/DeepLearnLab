function [ w_g, v_g, h_g, q_current ] = crbmGradients(crbm, batch, k, q_old)

batch_size = size(batch);
batch_size = batch_size(end);

[h_0, v_k, h_k] = crbmSampleK(crbm, batch, k);

ndim = length(size(crbm.W));
w_size = size(crbm.W);
w_g = zeros(size(crbm.W));
n_h = numel(h_0)/(crbm.n_maps*batch_size);
n_v = numel(v_k)/batch_size;

if ndim == 3
    
    parfor m=1:crbm.n_maps
        E_0 = zeros(w_size);
        E_k = zeros(w_size);
        for i=1:batch_size
            E_0 = E_0 + convcut(visible, h_0(:,:,m,i)');
            E_k = E_k + convcut(visible, h_k(:,:,m,i)');
        end
        w_g(:,:,m) = (1/(n_h*batch_size)) * (E_0 - E_k);
        
    end
    
else
    
    parfor m=1:crbm.n_maps
        E_0 = zeros(w_size);
        E_k = zeros(w_size);
        for i=1:batch_size
                E_0 = E_0 + convcut(visible, h_0(:,:,:,m,i)');
                E_k = E_k + convcut(visible, h_k(:,:,:,m,i)');
        end
        w_g(:,:,:,m) = (1/(n_h*batch_size)) * (E_0 - E_k);
    end
    
end


if ndim == 3
    q_current = arrayfun(@(k) sum(sum(sum(h_0(:,:,k,:)))), 1:crbm.n_maps); 
else
    q_current = arrayfun(@(k) sum(sum(sum(sum(h_0(:,:,:,k,:))))), 1:crbm.n_maps); 
end

q_current = q_current / (n_h * batch_size);

if q_old <0 
    q_old = q_current;
end

sparsity_grad = 0;
if crbm.sparsity >0
    sparsity_grad = crbm.sparsity - (crbm.sparsity_decay * q_old ...
                    + (1 - crbm.sparsity_decay)*q_current);
end

if ndim == 3
    v_g = (1/(n_v * batch_size)) * sum(sum(sum(visible - v_k)));
    h_g = (1/(n_h * batch_size)) * ...
            arrayfun(@(k) sum(sum(sum(h_0(:,:,k,:)))), 1:crbm.n_maps); 
else
    v_g = (1/(n_v * batch_size)) * sum(sum(sum(sum(visible - v_k))));
    h_g = (1/(n_h * batch_size)) * ...
            arrayfun(@(k) sum(sum(sum(sum(h_0(:,:,:,k,:))))), 1:crbm.n_maps)
end
h_g = h_g + sparsity_grad;





end

