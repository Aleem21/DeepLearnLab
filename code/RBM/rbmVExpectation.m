function [ v_expected ] = rbmVExpectation( rbm, hidden )

if rbm.binary
    v_expected = sigmoid(hidden * rbm.W + repmat(rbm.v_b, size(hidden,1), 1));
else
    v_expected = normrnd(hidden * rbm.W + repmat(rbm.v_b, size(hidden,1),1),1);
end

end

