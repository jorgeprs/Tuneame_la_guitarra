function [time_vector, recordedAudio] = recordSound(Fs, duration, nBits)

% Obtaining Audio
mic = audiorecorder(Fs,nBits,1);
% disp('RECORDING');
record(mic, duration);
pause(duration);
% disp('RECORDING DONE');

recordedAudio = getaudiodata(mic);
% sound(recordedAudio, Fs);
time_vector = (0:length(recordedAudio)-1)./Fs;  % Time Vector 
end