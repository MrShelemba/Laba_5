%=== Завдання #2.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.dat');
eeg1 = detrend(eeg1);
t = (0:length(eeg1)-1)/fs;
figure(6)
plot(t, eeg1);

%=== Завдання #2.2 ===
% Виділення епохи сигналу ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(7)
plot(t(n1:n2), eeg1(n1:n2)), grid on;

%=== Завдання #2.3 ===
% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag = fix(0.8*length(eeg1));
akf = xcorr(eeg1, eeg1, maxlag, 'unbiased');
figure(8)
plot(akf);

%=== Завдання #2.5 ===
% Обчислення спектральної щільності сигналу
Sx = abs(fft(eeg1)/length(eeg1));
Sy = Sx';
Syf = [Sy(1),2.*Sy(2:end-1),Sy(end)];
Syn = fftshift(Syf);
N = length(Sy);
t3 = (0:N-1)/N*fs;
figure(9)
plot(t3, Syn), grid on;


