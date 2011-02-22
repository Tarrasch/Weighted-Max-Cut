function [s, c]=SDPrelaxation(W)

n = size(W);

cvx_begin
    variable X(n, n) symmetric
    minimize ( trace(W*X) )
    subject to
        diag(X) == 1;
        X >= 0;

cvx_end

V = chol(X, 'lower');

c = calcCost(W, s);