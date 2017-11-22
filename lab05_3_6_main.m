%=== Завдання #3.6 ===
% Завантаження сигналу ЕЕГ файл (eeg1-f3.dat)
fs = 100;
eeg_1 = load('eeg1-f3.dat');
eeg1 = detrend(eeg_1);
t_1 = (0:length(eeg1)-1)/fs;
figure(22)
subplot(2, 1, 1); plot(t_1, eeg1);

% Завантаження сигналу ЕЕГ файл (eeg1-f4.dat)
eeg_2 = load('eeg1-f4.dat');
eeg2 = detrend(eeg_2);
t_2 = (0:length(eeg2)-1)/fs;
subplot(2, 1, 2); plot(t_2, eeg2);

% Виділення епохи сигналів ЕЕГ від t1 = 4,13 с до t2 = 4,96 с
t1 = 4.13;
t2 = 4.96;
t3 = 1.44;
t4 = 2.26;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
n3 = fix(t3*fs)+1;
n4 = fix(t4*fs)+1;
figure(23)
subplot(2,1,1); plot(t_1(n1:n2), eeg1(n1:n2)), grid on;
subplot(2,1,2); plot(t_2(n3:n4), eeg2(n3:n4)), grid on;

% Обчислення ВКФ сигналів ЕЕГ
maxlag = 250;
vkf = xcorr(eeg1, eeg2, maxlag);
figure(24)
plot(vkf);

% Обчислення взаємної спектральної щільності сигналів ЕЕГ
Sx = abs(fft(vkf)/length(vkf));
Sy = Sx';
Syf = [Sy(1),2.*Sy(2:end-1),Sy(end)];
Syn = fftshift(Syf);
N = length(Sy);
t3 = (0:N-1)/N*fs;
figure(25)
plot(t3, Syn), grid on;