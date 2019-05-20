function varargout = encryption(varargin)
% ENCRYPTION MATLAB code for encryption.fig
%      ENCRYPTION, by itself, creates a new ENCRYPTION or raises the existing
%      singleton*.
%
%      H = ENCRYPTION returns the handle to a new ENCRYPTION or the handle to
%      the existing singleton*.
%
%      ENCRYPTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCRYPTION.M with the given input arguments.
%
%      ENCRYPTION('Property','Value',...) creates a new ENCRYPTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before encryption_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to encryption_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help encryption

% Last Modified by GUIDE v2.5 16-May-2019 06:07:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @encryption_OpeningFcn, ...
                   'gui_OutputFcn',  @encryption_OutputFcn, ...
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


% --- Executes just before encryption is made visible.
function encryption_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to encryption (see VARARGIN)

% Choose default command line output for encryption
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes encryption wait for user response (see UIRESUME)
% uiwait(handles.figure1);
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);

% import the background image and show it on the axes

bg = imread('banner.jpg'); imagesc(bg);

% prevent plotting over the background and turn the axis off

set(ah,'handlevisibility','off','visible','off')

% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');

% --- Outputs from this function are returned to the command line.
function varargout = encryption_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function in1_Callback(hObject, eventdata, handles)
% hObject    handle to in1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in1 as text
%        str2double(get(hObject,'String')) returns contents of in1 as a double
% --- Executes during object creation, after setting all properties.
function in1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function in2_Callback(hObject, eventdata, handles)
% hObject    handle to in2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of in2 as text
%        str2double(get(hObject,'String')) returns contents of in2 as a double


% --- Executes during object creation, after setting all properties.
function in2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to in2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load DB
k = str2double(get(handles.in1,'string'));
si = str2double(get(handles.in2,'string'));
[fname,path]=uigetfile('choose encryption image');
I=imread([path,fname]);
r=256;
c=256;
if size(I, 3) > 1
  output = rgb2gray(I);
  else
    output = I;

end
%I=rgb2gray(I);
I=imresize(I,[r,c]);
%figure
%imshow(I)
key=zeros(1,r*c);
key(1)=k;
NEQR=zeros(r,c);
mm=1;
nn=1;
for i=1:2:r
    for j=1:2:c
      imgg=I(i:i+1,j:j+1);  
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
        NEQR(i:i+1,j:j+1)=N;
        
    end
end

%figure,imshow(uint8(NEQR))
%title('NEQR Representation')

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

%figure,imshow(uint8(NEQR1))
%title('NEQR Representation of key')

for i=1:r
    for j=1:c
      keyy=NEQR1(i,j);
      bin_key=de2bi(keyy,8,'left-msb');
      aa=NEQR(i,j);
      a=de2bi(aa,8,'left-msb');
       b(1)=xor(a(1),a(5));
        b(2)=xor(a(2),a(6)) ;
        b(3)=xor(a(3),a(7));
        b(4)=xor(a(4),a(8));
        b(5)=xor(a(5),b(4));
        b(6)=xor(a(6),b(3));
        b(7)=xor(a(7),b(2));
        b(8)=xor(a(8),b(1));
        a1=bin_key;
        b1(1)=xor(b(1),a1(1));
        b1(2)=xor(b(2),a1(2));
        b1(3)=xor(b(3),a1(3));
        b1(4)=xor(b(4),a1(4));
        b1(5)=xor(b(5),a1(5));
        b1(6)=xor(b(6),a1(6));
        b1(7)=xor(b(7),a1(7));
        b1(8)=xor(b(8),a1(8));
        encryption(i,j)=(b1(1)*2^7)+(b1(2)*2^6)+(b1(3)*2^5)+(b1(4)*2^4)+(b1(5)*2^3)+(b1(6)*2^2)+(b1(7)*2^1)+(b1(8)*2^0);
        b1=[]      
        
        
        
    end
end

 %figure  
 %imshow(uint8(encryption))   
 %title('encrypted')  
 axes(handles.axes2)
 imshow(uint8(encryption));title('Encrypted');
 handles.axes2=encryption;
 guidata(hObject,handles);
 
 hhh=randi([1,100])
 %hhhh=randi([1,1000000])
 filename = strcat(num2str(hhh),'.png');
%filename='siji.png'
 imwrite(uint8(encryption),filename)
 save gg encryption
 
 set(handles.edit5,'String',filename)
 
 dropbox_accesskey = 'qhC1cI_pQkAAAAAAAAAATWhHrEdOdJB0FXcYhbv9MffQc-St-8Twb94AYbwvqi7G ';

 
 status = uploadToDropbox(dropbox_accesskey,filename);
 delete(filename)
 disp(filename)
%  filename='a1.png';
%  si=.9;
%  k=1.2;
data=[data;[filename,string(si),string(k)]]
 
 cell2csv('my.csv',data)
 save DB data
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ui
function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
login


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit6,'String','');
set(handles.in1,'String','');
set(handles.in2,'String','');
set(handles.edit5,'String','');


%set(handles.figure,'CurrentAxes',handles.axes)
