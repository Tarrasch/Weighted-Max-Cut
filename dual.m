function [ c ] = dual( W )
%Dual Solve dual formulation

[n, ~] = size(W);

cvx_begin sdp
    variable myGamma(n)
    maximize ( -sum(myGamma) )
    
    W + diag(myGamma) >= 0;
cvx_end

c = -cvx_optval;

end

