function [s, c]=gw_assign(W)

[n, ~] = size(W);

cvx_begin sdp
    variable X(n,n) symmetric
    minimize ( trace(W*X) )
    diag(X) == 1;
    X >= 0;
cvx_end

try 
    V = chol(X);
catch whatever
    V = X;
end
s = sign(V*randn(n,1));

c = calcCost(W, s);
