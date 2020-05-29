function [frequency_vector, amplitude_vector] = fftSound(Fs, recordedAudio)

% Unilateral FFT of recordedAudio
fftmic                      = fft(recordedAudio);
P2                          = abs(fftmic/length(recordedAudio));
amplitude_vector            = P2(1:floor((length(recordedAudio)/2 + 1)));
amplitude_vector(2:end-1)   = 2*amplitude_vector(2:end-1);
frequency_vector            = (0:length(recordedAudio)/2)*Fs/length(recordedAudio);
