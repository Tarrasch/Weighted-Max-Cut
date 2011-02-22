function [s, c]=SDPrelaxation(W)

n = size(W);

c = calcCost(W, s);