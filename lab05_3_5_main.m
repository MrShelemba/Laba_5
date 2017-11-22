%=== Завдання #3.5 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p3.dat)
fs = 100;
eeg_1 = load('eeg1-p3.dat');
eeg1 = detrend(eeg_1);
t_1 = (0:length(eeg1)-1)/fs;
figure(18)
subplot(2, 1, 1); plot(t_1, eeg1);
title('Графік сигналу ЕЕГ (eeg1-p3.dat)');
xlabel('Час'); ylabel('Амплітуда');

% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
eeg_2 = load('eeg1-p4.dat');
eeg2 = detrend(eeg_2);
t_2 = (0:length(eeg2)-1)/fs;
subplot(2, 1, 2); plot(t_2, eeg2);
title('Графік сигналу ЕЕГ (eeg1-p4.dat)');
xlabel('Час'); ylabel('Амплітуда');

% Виділення епохи сигналів ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(19)
subplot(2,1,1); plot(t_1(n1:n2), eeg1(n1:n2)), grid on;
title('Епоха сигналів ЕЕГ від 4,7 с до 5,8 с'); ylabel('Амплітуда');
subplot(2,1,2); plot(t_2(n1:n2), eeg2(n1:n2)), grid on;
xlabel('Час'); ylabel('Амплітуда');

% Обчислення ВКФ сигналів ЕЕГ
vkf = xcorr(eeg1, eeg2, maxlag);
figure(20)
plot(vkf);
title('ВКФ сигналів ЕЕГ');
xlabel('Відліки'); ylabel('Амплітуда');

% Обчислення взаємної спектральної щільності сигналів ЕЕГ
Sx = abs(fft(vkf)/length(vkf));
Sy = Sx';
Syf = [Sy(1),2.*Sy(2:end-1),Sy(end)];
Syn = fftshift(Syf);
N = length(Sy);
t3 = (0:N-1)/N*fs;
figure(21)
plot(t3, Syn), grid on;
title('Взаємна спектральна щільність сигналів ЕЕГ');
xlabel('Час'); ylabel('Амплітуда');