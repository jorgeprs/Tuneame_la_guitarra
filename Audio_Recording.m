%% Clearing the working environment %%
clc; clear all; close all;
%% Audio Recording/Plotting Module %%

% audiorecorder setup
Fs = 44100;                     % Standard for Audio Recording
duration = 3;                   % [s]
nBits = 16;                     % ADC. Revisar; https://www.ramelectronics.net/analog-digital.aspx                   
                                % https://kobaweb.ei.st.gunma-u.ac.jp/news/pdf/standard.pdf
% Recording and obtaining vectors
[t, datamic] = recordSound(Fs, duration, nBits);
[f, P1] = fftSound(Fs, datamic);

figure("name", "Audio Graphs");
subplot 141
plot(t, datamic); title("Input Audio"); xlabel("t [s]"); ylabel("A"); grid on; xlim([0 duration]); ylim([-1 1]);
subplot(1,4,[2 4]);
plot(f, P1);  title("Audio's Amplitude Spectrum"); xlabel("f [Hz]"); ylabel("A"); grid on; xlim([0 3*10^3]);