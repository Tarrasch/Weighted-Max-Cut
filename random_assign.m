function [s, c]=random_assign(W)

n = size(W);
s = zeros(n);
for i = 1:n 
    s(i) = 2*((rand > 0.5) - 0.5);
end

c = calcCost(W, s);