function [ h_0, v_k, h_k ] = rbmSampleK(rbm, visible, k)

h_0 = bernoulli_sample(rbmHExpectation(rbm,visible));

h_k = h_0;
for i=1:k
    v_k = rbmVExpectation(rbm,h_k);
    h_k = rbmHExpectation(rbm, v_k);
end

end

