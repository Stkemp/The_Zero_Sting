% Stephen Kemp
% EE103L Section 01B
% Lab 5
% Problem 1
clear all;
close all;

% Part A

w = [-31.4:0.1:31.4];
t = [-100:0.1:100];
G = @(w) 2*(abs(w) >= 5 & abs(w) <= 10);
Gw = G(w);

% inverse fourier transform
for ii = 1:length(t)
    gt(ii) = 1/(2*pi) * trapz(w, Gw.*exp(-1i*w*t(ii)));
end

figure(1);
subplot(3,1,1);
plot(w, Gw);
title("G(\omega)");
xlabel("\omega");

subplot(3,1,2);
plot(t, gt);
title("Real Part of g(t)");
xlabel("t");

subplot(3,1,3);
plot(t, imag(gt));
title("Imaginary Part of g(t)");
xlabel("t");

% Part B

Hw =  G(w-5);

for ii = 1:length(t)
    ht(ii) = 1/(2*pi) * trapz(w, Hw.*exp(-1i*w*t(ii)));
end

figure(2);
subplot(3,1,1);
plot(w, Hw);
title("H(\omega)");
xlabel("\omega");

subplot(3,1,2);
plot(t, ht);
title("Real Part of h(t)");
xlabel("t");

subplot(3,1,3);
plot(t, imag(ht));
title("Imaginary Part of h(t)");
xlabel("t");

% Part C
% g(t) and h(t) are complex signals because they both have non-zero
% imaginary components.