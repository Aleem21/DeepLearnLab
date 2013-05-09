function [rbm ] = trainRBM( rbm, data, batch_size, nepochs, learn_rate)
%TRAINRBM Summary of this function goes here
%   Detailed explanation goes here


ndata = length(data);

% Create a random permutation of the data
perm = randperm(ndata);
data = data(perm,:);

nbatches = ceil(ndata/batch_size);

q_old = -1;

for e=1:nepochs
    tic
    for b=0:nbatches-1
        
        [w,v,h, q_old] = rbmGradients(rbm, data(b*batch_size+1:...
                            min((b+1)*batch_size,ndata),:), 1, q_old);
                              

        rbm.W = rbm.W + learn_rate * w;
        if rbm.binary
            rbm.v_b = rbm.v_b + learn_rate * v;
        end
        rbm.h_b = rbm.h_b + learn_rate * h;

    end
    toc
    
    

end


end

