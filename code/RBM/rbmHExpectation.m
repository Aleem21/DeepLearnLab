function [ h_expected ] = rbmHExpectation( rbm, visible )

h_expected = sigmoid((rbm.W * visible')' + rbm.h_b);

end

