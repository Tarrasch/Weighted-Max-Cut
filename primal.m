function [ c ] = primal( W )
%Primal Solve primal formulation

[n, ~] = size(W);

cvx_begin sdp
    variable X(n,n) symmetric
    minimize ( trace(W*X) )
    diag(X) == 1;
    X >= 0;
cvx_end

c = -cvx_optval;

end

