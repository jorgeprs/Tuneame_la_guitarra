function varargout = interfaz(varargin)
% INTERFAZ MATLAB code for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLB ACK in INTERFAZ.M with the given input arguments.
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

% Last Modified by GUIDE v2.5 30-May-2020 08:55:09

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

%% Variables Globales %% 
function setTunes(a, b, c, d, e, f)
global E2 A2 D3 G3 B3 E4;
E2 = a;
A2 = b;
D3 = c; 
G3 = d;
B3 = e;
E4 = f;
end

%% GET/SET NOTES %%
function r = getE2
global E2;
r = E2;
end
function r = getA2
global A2;
r = A2;
end
function r = getD3
global D3;
r = D3;
end
function r = getG3
global G3 ;
r = G3;
end
function r = getB3
global B3;
r = B3;
end
function r = getE4
global E4;
r = E4;
end
%% REFERENCE TONE %%
% Set/Get Reference Tone
function setAmplitude(x)
global A;
A  = x;
end 
function r = getAmplitude
global A;
r = A;
end
%% MIC PARAMETERS %%
% Set Mic parameters
function setParameters(a, b, c)
global Fs duration nBits;
Fs          = a;
duration    = b;            
nBits       = c;
end 
% Get Mic parameters
function r = getFs
global Fs ;
r = Fs;
end
function r = getDuration
global duration;
r = duration;
end
function r = getnBits
global nBits;
r = nBits;
end
% Obtained signal
function setDataMic(x)
global datamic;
datamic  = x;
end 
function r = getDataMic
global datamic;
r = datamic;
end
% Set/Get Recording Time
function setRecordingTime(x)
global recordingtime;
recordingtime  = x;
end 
function r = getRecordingTime
global recordingtime;
r = recordingtime;
end
%% TUNNING FREQUENCY%%
% Set/Get Tunning Frequency
function setTunning_frequency(x)
global tunning_frequency;
tunning_frequency  = x;
end 
function r = getTunning_frequency
global tunning_frequency;
r = tunning_frequency;
end
function r = getPreviousNote( )
global previousNote;
r = previousNote;
end
function setPreviousNote(note)
global G3 B3 previousNote;
if note == G3
    previousNote = note / (2^(5/12));
elseif note == B3
    previousNote = note / (2^(4/12));      % 4 semitones of difference between G3 and B3
else 
    previousNote = note / (2^(5/12));      % Any other interval is just 5 semitones
end
end 
function r = getNextNote( )
global nextNote;
r = nextNote;
end
function setNextNote(note)
global G3 B3 nextNote;
if note == G3
    nextNote = note * (2^(4/12));          % 4 semitones of difference between G3 and B3;
elseif note == B3
    nextNote = note * (2^(5/12));
else 
    nextNote = note * (2^(5/12));
end
end 
%% PLOTTING %%
% Set/Get Time Vector (?)
function setT(x)
global t;
t  = x;
end 
function r = getT()
global t;
r = t;
end

function setF(x)
global f;
f  = x;
end 
function r = getF()
global f;
r = f;
end




% Set/Get Amplitude Response Vector
function setP1(x)
global P1;
P1  = x;
end 
function P1 = getP1
global P1;
r = P1;
end



function setSignal(x)
global signal;
signal = x;
end 

function r = getSignal
global signal;
r = signal;
end

% cents Tolerance
function r = getCentsRange1
global centsRange1;
r = centsRange1;
end
function r = getCentsRange2
global centsRange2;
r = centsRange2;
end
function r = getCentsRange3
global centsRange2;
r = centsRange2;
end
function setCentsRange1()
global centsRange1
centsRange1 = 10;
end
function setCentsRange2()
global centsRange2
centsRange2 = 20;
end
function setCentsRange3()
global centsRange3
centsRange3 = 30;
end
% Set/Get positiveRanges 
function r = getPositiveRanges()
global positiveRanges;
r = positiveRanges; 
end

function setPositiveRanges()
global centsRange1 centsRange2 centsRange3 tunning_frequency positiveRanges
positiveRanges = [2^(centsRange1/1200)*tunning_frequency 2^(centsRange2/1200)*tunning_frequency 2^(centsRange3/1200)*tunning_frequency];
end
% Set/Get negativeRanges
function r = getNegativeRanges()
global negativeRanges;
r = negativeRanges; 
end

function setNegativeRanges()
global centsRange1 centsRange2 centsRange3 tunning_frequency negativeRanges
negativeRanges = [2^(-centsRange1/1200)*tunning_frequency 2^(-centsRange2/1200)*tunning_frequency 2^(-centsRange3/1200)*tunning_frequency];
end
% Set/Get DCentsArrays
function r = getDCentsArray1
global DCentsArray1
r = DCentsArray1;
end
function r = getDCentsArray2
global DCentsArray2
r = DCentsArray2;
end
function r = getDCentsArray3
global DCentsArray3
r = DCentsArray3;
end
function setDCentsArray1(array)
global DCentsArray1
DCentsArray1 = array;
end
function setDCentsArray2(array)
global DCentsArray2
DCentsArray2 = array;
end
function setDCentsArray3(array)
global DCentsArray3
DCentsArray3 = array;
end

% BLOQUE DE CÃ“DIGO DE HARDCODEO DE CHABELO
function setgcurve1()
global gcurve1
gcurve1 = 1.*(getDCentsArray1())./getDCentsArray1();
end
function r = getgcurve1()
global gcurve1
r = gcurve1;
end
function setgcurve2()
global gcurve2
gcurve2 = 0.*(getDCentsArray1());
end
function r = getgcurve2()
global gcurve2
r = gcurve2;
end
function setDCAR()
global DCAR
DCAR = [getDCentsArray1(), fliplr(getDCentsArray1())];
end
function r = getDCAR()
global DCAR
r = DCAR;
end
function setinBetween1()
global inBetween1
inBetween1 = [getgcurve1(), fliplr(getgcurve2())];
end
function r = getinBetween1()
global inBetween1
r = inBetween1;
end

function setycurve1()
global ycurve1
ycurve1 = 1.*(getDCentsArray2())./getDCentsArray2();
end
function r = getycurve1()
global ycurve1
r = ycurve1;
end
function setycurve2()
global ycurve2
ycurve2 = 0.*(getDCentsArray2());
end
function r = getycurve2()
global ycurve2
r = ycurve2;
end
function setDCAR2()
global DCAR2
DCAR2 = [getDCentsArray2(), fliplr(getDCentsArray2())];
end
function r = getDCAR2()
global DCAR2
r = DCAR2;
end
function setinBetween2()
global inBetween2
inBetween2 = [getycurve1(), fliplr(getycurve2())];
end
function r = getinBetween2()
global inBetween2
r = inBetween2;
end

function setrcurve1()
global rcurve1
rcurve1 = 1.*(getDCentsArray3())./getDCentsArray3();
end
function r = getrcurve1()
global rcurve1
r = rcurve1;
end
function setrcurve2()
global rcurve2
rcurve2 = 0.*(getDCentsArray3());
end
function r = getrcurve2()
global rcurve2
r = rcurve2;
end
function setDCAR3()
global DCAR3
DCAR3 = [getDCentsArray3(), fliplr(getDCentsArray3())];
end
function r = getDCAR3()
global DCAR3
r = DCAR3;
end
function setinBetween3()
global inBetween3
inBetween3 = [getrcurve1(), fliplr(getrcurve2())];
end
function r = getinBetween3()
global inBetween3
r = inBetween3;
end
% BLOQUE DE CÃ“DIGO DE HARDCODEO DE CHABELO

function r = getmaxFValue()
global maxFValue
r = maxFValue;
end

function setmaxFValue(value)
global maxFValue
maxFValue = value;
end

function r = getXInterval()
global XInterval
r = XInterval;
end
function setXInterval(vector)
global XInterval
XInterval = vector;
end

function r = getYInterval()
global YInterval
r = YInterval;
end
function setYInterval(vector)
global YInterval
YInterval = vector;
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

setTunes(82.41, 110, 146.83, 196, 246.94, 329.63);
% audiorecorder setup
setParameters(44100, 2, 16);

% Default values
setTunning_frequency(329.63)
setAmplitude(5);
setCentsRange1();
setCentsRange2();
setCentsRange3();
setNextNote(getTunning_frequency());
setPreviousNote(getTunning_frequency());
setPositiveRanges();
setNegativeRanges();
setDCentsArray1(([327.7315, 329.0008333, 330.2701667, 331.5395]));
setDCentsArray2(([325.8439, 326.9319286, 328.0199571, 329.1079857, 330.1960143, 331.2840429, 332.3720714, 333.4601]));
setDCentsArray3(([323.9672, 335.3918]));
setDCAR();
setDCAR2();
setDCAR3();
setgcurve1();
setgcurve2();
setrcurve1();
setrcurve2();
setycurve1();
setycurve2();
setinBetween1();
setinBetween2();
setinBetween3();
setXInterval([0 2*10^3]);
setYInterval([0 0.5]);

%visibility of the panel3
set(handles.uipanel3,'visible', 0);

axes(handles.axes3);
imshow(imread('george.jpg'));
title("Tune - up a Musician!");
xlabel('In memory of our dear George'); ylabel('"With every mistake we must surely be learning".');

axes(handles.axes5);
imshow(imread('monty.jpg'));
ylabel("Well Done Guys!!");

end
% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end

%% TONE configuration %%
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
E4 = getE4();
B3 = getB3();
G3 = getG3();
D3 = getD3();
A2 = getA2();
E2 = getE2();

selected_string = get(hObject,'value');
switch selected_string
    case 1
        setTunning_frequency(E4);
        setDCentsArray1(([327.7315, 329.0008333, 330.2701667, 331.5395]));
        setDCentsArray2(([325.8439, 326.9319286, 328.0199571, 329.1079857, 330.1960143, 331.2840429, 332.3720714, 333.4601]));
        setDCentsArray3(([323.9672, 335.3918]));
        setAmplitude(5);                      
    case 2
        setTunning_frequency(B3);
        setDCentsArray1(([245.5177, 246.9441, 248.3705]));
        setDCentsArray2(([244.1037, 245.24482, 246.38594, 247.52706, 248.66818, 249.8093]));
        setDCentsArray3(([242.6977, 251.2564]));
        setAmplitude(5);
    case 3
        setTunning_frequency(G3);
        setDCentsArray1(([194.8711, 196.00325, 197.1354]));
        setDCentsArray2(([193.7487, 194.880875, 196.01305, 197.145225, 198.2774]));
        setDCentsArray3(([192.6328, 199.426]));
        setAmplitude(10);
    case 4
        setTunning_frequency(D3);     
        setDCentsArray1(([145.9843, 147.6806]));
        setDCentsArray2(([145.1435, 146.2743667, 147.4052333, 148.5361]));
        setDCentsArray3(([144.3075, 149.3965]));
        setAmplitude(10);
    case 5
        setTunning_frequency(A2);    
        setDCentsArray1(([109.3664, 110.6372]));
        setDCentsArray2(([108.7365, 110.0073, 111.2781]));
        setDCentsArray3(([108.1103, 111.9228]));
        setAmplitude(20);
    case 6
        setTunning_frequency(E2)       
        setDCentsArray1(([81.9354, 82.8874]));
        setDCentsArray2(([81.4634, 83.3676]));
        setDCentsArray3(([80.9942, 83.8505]));
        setAmplitude(20);
    otherwise
        setTunning_frequency(E2);         % Default    
        setDCentsArray1(([81.9354, 82.8874]));
        setDCentsArray2(([81.4634, 83.3676]));
        setDCentsArray3(([80.9942, 83.8505]));
        setAmplitude(5);
end
setNextNote(getTunning_frequency());
setPreviousNote(getTunning_frequency());
setPositiveRanges();
setNegativeRanges();

setDCAR();
setDCAR2();
setDCAR3();
setgcurve1();
setgcurve2();
setrcurve1();
setrcurve2();
setycurve1();
setycurve2();
setinBetween1();
setinBetween2();
setinBetween3();

end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes on button press in PLAY REFERENCE TONE.
function toneButton_Callback(hObject, eventdata, handles)
Fs = getFs();
duration = getDuration();
tunning_frequency = getTunning_frequency();
A = getAmplitude();
sound(A.*sin(2.*pi.*tunning_frequency.*(0: ( 43520 * duration))./Fs),Fs);
pause(duration);
end

%% RECORDING configuration %%
% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
pos = round(get(hObject, 'value')); 
setRecordingTime(pos);
texto = ['Recording Time: ' int2str(pos) ' [seg]'];
set(handles.text2, 'String', texto);
end

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
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


% --- Executes on button press START RECORDING.
function recordButton_Callback(hObject, eventdata, handles)
% Variables Globales
Fs = getFs();
nBits = getnBits(); 
setRecordingTime(get(handles.slider2,'Value')); %correcciÃ³n de bug de inicio
recordingtime = getRecordingTime();
tunning_frequency = getTunning_frequency();
set(hObject,'String', '3');
pause (0.5);
set(hObject,'String', '2');
pause (0.5);
set(hObject,'String', '1');
pause (0.5);
set(hObject,'String', 'Recording...');
[t, datamic] = recordSound(Fs, recordingtime, nBits);
set(hObject,'String', 'Recording DONE');
pause(1);
setT(t);
setDataMic(datamic);
set(hObject,'String', 'Start Recording');
% Processing
[f, P1] = fftSound(Fs, datamic);
setF(f);
setP1(P1);


P1t = P1;
% ARMÓNICO DEFINITIVO
fIndex1 = find(P1t == max(P1t));
if fIndex1 > 10
    P1t(fIndex1-10:fIndex1+10) = [0];
else
    P1t(1:fIndex1+9) = [0];
end
fIndex2 = find(P1t == max(P1t));
if fIndex2 > 10
    P1t(fIndex2-10:fIndex2+10) = [0];
else
    P1t(1:fIndex2+9) = [0];
end
fIndex3 = find(P1t == max(P1t));
maxFValue1 = f(fIndex1);
maxFValue2 = f(fIndex2);
maxFValue3 = f(fIndex3);

if ( (maxFValue1 > getPreviousNote()) && (maxFValue1 < getNextNote()))
   setmaxFValue(maxFValue1);
elseif ( (maxFValue2 > getPreviousNote()) && (maxFValue2 < getNextNote()))
   setmaxFValue(maxFValue2);
elseif ( (maxFValue3 > getPreviousNote()) && (maxFValue3 < getNextNote()))
   setmaxFValue(maxFValue3);
else
   setmaxFValue(maxFValue1);  
end

positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1(),color);
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off

distance = 1200*log2(getTunning_frequency()/getmaxFValue());
% Note Frequency
set(handles.text9,'String', sprintf('%3.2f',getTunning_frequency()));
% Played String Frequency
set(handles.text12,'String', sprintf('%3.2f',getmaxFValue()));
% Distance in cents
set(handles.text21,'String', sprintf('%3.0f',distance()));
if distance > 0
set(handles.text24,'String', 'UP');
elseif distance < 0
set(handles.text24,'String', 'DOWN');
else
set(handles.text24,'String', 'OK');
end

% Visibilidad
set(handles.uipanel3,'visible', 1);
set(handles.axes3,'visible', 0);
end

%% ANALYSIS %%
% --- Executes on button press in YOUR SOUND.
function soundButton_Callback(hObject, eventdata, handles)
sound (getDataMic(), getFs());
end

% --- Executes on button press in normalizedButton.
function normalizedButton_Callback(hObject, eventdata, handles)
setYInterval([0 1]);
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1()./max(getP1()),color);  
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off
end

% --- Executes on button press in adjustedButton.
function adjustedButton_Callback(hObject, eventdata, handles)
setYInterval([0 max(getP1())]);
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1(),color);  
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off
end

% --- Executes on button press in specificRangeButton.
function specificRangeButton_Callback(hObject, eventdata, handles)
setXInterval([getPreviousNote() getNextNote()]);
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1(),color);  
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off
end
% --- Executes on button press in audibleRangeButton.
function audibleRangeButton_Callback(hObject, eventdata, handles)
setXInterval([20 20*10^3]);
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1(),color);  
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off
end

% --- Executes on button press in automatic.
function automaticButton_Callback(hObject, eventdata, handles)
setXInterval([0 2*10^3]); setYInterval([0 max(getP1())]);
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(getF(), getP1(),color);  
hold on; xline(negativeRanges(3), 'r','LineWidth', 2);
hold on; xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on; xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on; xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on; xline(positiveRanges(3), 'r', 'LineWidth', 2);
a = getDCAR();
b = getinBetween1();
c = getDCAR2();
d = getinBetween2();
e = getDCAR3();
f = getinBetween3();
fill(e, f, 'red', 'FaceAlpha', 0.1);
fill(c, d, 'yellow', 'FaceAlpha', 0.3);
fill(a, b, 'green', 'FaceAlpha', 0.3);
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
legend(': Spectrum',  ': Cent ±30', sprintf(': Cent ±%d',getCentsRange2()), sprintf(': Cent ±%d',getCentsRange1()));
xlim(getXInterval()); ylim(getYInterval());
hold off
end

% --- Executes on button press in cleanButton.
function cleanButton_Callback(hObject, eventdata, handles)
positiveRanges = getPositiveRanges();
negativeRanges = getNegativeRanges();
color = colorSelector(getmaxFValue(),getPositiveRanges(),getNegativeRanges());
axes(handles.axes1);
plot(zeros(length(getF()),1), zeros(length(getP1()),1),color);  
title("Audio's Magnitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
xlim(getXInterval()); ylim(getYInterval());
hold off
end
%% FILTERS configuration %%
% --- Executes on button press in EXTERNAL SOUNDS.
function externalSounds_Callback(hObject, eventdata, handles)
% get(hObject,'Value')
end
% --- Executes on button press in AUDIBLE RANGE.
function audibleRange_Callback(hObject, eventdata, handles)
% get(hObject,'Value')
end

% --- Executes on button press in SPECIFIC RANGE.
function specificRange_Callback(hObject, eventdata, handles)
% get(hObject,'Value')
end
% --- Executes on button press in SPECIFIC RANGE (2).
function specificRange2_Callback(hObject, eventdata, handles)
% get(hObject,'Value')
end

% --- Executes on button press in applyFilters.
function applyFilters_Callback(hObject, eventdata, handles)
External_sound = get(handles.externalSounds,'value');
Audible_range = get(handles.audibleRange,'value');
Specific_range = get(handles.specificRange,'value');
Specific_range2 = get(handles.specificRange2,'value');
stop = str2double(get(handles.edit7,'String'));
limI = str2double(get(handles.edit1,'String'));
limS = str2double(get(handles.edit3,'String'));
limI2 = str2double(get(handles.edit4,'String'));
limS2 = str2double(get(handles.edit5,'String'));

Fs = getFs();
datamic = getDataMic();

if(External_sound == 1 && stop < 82)
limI = 82;
limS = 330;
SR = Filter_Band(limI-stop,limI,limS,limS+stop,Fs);
elseif(External_sound == 1)
limI = 82;
limS = 330;
SR = Filter_Band(1,limI,limS,limS+stop,Fs); 
end 
if(Audible_range == 1 && stop < 20)
limI = 20;
limS = 20*10^3;
SR = Filter_Band(limI-stop,limI,limS,limS+stop,Fs);
elseif(Audible_range == 1)
limI = 20;
limS = 20*10^3;
SR = Filter_Band(1,limI,limS,limS+stop,Fs); 
end 
if(Specific_range == 1 && limI > stop)
SR = Filter_Band(limI - stop,limI,limS,limS + stop,Fs); 
elseif(Specific_range == 1)
SR = Filter_Band(1,limI,limS,limS + stop,Fs);    
end
    
if(Specific_range2 == 1 && limI2 > stop)
    SR = Filter_Band(limI2 - stop,limI2,limS2,limS2 + stop,Fs); 
elseif(Specific_range2 == 1)
    SR = Filter_Band(limI2 - stop,limI2,limS2,limS2 + stop,Fs); 
end 

signal = filter(SR,datamic);
[f2, A2] = fftSound(Fs, signal);

axes(handles.axes2);
% plot(f2,A2.*500, 'k');
plot(f2,A2, 'k');
title("Filtered Magnitude Spectrum"); xlim(getXInterval()); ylim(getYInterval());
% ylim([0 max(A2)]);
xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on;

end
function edit1_Callback(hObject, eventdata, handles)
end
function edit3_Callback(hObject, eventdata, handles)
end
function edit4_Callback(hObject, eventdata, handles)
end
function edit5_Callback(hObject, eventdata, handles)
end
function edit7_Callback(hObject, eventdata, handles)
end
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
%% OPTIONS %%
% --------------------------------------------------------------------
function Project_Callback(hObject, eventdata, handles)
% hObject    handle to Project (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function Credits_Callback(hObject, eventdata, handles)
% hObject    handle to Credits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('RollCredits.txt');

end

%% ?? %%
% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
end


function setTcor(x)
global tcor;
tcor  = x;
end 
function r = getTcor()
global tcor;
r = tcor;
end
% Set/Get Frequency Vector
function setdatamiccor(x)
global datamiccor;
datamiccor = x;
end 
function r = getdatamiccor()
global datamiccor;
r = datamiccor;
end


function setF2(x)
global f2;
f2 = x;
end 
function r = getF2
global f2;
r = f2;
end
function setP2(x)
global P2;
P2  = x;
end 
function r = getP2
global P2;
r= P2;
end

function r = getmaxF2Value()
global maxF2Value
r = maxF2Value;
end

function setmaxF2Value(value)
global maxF2Value
maxF2Value = value;
end

function r = getynorm()
global ynorm
r = ynorm;
end

function setynorm(value)
global ynorm
ynorm = value;
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
Fs = getFs();
nBits = getnBits(); 
setRecordingTime(get(handles.slider2,'Value'));
recordingtime = getRecordingTime();
tunning_frequency = getTunning_frequency();

tcor= getTcor();

set(hObject,'String', '3');
pause (0.25);
set(hObject,'String', '2'); 
pause (0.25);
set(hObject,'String', '1');
pause (0.25);
set(hObject,'String', 'Recording...');
[tcor, datamiccor] = recordSound(Fs, recordingtime, nBits);
set(hObject,'String', 'Recording DONE');
pause(1);
setTcor(tcor);
setdatamiccor(datamiccor);
set(hObject,'String', 'Correlate');

[f2, P2] = fftSound(Fs, datamiccor);
setF2(f2);
setP2(P2);

P2t = P2;
% ARMÃ“NICO DEFINITIVO
fIndex1 = find(P2t == max(P2t));
if fIndex1 > 10
    P2t(fIndex1-10:fIndex1+10) = [0];
else
    P2t(1:fIndex1+9) = [0];
end
fIndex2 = find(P2t == max(P2t));
if fIndex2 > 10
    P2t(fIndex2-10:fIndex2+10) = [0];
else
    P2t(1:fIndex2+9) = [0];
end
fIndex3 = find(P2t == max(P2t));
maxFValue1 = f2(fIndex1);
maxFValue2 = f2(fIndex2);
maxFValue3 = f2(fIndex3);

if ( (maxFValue1 > getPreviousNote()) && (maxFValue1 < getNextNote()))
   setmaxF2Value(maxFValue1);
elseif ( (maxFValue2 > getPreviousNote()) && (maxFValue2 < getNextNote()))
   setmaxF2Value(maxFValue2);
elseif ( (maxFValue3 > getPreviousNote()) && (maxFValue3 < getNextNote()))
   setmaxF2Value(maxFValue3);
else
   setmaxF2Value(maxFValue1);  
end

maxF2Value= getmaxF2Value();
maxFValue= getmaxFValue();

set(handles.text29,'String',(maxFValue-maxF2Value));
set(handles.text31,'String',(maxF2Value));


%% plotear sobre una distribución binomial
selected_string = get(handles.popupmenu1,'value');
switch selected_string
    case 1
        Stddev= 1.18;    
    case 2
        Stddev= 1.15;
    case 3
        Stddev= 1.19;
    case 4
        Stddev= 1.25;
    case 5
        Stddev= 0.99;
    case 6
        Stddev= 1.18;
    otherwise
        Stddev= 1.18;  
end
%la frecuencia ideal será la media
munorm= getTunning_frequency();
%la función normal estará dada por: 
dvector= 0:length(P2);
ynorm =1*normpdf(dvector,munorm ,Stddev);
setynorm(ynorm);
%%
axes(handles.axes2);
hold off;
plot(f2, P2, 'k');
hold on; 
plot( ynorm, 'm');
title("New sound Frequency"); 
xlabel("f [Hz]"); ylabel("A"); 
grid on;
xlim(getXInterval()); ylim(getYInterval());


set(handles.pushbutton17,'Visible', 1);
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
axes(handles.axes2);
hold off;
f2= getF2();
f1= getF();

maxlen = max(length(f1), length(f2));
f1 = [zeros(1,maxlen - length(f1)), f1];
f2 = [zeros(1,maxlen - length(f2)), f2];
r =var(f1);
rr=var(f2);
rrr=cov(f1,f2);
rrrr=cov(f1,f2, 1);
rrrrr=corrcoef(f1,f2);
l1= 'The covariance measures the correlation between the first sample and the second one';
l2='The covariance and the correlation coefficient of two random variables are measures of the linear dependence between the random variables';
l3= 'First we obtain the Covariance Matrix of the two received signals, which is formed by the next elements:';
l4=[ 'The variance of the first signal  is: ' sprintf('%0.5g', r) '  ' ];
l5=[ 'The variance of the second signal  is: ' sprintf('%0.5g', rr) '  ' ];
l6=[ 'The covariance of both  is: ' sprintf('%0.5g', rrr(3)) '  ' ];
l7= 'Multiplying either X or Y by a large number will increase the covariance so we need to normalize the covariance to measure the correlation in an absolute scale';
l8=[ 'The normalized covariance of both signals  is: ' sprintf('%0.5g', rrrr(3)) '  ' ];
l9= 'The correlation coefficient is a number that is at most 1 in magnitude';
l10=[ 'The correlation coefficient of both signals is: ' sprintf('%0.5g', rrrrr(3)) '  ' ];

l11= 'The correlation will be graphed on the second AXES';
uiwait(msgbox({l1; l2; l3; l4; l5; l6; l7; l8; l9; l10; l11;} ,'Random processes !'));
dum= xcorr(f1,f2);
plot (dum, 'k');
title("Correlation of the two recorded signals"); 
xlabel("n"); ylabel("A"); grid on; 
xlim auto
ylim auto
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
f2 = getF2(); P2 = getP2(); ynorm=getynorm();
axes(handles.axes2);
hold off;
plot(f2, P2./max(P2),'k');
hold on; 
plot(ynorm,'m');
title("New sound Frequency"); 
xlabel("f [Hz]"); ylabel("A"); 
grid on;
xlim(getXInterval()); ylim(getYInterval());
end
