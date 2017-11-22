%=== Завдання #2.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
fs = 100;
eeg = load('eeg1-p4.dat');
eeg1 = detrend(eeg1);
t = (0:length(eeg1)-1)/fs;
figure(6)
plot(t, eeg1); title('Графік сигналу ЕКГ (eeg1-p4.dat)');
xlabel('Час'); ylabel('Амплітуда');

%=== Завдання #2.2 ===
% Виділення епохи сигналу ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 = 4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
figure(7)
plot(t(n1:n2), eeg1(n1:n2)), grid on;
title('Епоха сигналу ЕЕГ від 4,7 с до 5,8 с');
xlabel('Час'); ylabel('Амплітуда');

%=== Завдання #2.3 ===
% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag1 = fix(0.8*length(eeg1));
akf = xcorr(eeg1, maxlag1, 'unbiased');
figure(8)
plot(akf);
title('Незміщена оцінка АКФ сигналу ЕЕГ');
xlabel('Відліки'); ylabel('Амплітуда');

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
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Час'); ylabel('Амплітуда');


%=== Завдання #2.6 ===
% Завантаження сигналу ЕЕГ файл (eeg1-f3.dat)
eeg_ = load('eeg1-f3.dat');
eeg_1 = detrend(eeg_);
t_ = (0:length(eeg_1)-1)/fs;
figure(10)
plot(t_, eeg_1); title('Графік сигналу ЕЕГ (eeg1-f3.dat)');
xlabel('Час'); ylabel('Амплітуда');

% Виділення епохи сигналу ЕЕГ від t1 = 4,2 с до t2 = 4,96 с
t_1 = 4.2;
t_2 = 4.96;
n_1 = fix(t_1*fs)+1;
n_2 = fix(t_2*fs)+1;
figure(11)
plot(t_(n_1:n_2), eeg_1(n_1:n_2)), grid on;
title('Епоха сигналу ЕЕГ від 4,2 с до 4,96 с');
xlabel('Час'); ylabel('Амплітуда');

% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag2 = fix(0.8*length(eeg_1));
akf2 = xcorr(eeg_1, maxlag2, 'unbiased');
figure(12)
plot(akf2);
title('Незміщена оцінка АКФ сигналу ЕЕГ');
xlabel('Відліки'); ylabel('Амплітуда');

% Обчислення спектральної щільності сигналу
Sx2 = abs(fft(eeg_1)/length(eeg_1));
Sy2 = Sx2';
Syf2 = [Sy2(1),2.*Sy2(2:end-1),Sy2(end)];
Syn2 = fftshift(Syf2);
N2 = length(Sy2);
t_3 = (0:N2-1)/N2*fs;
figure(13)
plot(t_3, Syn2), grid on;
title('Спектральна щільність сигналу ЕЕГ');
xlabel('Час'); ylabel('Амплітуда');