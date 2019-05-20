% % load('DB.mat')
% 
% cell2csv('my.csv',data)
% 
% %% Reading
% d1 = importdata('my.csv')
% vals = d1.data
% filenames = d1.textdata

function cell2csv(filename,cellArray,delimiter)
if nargin<3
    delimiter = ',';
end
datei = fopen(filename,'w');
for z=1:size(cellArray,1)
    for s=1:size(cellArray,2)
        
        var = eval(['cellArray{z,s}']);
        
        if size(var,1) == 0
            var = '';
        end
        
        if isnumeric(var) == 1
            var = num2str(var);
        end
        
        fprintf(datei,var);
        
        if s ~= size(cellArray,2)
            fprintf(datei,[delimiter]);
        end
    end
    fprintf(datei,'\n');
end
fclose(datei);
end