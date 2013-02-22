function [ im ] = crbmVisualize(crbm, n_high, n_wide, start_h )

[h,w] = crbm.w_dim;
im = zeros(n_high * h, n_wide * w);
W = (crbm.W - min(min(min(crbm.W))))/(max(max(max(crbm.W))) - min(min(min(crbm.W))));

k=1;
for m=0:n_high-1
    for r=0:n_wide-1
        im(m*h+1:(m+1)*h, r*w+1:(r+1)*w) = W(:,:,k);
        k=k+1;
    end
end
end


end

