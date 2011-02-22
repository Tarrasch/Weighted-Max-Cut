function [c]=calcCost(W, s)

n = size(W);
c = 0;
for i = 1:n 
    for j = 1:n 
        c = c + W(i, j)*(1-s(i)*s(j))*0.5 ;
    end    
end
