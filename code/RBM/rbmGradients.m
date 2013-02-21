function [ w_g, v_g, h_g, q_current ] = rbmGradients( rbm, batch, k, q_old)

batch_size = size(batch,1);

[h_0, v_k, h_k] = rbmSampleK(rbm, batch, k);

E_0 = zeros(rbm.n_h, rbm.n_v);
E_k = zeros(rbm.n_h, rbm.n_v);

for i=1:batch_size
    E_0 = E_0 + h_0(i,:)' * batch(i,:);
    E_k = E_k + h_k(i,:)' * v_k(i,:);
end

sparsity_grad = 0;
% We are only updating the hidden biases.
% Hinton's practical guide says we should update W as well. Might look
% into that later
q_current = sum(h_0, 1)/batch_size;

% On first batch q_old will be negative.
if q_old < 0
    q_old = q_current;
end
if rbm.sparsity > 0
    % q_current is estimated from sample of hidden units. Could be weighted
    % sum of their expectation.
    sparsity_grad = rbm.sparsity - (rbm.sparsity_decay * q_old ...
                    + (1 - rbm.sparsity_decay)*q_current);
end

w_g = (E_0 - E_k)./batch_size;
v_g = (sum(batch,1) - sum(v_k,1))/batch_size;
h_g = (sum(h_0,1) - sum(h_k,1))/batch_size + sparsity_grad;

end

