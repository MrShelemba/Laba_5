function lab05_main
%=== Дисципліна: Основи обробки біомедичної інформації ===
%--- Лабораторна робота #5 КОРЕЛЯЦІЙНИЙ АНАЛІЗ БІОСИГНАЛІВ
%
% Використовуйте файли даних: 
%   eeg1-c3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-f3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-f4.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-p3.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-p4.dat - сигнал ЕЕГ, fs = 100 Гц
%   eeg1-o2.dat - сигнал ЕЕГ, fs = 100 Гц
%----------------------------------------------------------

clear, clc, close all
disp('Лабораторна робота #5')
disp('КОРЕЛЯЦІЙНИЙ АНАЛІЗ БІОСИГНАЛІВ')
disp('Виконав:  , група ... ННІІДС')

%=== Завдання #1.1 ===
% Моделювання стаціонарного випадкового процесу
fs = 200;
f0 = 5;
A = 0.5;
D = 0.25;
n = 1000;
t = (0:(n-1))/fs; % вектор часу
s = A*cos(2*pi*f0*t);
v = randn(size(t))*sqrt(D);
x = s + v;

% Графіки отриманих сигналів
figure(1)
subplot(3, 1, 1), plot(t, x);
title('Стаціонарний випадковий процес'); 
ylim([-2 2]); 
ylabel('Амплітуда');
subplot(3, 1, 2), plot(t, s);
title('Косинусоїда'); ylabel('Амплітуда')
subplot(3, 1, 3), plot(t, v);
title('Нормальний білий шум'); xlabel('Час'); ylabel('Амплітуда');

%=== Завдання #1.2 ===
% Обчислення оцінки дисперсії шуму, дисперсії сигналу та відношення шум/сигнал
fprintf('Дисперсія сигналу = %4.3g\n', var(s))
fprintf('Дисперсія шуму = %4.3g\n', var(v))
fprintf('Відношення шум/сигнал = %4.3g\n', snr(s, v))

%=== Завдання #1.3 ===
% Обчислення незміщеної оцінки АКФ змодельованого процесу  
maxlag = fix(0.2*length(x));
[v, lags] = xcorr(x, maxlag, 'unbiased');
figure(2)
subplot(2, 1, 1); plot(lags, v); title('Незміщена АКФ');
xlim([-5 5]);
ylabel('Значення');
subplot(2, 1, 2); plot(lags, v); xlabel('Відліки'); ylabel('Значення');

%=== Завдання #1.4 ===
% Обчислення зміщеної оцінки АКФ змодельованого процесу  
maxlag2 = fix(0.8*length(x));
[v2, lags2] = xcorr(x, maxlag2, 'biased');
figure(3)
subplot(2, 1, 1); plot(lags2, v2); title('Зміщена АКФ');
xlim([-5 5]);
ylabel('Значення');
subplot(2, 1, 2); plot(lags2, v2); xlabel('Відліки'); ylabel('Значення');

%=== Завдання #1.5 ===
% Обчислення оцінки АКФ змодельованого процесу при збільшенні тривалості процесу 
%t=100
t3 = 0:100; % вектор часу
v3 = randn(size(t3))*sqrt(D);
s3 = A*cos(2*pi*f0*t3);
x3 = s3 + v3;

maxlag3 = fix(0.3*length(x3));
[r3, lags3] = xcorr(x3, maxlag3, 'unbiased');
[r_3, lags_3] = xcorr(x3, maxlag3, 'biased');
figure(4)
subplot(2, 1, 1); plot(lags3, r3); 
title('Незміщена АКФ');
xlim([-30 30]);
ylabel('Значення');
subplot(2, 1, 2); plot(lags_3, r_3); 
title('Зміщена АКФ');
xlim([-30 30]);
xlabel('Відліки'); ylabel('Значення');

%t=1000
t4 = 0:1000; % вектор часу
v4 = randn(size(t4))*sqrt(D);
s4 = A*cos(2*pi*f0*t4);
x4 = s4 + v4;

maxlag4 = fix(0.3*length(x4));
[r4, lags4] = xcorr(x4, maxlag4, 'unbiased');
[r_4, lags_4] = xcorr(x4, maxlag4, 'biased');
figure(5)
subplot(2, 1, 1); plot(lags4, r4); 
title('Незміщена АКФ');
xlim([-30 30]);
ylabel('Значення');
subplot(2, 1, 2); plot(lags_4, r_4); 
title('Зміщена АКФ');
xlim([-30 30]);
xlabel('Відліки'); ylabel('Значення');