function [s, c]=SDPrelaxation(W)

[n, ~] = size(W);

cvx_begin sdp
    variable X(n,n) symmetric
    minimize ( trace(W*X) )
    diag(X) == 1;
    X >= 0;
cvx_end

V = chol(X, 'lower');
s = sign(V*randn(n,1));

c = calcCost(W, s);
