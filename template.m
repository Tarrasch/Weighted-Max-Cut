function [result]=template(fileName, logFile)
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
result = struct('method', [], 'cost', [], 'assignment', []); 
data = textread(fileName);
nV = data(1, 1);
nE = data(1, 2); 
edge_list = data(2:(nE+1), :); 
W = sparse(edge_list(:, 1), edge_list(:, 2), edge_list(:, 3), nV, nV, nE); 
W = 0.5 * (W+W'); 
c1 = 0;

%% Random assignment s = assignment, c = cost
%% This function has to be implemented 
[s, c] = random_assign(W); 
fprintf(fid, 'file: %s random_assign: %g\n', fileName, c);
result(1).method = 'random_assign'; result(1).assignment = s; result(1).cost = c;

%% Greedy assignment
%% This function has to be implemented 
[s, c] = greedy_assign(W); 
fprintf(fid, 'file: %s greedy_assign cost: %g\n', fileName, c);
result(2).method = 'greedy_assign'; result(2).assignment = s; result(2).cost = c;

%% SDP formulation
%% This function has to be implemented 
[s, c] = gw_assign(W); 
fprintf(fid, 'file: %s gw_assign cost: %g\n', fileName,  c);
result(3).method = 'gw_assign'; result(3).assignment = s; result(3).cost = c;

%% HIER SDP formulation
%% This function has to be implemented
% result(4).method = 'hier_sdp'; % result(4).assignment = s2; % result(4).cost = c2 ; 
% fprintf(fid, 'file: %s hier_sdp: %g\n', fileName,  c2);



fclose(fid);
end