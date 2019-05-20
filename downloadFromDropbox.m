function downloadFromDropbox(dropboxAccessToken,fileNames,varargin)
% downloadFromDropbox uses the dropboxAccessToken to download files from
% a dropbox api (with App folder type access).  
% 
% fileNames is a cell array of filenames to be downloaded  
% The filenames' path is with respect to the app folder in the dropbox.
% 
% Download path to the files is set to workspace location 
% by default but can also specified as a third parameter
% 
% To generate a Dropbox access token
% * Go to www.dropbox.com/developers/apps in a web browser
% * Click on "Create app"
% * Select "Dropbox API" and "App folder" for options (1) and (2)
% * Specify the name of the folder you want your files to show up in
% * Click on the "Generate Access Token" on the page and note down the access token

% Copyright 2018 The MathWorks, Inc

% Check to input arguments
narginchk(2,3);

% If no file specified, pop up the dialog for the user to select one
if isequal(nargin,2)
    %Set default downloadPath to workspace location
    downloadPath = pwd; 
elseif isequal(nargin,3)
    % If downloadPath is provided, check if the given path exists
    if ~exist(varargin{1},'dir')
        throw(MException('downloadFromDropbox:pathNotFound','Download path does not exist.'));
    else
        downloadPath = varargin{1};
    end    
end

for i = 1:length(fileNames)
    
    % Generate the custom header
    headerFields = {'Authorization', ['Bearer ', dropboxAccessToken]};
    headerFields{2,1} = 'Dropbox-API-Arg';
    headerFields{2,2} = sprintf('{"path": "/%s"}',fileNames{i});
    headerFields{3,1} = 'Content-Type';
    headerFields{3,2} = 'application/octet-stream';
    headerFields = string(headerFields);

    % Set the options for WEBREAD
    opt = weboptions;
    opt.MediaType = 'application/octet-stream';
    opt.CharacterEncoding = 'ISO-8859-1';
    opt.RequestMethod = 'post';
    opt.HeaderFields = headerFields;

    % Download the file
    try
        rawData = webread('https://content.dropboxapi.com/2/files/download', opt);
    catch someException
        throw(addCause(MException('downloadFromDropbox:unableToDownloadFile',strcat('Unable to download file:',fileNames{i})),someException));
    end

    fullPath = fullfile(downloadPath, fileNames{i});
    %Decode the files and save in the downloadPath
    try
        fileID = fopen(fullPath,'w');
        fwrite(fileID,rawData);
        fclose(fileID);
    catch someException
        throw(addCause(MException('downloadFromDropbox:unableToSaveFile', sprintf('Unable to save downloaded file %s in the downloadPath',fileNames{i})),someException));
    end

end
