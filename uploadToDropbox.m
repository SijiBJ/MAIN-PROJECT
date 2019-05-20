function output = uploadToDropbox(dropboxAccessToken,varargin)
% uploadToDropbox uses the dropboxAccessToken to upload a file to dropbox.
% If a fully qualified filename is specified as a second parameter, the 
% file will be uploaded. If no filename is provided, a dialog is presented 
% to allow you to select the file to be uploaded to Dropbox.
%
% To generate a Dropbox access token
%* Go to www.dropbox.com/developers/apps in a web browser
%* Click on "Create app"
%* Select "Dropbox API" and "App folder" for options (1) and (2)
%* Specify the name of the folder you want your files to show up in
%* Click on the "Generate Access Token" on the page and note down the access token

% Copyright 2016 The MathWorks, Inc.

% Check to input arguments
narginchk(1,2)

% If no file specified, pop up the dialog for the user to select one
if isequal(nargin,1)
    [dataFileName, dataFilePath] = uigetfile('*.*','Select file to upload to Dropbox');
    dataFile = fullfile(dataFilePath, dataFileName);
elseif isequal(nargin,2)
    dataFile = varargin{1};
end

% Check if input file exists
if ~exist(dataFile,'file')
    throw(MException('uploadToDropbox:fileNotFound','Input file was not found.'));
end

% Read file contents
try
    fid = fopen(dataFile, 'r');
    data = char(fread(fid));
    fclose(fid);
catch someException
    throw(addCause(MException('uploadToDropbox:unableToReadFile','Unable to read input file.'),someException));
end

% Generate the custom header
[~,remoteFName, remoteExt] = fileparts(dataFile);
headerFields = {'Authorization', ['Bearer ', dropboxAccessToken]};
headerFields{2,1} = 'Dropbox-API-Arg';
headerFields{2,2} = sprintf('{"path": "/%s%s", "mode": "add", "autorename": true, "mute": false}',remoteFName, remoteExt);
headerFields{3,1} = 'Content-Type';
headerFields{3,2} = 'application/octet-stream';
headerFields = string(headerFields);

% Set the options for WEBWRITE
opt = weboptions;
opt.MediaType = 'application/octet-stream';
opt.CharacterEncoding = 'ISO-8859-1';
opt.RequestMethod = 'post';
opt.HeaderFields = headerFields;

% Upload the file
try
    tempOutput = webwrite('https://content.dropboxapi.com/2/files/upload', data, opt);
catch someException
    throw(addCause(MException('uploadToDropbox:unableToUploadFile','Unable to upload file.'),someException));
end

% If user requested output, pass along WEBWRITE output
if isequal(nargout,1)
    output = tempOutput;
end;