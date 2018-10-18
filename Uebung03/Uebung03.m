%% Time specifications:
Fs = 128;                   % samples per second
dt = 1/Fs;                  % seconds per sample
StopTime = 4;               % seconds
t = (0:dt:StopTime-dt)';    % seconds


f1 = sin(32*pi*t);
f2 = sin(32*pi*t)+0.3*cos(48*pi*t);

figure;
plot(t,f1);
plot(t,f2);