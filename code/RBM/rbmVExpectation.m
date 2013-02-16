function [ v_expected ] = rbmVExpectation( rbm, hidden )

v_expected = sigmoid(hidden * rbm.W + rbm.v_b);

end

