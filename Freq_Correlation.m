%% Clearing the working environment %%
clc; clear all; close all;
%% Frequency Correlation (?) Module %%
% Tone Frequencies [Hz]: https://pages.mtu.edu/~suits/notefreqs.html
E2 =  82.41; A2 = 110; D3 = 146.83; G3 = 196; B3 = 246.94; E4 = 329.63;
% audiorecorder setup
Fs          = 44100;                % Standard for Audio Recording
duration    = 2;                    % [s]
nBits       = 16;

% String selection
    % Amplitude changes because of ear perception of loudness depending on
    % pitch (the lower the pitch, the lower the "loudness")
selected_string = input("Which string do you wish to tune (1 - 6)?\n");
switch selected_string
    case 1
        tunning_frequency = E4;
        A = 5;                      
    case 2
        tunning_frequency = B3;
        A = 5;
    case 3
        tunning_frequency = G3;
        A = 10;
    case 4
        tunning_frequency = D3;
        A = 10;
    case 5
        tunning_frequency = A2;
        A = 20;
    case 6
        tunning_frequency = E2;
        A = 20;
    otherwise
        tunning_frequency = E2;         % Default
end
% Give Audio Reference 
% sound(A*sin(2*pi*tunning_frequency*(0: ( 43520 * duration))./Fs),Fs);
% pause(duration);
% Recording 
[t, datamic] = recordSound(Fs, duration, nBits);
% Processing
[f, P1] = fftSound(Fs, datamic);
[f2, P2] = fftSound(Fs, sin(2*pi*tunning_frequency*t));

% Finding fundamental frequency of recorded audio (String)
P4 = P1;
fIndex1 = find(P4 == max(P4));
P4(fIndex1-10:fIndex1+10) = [0];
fIndex2 = find(P4 == max(P4));
maxFValue1 = f(fIndex1);
maxFValue2 = f(fIndex2);
% fprintf("String fundamental frequency is: %4.2f Hz\nDesired frequency is: %3.2f Hz\n", maxFValue, tunning_frequency);
fprintf("Maximum Frequency #1: %4.2f Hz\nMaximum Frequency #2: %4.2f Hz",maxFValue1,maxFValue2);
% Plotting
figure("name", "Frequency Graphs");
subplot 211
plot(f, P1);  title("Audio's Amplitude Spectrum"); xlabel("f [Hz]"); ylabel("A"); grid on; xlim([0 3*10^3]);
subplot 212
plot(f2, P2);  title("Reference Amplitude Spectrum"); xlabel("f [Hz]"); ylabel("A"); grid on; xlim([0 3*10^3]);