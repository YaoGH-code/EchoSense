clear
clc
close all

% Get parameters for generating the signal and generate the signal
[fs, windowsize, rep, sos] = generateParameters;
signal = wgn(windowsize, 1, 0);
signal = repmat(signal, rep);
signal = signal(:, 1);

% Write it to the file
plot(signal);
audiowrite('white_noise.m4a', signal, fs);



