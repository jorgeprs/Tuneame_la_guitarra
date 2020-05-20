
function varargout = interfaz(varargin)
% INTERFAZ MATLAB code for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLESdd

% Edit the above text to modify the response to help interfaz

% Last Modified by GUIDE v2.5 19-May-2020 18:44:52

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
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
end 

%% varialbes globales 
function settunes(a, b, c, d, e, f)
global E2 A2 D3 G3 B3 E4;
E2 = a;
A2 = b;
D3 = c; 
G3 = d;
B3 = e;
E4 = f;
end

function r= getE2
global E2;
r= E2;
end
function r= getA2
global A2;
r= A2;
end
function r= getD3
global D3;
r= D3;
end
function r= getG3
global G3 ;
r= G3;
end
function r= getB3
global B3;
r= B3;
end
function r= getE4
global E4;
r= E4;
end


function setparameters(a, b, c)
global Fs duration nBits;
Fs          = a;
duration    = b;            
nBits       = c;
end 

function r= getFs
global Fs ;
r= Fs;
end
function r= getduration
global duration;
r= duration;
end
function r= getnBits
global nBits;
r= nBits;
end

function setAmplitude(x)
global A;
A  = x;
end 
function r= getAmplitude
global A;
r= A;
end

function settunning_frequency(x)
global tunning_frequency;
tunning_frequency  = x;
end 
function r= gettunning_frequency
global tunning_frequency;
r= tunning_frequency;
end

function setrecordingtime(x)
global recordingtime;
recordingtime  = x;
end 
function r= getrecordingtime
global recordingtime;
r= recordingtime;
end


function setdatamic(x)
global datamic;
datamic  = x;
end 
function r= getdatamic
global datamic;
r= datamic;
end

function sett(x)
global t;
t  = x;
end 
function r= gett
global t;
r= t;
end

function setf(x)
global f;
f  = x;
end 
function r= getf
global f;
r= f;
end

function setP1(x)
global P1;
P1  = x;
end 
function P1= getP1
global P1;
r= P1;
end


function setf2(x)
global f2;
f2  = x;
end 
function r= getf2
global f2;
r= f2;
end

function setP2(x)
global P2;
P2  = x;
end 
function r= getP2
global P2;
r= P2;
end

function setsignal(x)
global signal;
signal  = x;
end 

function r= getsignal
global signal;
r= signal;
end

%%

% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz (see VARARGIN)

% Choose default command line output for interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% Tone Frequencies [Hz]: https://pages.mtu.edu/~suits/notefreqs.html

settunes(82.41, 110, 146.83, 196, 246.94, 329.63);
% audiorecorder setup
setparameters(44100, 2, 16);



%visibility of the panel3
set(handles.uipanel3,'visible', 0);

%displayeando la imagen chida

axes(handles.axes3);
imshow(imread('george.jpg'));


end
% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



end
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%recuperar globales
E4= getE4();
B3= getB3();
G3= getG3();
D3= getD3();
A2= getA2();
E2= getE2();
Fs= getFs();
duration=getduration();
nBits=getnBits(); 
tunning_frequency=gettunning_frequency();
A= getAmplitude();
datamic= getdatamic();
t=gett();

selected_string= get(hObject,'value');
switch selected_string
    case 1
        settunning_frequency(E4);
        setAmplitude(5);                      
    case 2
        settunning_frequency(B3)
        setAmplitude(5);
    case 3
        settunning_frequency(G3)
        setAmplitude(10);
    case 4
        settunning_frequency(D3)
        setAmplitude(10);
    case 5
        settunning_frequency(A2)
        setAmplitude(20);
    case 6
        settunning_frequency(E2)
        setAmplitude(20);
    otherwise
        settunning_frequency(E4)
        tunning_frequency = E2;         % Default
        setAmplitude(5);
end


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%recuperar globales
E4= getE4();
B3= getB3();
G3= getG3();
D3= getD3();
A2= getA2();
E2= getE2();
Fs= getFs();
duration=getduration();
nBits=getnBits(); 
recordingtime=getrecordingtime();
tunning_frequency=gettunning_frequency();
A= getAmplitude();

sound(A.*sin(2.*pi.*tunning_frequency.*(0: ( 43520 * duration))./Fs),Fs);
pause(duration);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

pos= round(get(hObject, 'value')); 
setrecordingtime(pos);
texto= ['Recording Time: ' int2str(pos) ' [seg]'];
set(handles.text2, 'String', texto);
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end 


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on butto n press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%recuperar globales
E4= getE4();
B3= getB3();
G3= getG3();
D3= getD3();
A2= getA2();
E2= getE2();
Fs= getFs();
duration=getduration();
nBits=getnBits(); 
recordingtime=getrecordingtime();
tunning_frequency=gettunning_frequency();
A= getAmplitude();

[t, datamic] = recordSound(Fs, recordingtime, nBits);
sett(t);
setdatamic(datamic);


%Recuperar valor seleccionado de cuerda:

selected_string= get(handles.popupmenu1,'value');
switch selected_string
    case 1
        settunning_frequency(E4);
        setAmplitude(5);                      
    case 2
        settunning_frequency(B3)
        setAmplitude(5);
    case 3
        settunning_frequency(G3)
        setAmplitude(10);
    case 4
        settunning_frequency(D3)
        setAmplitude(10);
    case 5
        settunning_frequency(A2)
        setAmplitude(20);
    case 6
        settunning_frequency(E2)
        setAmplitude(20);
    otherwise
        settunning_frequency(E4)
        tunning_frequency = E2;         % Default
        setAmplitude(5);
end


% Processing
[f, P1] = fftSound(Fs, datamic);
setf(f);
setP1(P1);
[f2, P2] = fftSound(Fs, sin(2*pi*tunning_frequency*t));
setf2(f2);
setP2(P2);

axes(handles.axes1);
plot(f, P1);  
title("Audio's Amplitude Spectrum"); 
xlabel("f [Hz]"); 
ylabel("A"); 
grid on; 
xlim([0 3*10^3]);

axes(handles.axes2);
plot(f2, P2);  
title("Reference Amplitude Spectrum"); 
xlabel("f [Hz]"); 
ylabel("A"); 
grid on; 
xlim([0 3*10^3]);

fIndex = find(P1 == max(P1));
maxFValue = f(fIndex);

set(handles.text9,'String', maxFValue);
set(handles.text12,'String', fIndex);

%visibilidad
set(handles.uipanel3,'visible', 1);
set(handles.axes3,'visible', 0);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datamic= getdatamic();
sound (datamic);
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2

get(hObject,'Value')

end
% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3

get(hObject,'Value')

end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4

get(hObject,'Value')

end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
end


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
end

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

end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

end
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
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5

get(hObject,'Value')

end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


end


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6

end
% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

f=getf();
Fs=getFs();
signal=getP1();
original=getP1();

External_sound = get(handles.checkbox2,'value');
Audible_range = get(handles.checkbox3,'value');
Specific_range = get(handles.checkbox4,'value');
Specific_range2 = get(handles.checkbox5,'value');

%recordedAudio = bandpass(getaudiodata(mic),[80 350],Fs,'ImpulseResponse','iir','Steepness',0.95);

%Guitar frequencies -> 82.4 to 329.63

if(External_sound == 1)
    
signal=bandpass(signal,[0 80], Fs, 'Steepness', 0.95);
signal=bandpass(signal,[330 15000], Fs, 'Steepness', 0.95);

end 


if(Audible_range == 1)
    
signal=bandpass(signal,[20 20000], Fs, 'Steepness', 0.95);

end
    
  
if(Specific_range == 1)
    
F1=get(handles.edit1,'String');
F2=get(handles.edit3,'String');

f1=str2double(F1);
f2=str2double(F2);
 
[signal, DF] = bandpass(signal,[f1 f2], Fs);
%ysignal=filter1('bp',signal,'fc',[f1 f2],'fs',Fs);

end
    
if(Specific_range2 == 1)
    
F3=get(handles.edit4,'String');
F4=get(handles.edit5,'String');

f3=str2double(F3);
f4=str2double(F4);
    
signal=bandpass(signal,[f3 f4], Fs, 'Steepness', 0.95);

end 

% axis(handles.axes1);
% plot(f,signal);
% 
% title("Audio's Amplitude Spectrum");
% xlabel("f [Hz]"); 
% ylabel("A"); 
% xlim([0 3*10^3]);
% grid on;

end
