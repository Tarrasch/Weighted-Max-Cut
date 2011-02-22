function [s, c]=hier_sdp(W)

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
    disp('Cholesky failed, using V := X now');
end

D = pdist(V);
L = linkage(D);
C = cluster(L, 'maxclust', 2);

dendrogram(L)

s = zeros(n,1);
for i = 1:n
    if C(i) == 1
        s(i) = 1;
    else
        s(i) = -1;
    end
end
c = calcCost(W, s);
