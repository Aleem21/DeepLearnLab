function [ h_expected ] = rbmHExpectation( rbm, visible )

h_expected = sigmoid((rbm.W * visible')' + repmat(rbm.h_b, size(visible,1), 1));

end

