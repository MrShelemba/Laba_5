
%=== Завдання #3.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-o2.dat)
fs = 100;
eeg_1 = load('eeg1-o2.dat');
eeg1 = detrend(eeg_1);
t_1 = (0:length(eeg1)-1)/fs;
figure(14)
subplot(2, 1, 1); plot(t_1, eeg1);
title('Графік сигналу ЕЕГ (eeg1-o2.dat)');
xlabel('Час'); ylabel('Амплітуда');

% Завантаження сигналу ЕЕГ файл (eeg1-c3.dat)
eeg_2 = load('eeg1-c3.dat');
eeg2 = detrend(eeg_2);
t_2 = (0:length(eeg2)-1)/fs;
subplot(2, 1, 2); plot(t_2, eeg2);
title('Графік сигналу ЕЕГ (eeg1-c3.dat)');
xlabel('Час'); ylabel('Амплітуда');

%=== Завдання #3.2 ===
% Виділення епохи сигналів ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 5.71;
t2 = 6.78;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(15)
subplot(2,1,1); plot(t_1(n1:n2), eeg1(n1:n2)), grid on;
title('Епоха сигналів ЕЕГ від 5,71 с до 6,78 с'); ylabel('Амплітуда');
subplot(2,1,2); plot(t_2(n1:n2), eeg2(n1:n2)), grid on;
xlabel('Час'); ylabel('Амплітуда');

%=== Завдання #3.3 ===
% Обчислення ВКФ сигналів ЕЕГ
vkf = xcorr(eeg1, eeg2, maxlag);
figure(16)
plot(vkf);
title('ВКФ сигналів ЕЕГ');
xlabel('Відліки'); ylabel('Значення');

%=== Завдання #3.4 ===
% Обчислення взаємної спектральної щільності сигналів ЕЕГ
Sx = abs(fft(vkf)/length(vkf));
Sy = Sx(1:length(vkf)/2+1);
Sy(2:end-1) = 2*Sy(2:end-1);
f = fs*(0:(length(vkf)/2))/length(vkf);
figure(17)
plot(f,Sy), grid on;
title('Взаємна спектральна щільність сигналів ЕЕГ');
xlabel('Частота'); ylabel('Значення');
