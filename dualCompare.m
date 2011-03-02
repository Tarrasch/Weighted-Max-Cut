function [out]=dualCompare(fileName, logFile)
% Example: result = problem2('mac/rudy/pw01_100.7', 'latest.log');
%
% You have to implement:
%
% random_assign()
% greedy_assign()
% sdp_assign()
% hier_sdp()
% 
fid = fopen(logFile, 'a+'); 
data = textread(fileName);
nV = data(1, 1);
nE = data(1, 2); 
edge_list = data(2:(nE+1), :); 
W = sparse(edge_list(:, 1), edge_list(:, 2), edge_list(:, 3), nV, nV, nE); 
W = 0.5 * (W+W'); 

out = W;

%% Now we calculate the c-values
cPrimal = primal(W);
cDual   = dual(W);

fprintf(fid, 'file: %s gives (P)=%g and (D)=%g.  (ratio = %g)\n', fileName, cPrimal, cDual, cDual/cPrimal);

fclose(fid);
end