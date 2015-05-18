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

% Last Modified by GUIDE v2.5 18-May-2015 13:15:01

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

%Setup Logo
axes (handles.LOGO);
imshow ('ssdc_logo.jpg');

%Set up UDP connection
instrreset;
global u1;
ipadr = get (handles.Lipadr, 'String');
ipport = str2double (get (handles.ipport, 'String')) ;
u1 = udp(ipadr, 'RemotePort', ipport, 'LocalPort', ipport);
fopen(u1);

%Start UDB Sreciever
global run;
run = timer('TimerFcn', {@UDP_checker, handles}, 'ExecutionMode','fixedRate', 'Period', 1);
start (run); 

%Setting IP ADRESS FOR FUTURE USE 
global IPaddress;
address = java.net.InetAddress.getLocalHost;
IPaddress = char(address.getHostAddress);

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
global u1; global run;
data = get (handles.sendtext, 'String');
ip_adr = get (handles.ipadr, 'String');     %Destianation Ip adress
ip_port = get (handles.ipport, 'String');   %Destination Port
init_str = get (handles.cmd, 'String');
init_str(end+1) = cellstr (sendovertcpip (data, u1));
set (handles.cmd, 'String', init_str);
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
% --- Executes on button press in Update.
function reset_Callback(hObject, eventdata, handles)
%Used to updated recieving Ip adress
instrreset;
global u1;
ipadr = get (handles.Lipadr, 'String');
ipport = str2double (get (handles.ipport, 'String')) ;
u1 = udp(ipadr, 'RemotePort', ipport, 'LocalPort', ipport);
fopen(u1);

global run;
stop (run);
start (run); 

function UDP_checker ( hObject, eventdata, handles)
global u1; global IPaddress; global prev_dump;
% bava = u1. BytesAvailable;  % FOR DEBUGING

if (u1.BytesAvailable > 0 )
    data_inport.text = fscanf (u1);
    data_inport.size = numel (data_inport.text);
    sendingip = data_inport.text( (data_inport.size - (numel(IPaddress)) ) :data_inport.size-1 );
    recip = IPaddress;
    
    if (~strcmp (sendingip, recip))
     init_str = get (handles.cmd, 'String');
     init_str(end+1) = cellstr (data_inport.text);
     set (handles.cmd, 'String', init_str);
    else
        data = data_inport.text (1: data_inport.size - (numel(IPaddress) + 1 + numel('**-From->')  ));
        [~, ~] = sendovertcpip( data, u1); 
%         end
    end
else
    return
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
strt_string ={'Start;'};
set (handles.cmd, 'String', strt_string);


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
stop (timerfind);
pause (0.5);
delete (timerfind);

