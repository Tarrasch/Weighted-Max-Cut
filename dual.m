function [ c ] = dual( W )
%Dual Solve dual formulation

[n, ~] = size(W);

cvx_begin sdp
    variable gamma(n)
    maximize ( -sum(gamma) )
    W + diag(gamma) >= 0;
cvx_end

c = cvx_optval;

end

