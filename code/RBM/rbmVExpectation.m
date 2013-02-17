function [ v_expected ] = rbmVExpectation( rbm, hidden )

v_expected = sigmoid(hidden * rbm.W + repmat(rbm.v_b, size(hidden,1), 1));

end

