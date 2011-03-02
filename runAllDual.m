

files = dir('mac/rudy/pw*');

for i = 1:size(files)
    dualCompare(['mac/rudy/' files(i).name], 'dualLog.txt');
end