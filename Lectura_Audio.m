%%
clc;
clear all;
close all;
%%
mic = audiorecorder (44100,8, 1);
disp 'Recording in 3...';
pause (1);
disp 'Recording in 2...';
pause (1);
disp 'Recording in 1...';
pause (1);
disp 'Recording...';
record (mic, 5);
pause (5);
disp 'Finished recording';

datamic = getaudiodata (mic);
sound (datamic);
fftmic = fft(datamic);

sizedatamic = size(datamic, 1);
tam = linspace(0, 5, sizedatamic);

figure("Name", "Audio Graphs");
subplot 121
plot (tam, datamic);
title("Input Audio");
xlabel("t [s]");
grid on

tam = linspace(0, 200000, sizedatamic); %Revisar escala de Eje x y unidades

subplot 122
plot (tam, abs(fftmic));
title("Input Audio FFT")
grid on