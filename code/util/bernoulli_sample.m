function [ sample ] = bernoulli_sample( p )

    function s = bs(p_)
        if rand(1,1) < p_
            s = 1;
        else
            s = 0;
        end
    end

    sample = arrayfun(@(x) bs(x),p);

end

