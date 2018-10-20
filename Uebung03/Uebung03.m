% Übung 1 %

Fs = 128; % Abtasten/s (sampling frequency)
dt = 1/Fs; % Zeitspanne Abtastung (sample time)
SingalDurationInSec = 4; % Dauer des Signal
countSamplePoints = SingalDurationInSec/dt; % Anzahl der Abtastsignale (Samples)
t = (0:dt:SingalDurationInSec-dt); % Zeitvektor (time vector)
f1 = sin(32*pi*t); %Signal f1
f2 = sin(32*pi*t) + 0.3*cos(48*pi*t); %Signal f1

% Analyse des ersten Signals

% Analyse von f1 mit fft
%   ACHTUNG: Wird verwenden nur die linke Hälfte der fft, denn diese ist 
%            symmetrisch von -Inf:+Inf. Das heißt aber auch, dass die 
%            Amplitude später mit 2 multipliziert werden muss, um das 
%            korrekte Ergebnis zu erhalten
Y = fft(f1);
Y = Y/countSamplePoints;

%x-Achse -> Umrechnen in Hz mit Fs/2 (bis zu 64 Hz)
f = Fs/2*linspace(0,1,countSamplePoints/2);

%y-Achse -> Amplitude, schneide Werte ab der Mitte ab (Spiegelung)
%        -> Frequenzen über den Betrag der fft Komponenten ermitteln
freqSpec = 2*abs(Y(1:countSamplePoints/2));

figure;
%Plot f1=sin(32*pi*t)
subplot(1,2,1)
%x=t, y
plot(t,f1)
title('f1(t)=sin(32*pi*t)')
xlabel('Time (s)');
ylabel('f1(t)');

% Plot Spectrum.
subplot(1,2,2)
plot(f,freqSpec) 
title('Frequency Spectrum (f1)')
xlabel('Frequency (Hz)')
ylabel('Amplitude')


% Analyse des zweiten Signals
Y = fft(f2);
Y = Y/countSamplePoints;
f = Fs/2*linspace(0,1,countSamplePoints/2);
freqSpec = 2*abs(Y(1:countSamplePoints/2));

figure;
subplot(1,2,1)
plot(t,f2)
title('f2(t) = sin(32*pi*t) + 0.3*cos(48*pi*t)')
xlabel('Time (s)');
ylabel('f2(t)');

subplot(1,2,2)
plot(f,freqSpec) 
title('Frequency Spectrum (f2)')
xlabel('Frequency (Hz)')
ylabel('Amplitude')