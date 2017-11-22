
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