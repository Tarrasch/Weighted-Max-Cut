

files = dir('mac/rudy/pw*');

for i = 1:size(files)
    template(['mac/rudy/' files(i).name], 'logFile.txt');
end