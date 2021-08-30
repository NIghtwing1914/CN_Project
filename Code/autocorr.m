load('Siddhi_13_9.34_16(1).mat'); % This load statement varies depending on the dataset currently in use
tt=9.34; % This is the time elapsed for the current dataset
x=Acceleration.X;
y=Acceleration.Y;
z=Acceleration.Z;

mag = sqrt(sum(x.^2 + y.^2 + z.^2, 2));
Nmag = mag - mean(mag);
fs=100;
[autocor,lags] = xcorr(Nmag,fs,'coeff');

plot(lags/fs,autocor);
xlabel('Lag')
ylabel('Autocorrelation');


[pksh,lcsh] = findpeaks(autocor);
short = mean(diff(lcsh))/fs;

[pklg,lclg] = findpeaks(autocor,'MinPeakDistance',ceil(short)*fs,'MinPeakheight',std(Nmag));
long = mean(lclg)/fs;

step_count=2*tt/long;



