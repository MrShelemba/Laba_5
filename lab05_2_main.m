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
n1 = (t1*fs)+1;
n2 = (t2*fs)+1;
t = (0:length(eeg1)-1)/fs;
figure(7)
plot(t(n1:n2), eeg1(n1:n2)), grid on;

