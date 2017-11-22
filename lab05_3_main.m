
%=== Завдання #3.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-o2.dat)
fs = 100;
eeg_1 = load('eeg1-o2.dat');
eeg1 = detrend(eeg_1);
t = (0:length(eeg1)-1)/fs;
figure(14)
subplot(2, 1, 1); plot(t, eeg1);

% Завантаження сигналу ЕЕГ файл (eeg1-c3.dat)
eeg_2 = load('eeg1-c3.dat');
eeg2 = detrend(eeg_2);
t = (0:length(eeg2)-1)/fs;
subplot(2, 1, 2); plot(t, eeg2);

%=== Завдання #3.2 ===
% Виділення епохи сигналів ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 5.71;
t2 = 6.78;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(15)
subplot(2,1,1); plot(t(n1:n2), eeg1(n1:n2)), grid on;
subplot(2,1,2); plot(t(n1:n2), eeg2(n1:n2)), grid on;