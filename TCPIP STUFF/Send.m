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

% Last Modified by GUIDE v2.5 18-May-2015 12:38:54

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

handles.output = hObject;
axes (handles.LOGO);
imshow ('ssdc_logo.jpg');
instrreset;
global u1;

ipadr = get (handles.Lipadr, 'String');
ipport = str2double (get (handles.ipport, 'String')) ;
 
u1 = udp(ipadr, 'RemotePort', ipport, 'LocalPort', ipport);
fopen(u1);


% Update handles structure
guidata(hObject, handles);





% --- Outputs from this function are returned to the command line.
function varargout = Send_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function sendtext_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function sendtext_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in send.
function send_Callback(hObject, eventdata, handles)
global u1;
data = get (handles.sendtext, 'String');
ip_adr = get (handles.ipadr, 'String');
ip_port = get (handles.ipport, 'String');
init_str = get (handles.cmd, 'String');
init_str(end+1) = cellstr ('Busy....');
 set (handles.cmd, 'String', init_str);
 pause (0.1);
 init_str(end+1) = cellstr (sendovertcpip (data, ip_adr, ip_port, u1));
  set (handles.cmd, 'String', init_str);
  pause (0.2);
function cmd_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function cmd_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ipadr_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function ipadr_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function ipport_Callback(hObject, eventdata, handles)
function ipport_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function Lipadr_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function Lipadr_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Listen.
function Listen_Callback(hObject, eventdata, handles)



   


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
instrreset;
global u1;

ipadr = get (handles.Lipadr, 'String');
ipport = str2double (get (handles.ipport, 'String')) ;
 
u1 = udp(ipadr, 'RemotePort', ipport, 'LocalPort', ipport);
fopen(u1);







% --- Executes on button press in listen.
function listen_Callback(hObject, eventdata, handles)
run = timer('TimerFcn',{@UDP_checker, handles}, 'ExecutionMode','fixedRate', 'Period', 1);
if (get (handles.listen, 'Value') == 1)
    start (run); 
else
    stop (run);
    delete (timerfind);
end

function UDP_checker ( hObject, eventdata, handles)   
global u1;
bytes_analiable =  u1.BytesAvailable
 if (u1.BytesAvailable > 0)
 data = fscanf (u1);
 
 init_str = get (handles.cmd, 'String');
 init_str(end+1) = cellstr (data);
 set (handles.cmd, 'String', init_str);
 else
     return  
 end
