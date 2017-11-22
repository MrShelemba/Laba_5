%=== Завдання #2.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.dat');
eeg1 = detrend(eeg);
t = (0:length(eeg)-1)/fs;
figure(6)
plot(t, eeg);

