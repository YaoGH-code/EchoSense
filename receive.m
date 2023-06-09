clear
clc
close all

[fs, windowsize, rep, sos] = generateParameters;

% Get a sample of sent sound which has a length of windowsize
[xsignal, fs1] = audioread('white_noise.m4a');
xsignal = xsignal(1:windowsize,1);

% Get a sample of received sound which has a length of windowsize
[ysignal, fs2] = audioread('r14.m4a');
start = fix(size(ysignal, 1) * (1/4));
ysignal = ysignal(start:start+windowsize-1);

% Do the fft
xfft = fft(xsignal);
yfft = fft(ysignal);

% Calaulate H bar and do the inverse fft
hbar = yfft ./ xfft;
h = ifft(hbar);

x = linspace(0, windowsize, windowsize);

% Get indexes for the two peaks
[b, e] = maxk(h, 1);
temp = h(:,1);
[b,next_peak] =  maxk(temp(e(1)+50:size(temp)), 1);
e2 = next_peak+e+50;

% Calcaulate the distance
distance = (e2 - e(1)) / fs * sos / 2;
plot(x, h)







