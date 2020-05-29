%% Clearing the working environment %%
clc; clear all; close all;
%% Initial Parameters %%
% Tone Frequencies [Hz]: https://pages.mtu.edu/~suits/notefreqs.html
E2 =  82.41; A2 = 110; D3 = 146.83; G3 = 196; B3 = 246.94; E4 = 329.63;
% audiorecorder setup
Fs          = 44100;                % Standard for Audio Recording
duration    = 2;                    % [s]
nBits       = 16;
% Tolerances
centsRange1 = 10;
centsRange2 = 20;
centsRange3 = 30;

%% String Selection Section %%
selected_string = input("Which string do you wish to tune (1 - 6)?\n");
switch selected_string
    case 1 
        tunning_frequency = E4;
        DCentsArray1 = ([327.7315, 329.0008333, 330.2701667, 331.5395]);
        DCentsArray2 = ([325.8439, 326.9319286, 328.0199571, 329.1079857, 330.1960143, 331.2840429, 332.3720714, 333.4601]);
        DCentsArray3 = ([323.9672, 335.3918]);        
        A = 5;                      
    case 2
        tunning_frequency = B3;
        A = 5;
        DCentsArray1 = ([245.5177, 246.9441, 248.3705]);
        DCentsArray2 = ([244.1037, 245.24482, 246.38594, 247.52706, 248.66818, 249.8093]);
        DCentsArray3 = ([242.6977, 251.2564]);       
    case 3
        tunning_frequency = G3;
        A = 10;
        DCentsArray1 = ([194.8711, 196.00325, 197.1354]);
        DCentsArray2 = ([193.7487, 194.880875, 196.01305, 197.145225, 198.2774]);
        DCentsArray3 = ([192.6328, 199.426]);        
    case 4
        tunning_frequency = D3;
        A = 10;
        DCentsArray1 = ([145.9843, 147.6806]);
        DCentsArray2 = ([145.1435, 146.2743667, 147.4052333, 148.5361]);
        DCentsArray3 = ([144.3075, 149.3965]);
    case 5
        tunning_frequency = A2;
        A = 20;
        DCentsArray1 = ([109.3664, 110.6372]);
        DCentsArray2 = ([108.7365, 110.0073, 111.2781]);
        DCentsArray3 = ([108.1103, 111.9228]);
    case 6
        tunning_frequency = E2;
        A = 20;
        DCentsArray1 = ([81.9354, 82.8874]);
        DCentsArray2 = ([81.4634, 83.3676]);
        DCentsArray3 = ([80.9942, 83.8505]);
    otherwise
        tunning_frequency = E2;         % Default
        A = 20;
        DCentsArray1 = ([81.9354, 82.8874]);
        DCentsArray2 = ([81.4634, 83.3676]);
        DCentsArray3 = ([80.9942, 83.8505]);
end

% Cents Tolerance
% c = 1200log_2(desiredNote/actualNote)
positiveRanges = [2^(centsRange1/1200)*tunning_frequency 2^(centsRange2/1200)*tunning_frequency 2^(centsRange3/1200)*tunning_frequency];
negativeRanges = [2^(-centsRange1/1200)*tunning_frequency 2^(-centsRange2/1200)*tunning_frequency 2^(-centsRange3/1200)*tunning_frequency];

% Finding next/previous note
if tunning_frequency == G3
    nextNote = tunning_frequency * (2^(4/12));          % 4 semitones of difference between G3 and B3
    previousNote = tunning_frequency / (2^(5/12));
elseif tunning_frequency == B3
    nextNote = tunning_frequency * (2^(5/12));
    previousNote = tunning_frequency / (2^(4/12));      % 4 semitones of difference between G3 and B3
else 
    previousNote = tunning_frequency / (2^(5/12));      % Any other interval is just 5 semitones
    nextNote = tunning_frequency * (2^(5/12));
end
%% Audio Output Section %%
% Give Audio Reference 
% sound(A*sin(2*pi*tunning_frequency*(0: ( 43520 * duration))./Fs),Fs);
% pause(duration);

%% Recording Section %%
% Recording 
[t, datamic] = recordSound(Fs, duration, nBits);
% Processing
[f, P1] = fftSound(Fs, datamic);
[f2, P2] = fftSound(Fs, sin(2*pi*tunning_frequency*t));

% Finding fundamental frequency of recorded audio (String)
fIndex = find(P1 == max(P1));
maxFValue = f(fIndex);
fprintf("String fundamental frequency is: %4.2f Hz\nDesired frequency is: %3.2f Hz\n", maxFValue, tunning_frequency);

%% Plotting Preparation Section %%
gcurve1 = 1.*(DCentsArray1)./DCentsArray1;
gcurve2 = 0.*(DCentsArray1);
DCAR = [DCentsArray1, fliplr(DCentsArray1)];
inBetween1 = [gcurve1, fliplr(gcurve2)];

ycurve1 = 1.*(DCentsArray2)./DCentsArray2;
ycurve2 = 0.*(DCentsArray2);
DCAR2 = [DCentsArray2, fliplr(DCentsArray2)];
inBetween2 = [ycurve1, fliplr(ycurve2)];

rcurve1 = 1.*(DCentsArray3)./DCentsArray3;
rcurve2 = 0.*(DCentsArray3);
DCAR3 = [DCentsArray3, fliplr(DCentsArray3)];
inBetween3 = [rcurve1, fliplr(rcurve2)];

%% Plotting Section %%
if maxFValue <= positiveRanges(1) && maxFValue >= negativeRanges(1)
    color = 'g';
elseif maxFValue <= positiveRanges(2) && maxFValue >= negativeRanges(2)
    color = 'y';
else
    color = 'r';
end
P3 = P1(floor(previousNote):ceil(nextNote));
vmax = max(P3);
P1 = P1./vmax;
figure("name", "Frequency Graphs");
plot(f, P1, color);
hold on
xline(negativeRanges(3), 'r','LineWidth', 2);
hold on
xline(negativeRanges(2), 'y', 'LineWidth', 2);
hold on
xline(negativeRanges(1), 'g', 'LineWidth', 2);
hold on
xline(positiveRanges(1), 'g', 'LineWidth', 2);
hold on 
xline(positiveRanges(2), 'y', 'LineWidth', 2);
hold on
xline(positiveRanges(3), 'r', 'LineWidth', 2);
fill(DCAR, inBetween1, 'green', 'FaceAlpha', 0.3);
fill(DCAR2, inBetween2, 'yellow', 'FaceAlpha', 0.3);
fill(DCAR3, inBetween3, 'red', 'FaceAlpha', 0.1);

title("Audio's Amplitude Spectrum"); xlabel("f [Hz]"); ylabel("|Y(f)|"); grid on; 
% Y limits selection
ylim([0 1]);
% ylim([0 (vmax*1.2)]);
% X limits selection
xlim([previousNote nextNote])
%  xlim([20 20*10^3]);
legend(': Spectrum',  sprintf(': Cent ±%d',centsRange3) , sprintf(': Cent ±%d',centsRange2), sprintf(': Cent ±%d',centsRange1));