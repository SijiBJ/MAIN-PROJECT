function varargout = decryption(varargin)
% DECRYPTION MATLAB code for decryption.fig
%      DECRYPTION, by itself, creates a new DECRYPTION or raises the existing
%      singleton*.
%
%      H = DECRYPTION returns the handle to a new DECRYPTION or the handle to
%      the existing singleton*.
%
%      DECRYPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECRYPTION.M with the given input arguments.
%
%      DECRYPTION('Property','Value',...) creates a new DECRYPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before decryption_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to decryption_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help decryption

% Last Modified by GUIDE v2.5 15-May-2019 19:33:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @decryption_OpeningFcn, ...
                   'gui_OutputFcn',  @decryption_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before decryption is made visible.
function decryption_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to decryption (see VARARGIN)

% Choose default command line output for decryption
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes decryption wait for user response (see UIRESUME)
% uiwait(handles.figure1);
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes

bg = imread('banner.jpg'); imagesc(bg);

% prevent plotting over the background and turn the axis off

set(ah,'handlevisibility','off','visible','off')

% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

% --- Outputs from this function are returned to the command line.
function varargout = decryption_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

    

function e1_Callback(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e1 as text
%        str2double(get(hObject,'String')) returns contents of e1 as a double


% --- Executes during object creation, after setting all properties.
function e1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e3_Callback(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e3 as text
%        str2double(get(hObject,'String')) returns contents of e3 as a double


% --- Executes during object creation, after setting all properties.
function e3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function e2_Callback(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e2 as text
%        str2double(get(hObject,'String')) returns contents of e2 as a double


% --- Executes during object creation, after setting all properties.
function e2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 dropbox_accesskey = 'qhC1cI_pQkAAAAAAAAAATWhHrEdOdJB0FXcYhbv9MffQc-St-8Twb94AYbwvqi7G ';
 filename = get(handles.edit4,'string');
 k = str2double(get(handles.e2,'string'));
 si = str2double(get(handles.e3,'string'));
 d1 = importdata('my.csv');
 vals = d1.data;

filenames = d1.textdata;
f=string(zeros(length(filenames),1));
for i=1:length(filenames)
   f(i,1)= filenames{i}
end
 data=[f vals]



% filename='96.png';
% si=2.3;
% k=0.2;
% load DB
flag=0
for i=1:size(data,1)
    
    if mean(unique(data(i,:)==[filename,string(si),string(k)]))==1
        flag=1
    end
    
end

if flag==1 
 downloadFromDropbox(dropbox_accesskey,{filename})
 
 %downloadFromDropbox(dropbox_accesskey,{filename})
 
 im = imread(filename);
% im=imread([pn,fn]);
[r,c,~] = size(im);
encryption=double(im);
decryption=zeros(r,c)
 b=[];
 b1=[];

key=zeros(1,r*c);
key(1)=k;

 for m=2:r*c
    key(m)=mod((si*(key(m-1)-(key(m-1)*key(m-1)))+(4-si)*((sin(pi*key(m-1)))/4)),1);
end
key1=zeros(1,r*c);
m=1;
for  i=2:r*c
    key1(m)=mod(abs(fix((key(m)-fix(key(m)))*10^8)),256);
    m=m+1;
end
% 
% encryption=zeros(r,c); 
key_enc=reshape(key1,[r,c]);



NEQR1=zeros(r,c);
mm=1;
nn=1;
ne=[]
for i=1:2:r
    for j=1:2:c
      imgg=key_enc(i:i+1,j:j+1);  
        N = zeros(2);
      inc = 1;
      for kk=1:2
          for hh=1:2
            
              g=imgg(kk,hh);
              x=kk-1;
              y=hh-1;
              
              
              a=de2bi(g,8,'left-msb');
              ne(1)=taffoli(taffoli(double(a(1)),double(y),double(~x)),double(y),double(x));
             ne(2)=taffoli(taffoli(taffoli(double(a(2)),double(~y),double(x)),double(~x),double(y)),x,y);
             ne(3)=taffoli(taffoli(double(a(3)),double(x),double(~y)),double(x),double(y));
             ne(4)=taffoli(a(4),double(y),double(x));
             ne(5)=taffoli(taffoli(a(5),y,~x),double(y),double(x));
             ne(6)=taffoli(taffoli(a(6),double(x),double(~y)),double(x),double(y));
             ne(7)=taffoli(a(7),y,x);
             ne(8)=taffoli(a(8),y,x);
             neqr1=(ne(1)*2^7)+(ne(2)*2^6)+(ne(3)*2^5)+(ne(4)*2^4)+(ne(5)*2^3)+(ne(6)*2^2)+(ne(7)*2^1)+(ne(8)*2^0);
              nn=nn+1;
              N(inc) = neqr1;
              inc = inc+1;
          end
          mm=mm+1;
      end
        N = N';
        NEQR1(i:i+1,j:j+1)=N;
        
    end
end

% figure,imshow(uint8(NEQR1))
% title('NEQR Representation of key')
 
 
 for i=1:r
    for j=1:c
      keyy=NEQR1(i,j);
      a1=de2bi(keyy,8,'left-msb');
      aa=encryption(i,j);
      a=de2bi(aa,8,'left-msb');
%            a1=bin_key;
        b1(1)=xor(a(1),a1(1));
        b1(2)=xor(a(2),a1(2));
        b1(3)=xor(a(3),a1(3));
        b1(4)=xor(a(4),a1(4));
        b1(5)=xor(a(5),a1(5));
        b1(6)=xor(a(6),a1(6));
        b1(7)=xor(a(7),a1(7));
        b1(8)=xor(a(8),a1(8));
      
     
      
      
      
      b(8)=xor(b1(8),b1(1));
      b(7)=xor(b1(7),b1(2));
      b(6)=xor(b1(6),b1(3));
      b(5)=xor(b1(5),b1(4));
      b(4)=xor(b1(4),b(8));
      b(3)=xor(b1(3),b(7));
      b(2)=xor(b1(2),b(6)) ;
      b(1)=xor(b1(1),b(5));
    
       
      
       
      
        
   
      
        decryption(i,j)=(b(1)*2^7)+(b(2)*2^6)+(b(3)*2^5)+(b(4)*2^4)+(b(5)*2^3)+(b(6)*2^2)+(b(7)*2^1)+(b(8)*2^0);
        
        
      
      
      
      
        
        
        
    end
end
%   figure  
%   imshow(uint8(decryption))   
%  title('decrypted neqr image') 
%   
 
 NEQR_retrieved=zeros(r,c);
mm=1;
nn=1;
ne=[];
for i=1:2:r
    for j=1:2:c
      imgg=decryption(i:i+1,j:j+1);  
        N = zeros(2);
      inc = 1;
      for kk=1:2
          for hh=1:2
            
              g=imgg(kk,hh);
              x=kk-1;
              y=hh-1;
              
              
              a=de2bi(g,8,'left-msb');
              ne(1)=taffoli(taffoli(double(a(1)),double(y),double(~x)),double(y),double(x));
             ne(2)=taffoli(taffoli(taffoli(double(a(2)),double(~y),double(x)),double(~x),double(y)),x,y);
             ne(3)=taffoli(taffoli(double(a(3)),double(x),double(~y)),double(x),double(y));
             ne(4)=taffoli(a(4),double(y),double(x));
             ne(5)=taffoli(taffoli(a(5),y,~x),double(y),double(x));
             ne(6)=taffoli(taffoli(a(6),double(x),double(~y)),double(x),double(y));
             ne(7)=taffoli(a(7),y,x);
             ne(8)=taffoli(a(8),y,x);
             neqr=(ne(1)*2^7)+(ne(2)*2^6)+(ne(3)*2^5)+(ne(4)*2^4)+(ne(5)*2^3)+(ne(6)*2^2)+(ne(7)*2^1)+(ne(8)*2^0);
              nn=nn+1;
              N(inc) = neqr;
              inc = inc+1;
          end
          mm=mm+1;
      end
        N = N';
        NEQR_retrieved(i:i+1,j:j+1)=N;
        
    end
end

% figure,imshow(uint8(NEQR_retrieved))
% title('NEQR retrived after decryption')
 axes(handles.axes2)
 imshow(uint8(NEQR_retrieved));title('Decrypted');
 handles.axes2=encryption;
 guidata(hObject,handles);
 imwrite(uint8(NEQR_retrieved),filename)
 save gg decryption
 else
    disp('wrong authentication')
end
 
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ui


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

login

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
