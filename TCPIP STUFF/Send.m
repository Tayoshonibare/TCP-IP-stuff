function varargout = Send(varargin)
% SEND MATLAB code for Send.fig
%      SEND, by itself, creates a new SEND or raises the existing
%      singleton*.
%
%      H = SEND returns the handle to a new SEND or the handle to
%      the existing singleton*.
%
%      SEND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEND.M with the given input arguments.
%
%      SEND('Property','Value',...) creates a new SEND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Send_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Send_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Send

% Last Modified by GUIDE v2.5 16-May-2015 22:29:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Send_OpeningFcn, ...
                   'gui_OutputFcn',  @Send_OutputFcn, ...
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


% --- Executes just before Send is made visible.
function Send_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Send (see VARARGIN)

% Choose default command line output for Send
handles.output = hObject;
axes (handles.LOGO);
imshow ('ssdc_logo.jpg');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Send wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Send_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sendtext_Callback(hObject, eventdata, handles)
% hObject    handle to sendtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sendtext as text
%        str2double(get(hObject,'String')) returns contents of sendtext as a double


% --- Executes during object creation, after setting all properties.
function sendtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sendtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in send.
function send_Callback(hObject, eventdata, handles)
data = get (handles.sendtext, 'String');
ip_adr = get (handles.ipadr, 'String');
ip_port = get (handles.ipport, 'String');
init_str = get (handles.cmd, 'String');
init_str(end+1) = cellstr ('Busy....');
 set (handles.cmd, 'String', init_str);
 pause (1);
 init_str(end+1) = cellstr (sendovertcpip (data, ip_adr, ip_port));
  set (handles.cmd, 'String', init_str);
  pause (0.5);
% hObject    handle to send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function cmd_Callback(hObject, eventdata, handles)
% hObject    handle to cmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cmd as text
%        str2double(get(hObject,'String')) returns contents of cmd as a double


% --- Executes during object creation, after setting all properties.
function cmd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ipadr_Callback(hObject, eventdata, handles)
% hObject    handle to ipadr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipadr as text
%        str2double(get(hObject,'String')) returns contents of ipadr as a double


% --- Executes during object creation, after setting all properties.
function ipadr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipadr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ipport_Callback(hObject, eventdata, handles)
% hObject    handle to ipport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ipport as text
%        str2double(get(hObject,'String')) returns contents of ipport as a double


% --- Executes during object creation, after setting all properties.
function ipport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ipport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
