%imports a series of CSV files as a cell of matrices
%arg files: exact or wild card for csv file name(s) without the extension
function [content] = ImportCSVs( files )
    wcard = strcat(files,'*.csv');
    lfiles = dir(wcard);
    nFiles=size(lfiles,1);
    content = cell(size(nFiles,1));
    for k=1:nFiles
       content{k,1} = xlsread(lfiles(k).name);
    end
end