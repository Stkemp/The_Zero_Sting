% Stephen Kemp
% EE103L Section 01B
% Lab 5
% Problem 2
clear all;
close all;

% Part A

R = 10*10^3;
C = 133*10^-9;
f = linspace(0, 200, 1250);
w = f*2*pi;
m = [0.9, 0.99];
H = @(w,m) ((1+m)*((2*1i*w*R*C).^2+1)) ./ ...
    ((2*1i*w*R*C).^2 + 4*(1-m)*1i*w*R*C +1);
Hw(:,1) = H(w,m(1));
Hw(:,2) = H(w,m(2));

figure(1);
subplot(2,2,1);
plot(f, abs(Hw(:,1)));
title("Magnitude Plot of H(f) for m = 0.9");
xlabel("f");

subplot(2,2,3);
plot(f, angle(Hw(:,1))*180/pi);
title("Phase Plot of H(f) for m = 0.9");
xlabel("f");

subplot(2,2,2);
plot(f, abs(Hw(:,2)));
title("Magnitude Plot of H(f) for m = 0.99");
xlabel("f");

subplot(2,2,4);
plot(f, angle(Hw(:,2))*180/pi);
title("Phase Plot of H(f) for m = 0.99");
xlabel("f");

% Part B

load('ecg_signal.mat');

dT=t(2)-t(1);
f = linspace(-250, 250, 1250);
w = f*2*pi;
Hw = H(w,m(1));
xt = ecg;
Xw = fft(xt)*dT;
Xw = fftshift(Xw);
Zw = Xw.*Hw;
zt = ifft(ifftshift(Zw))/dT;

figure(2);
subplot(4,1,1);
plot(t, xt);
title("x(t)");
xlabel("t");

subplot(4,1,2);
plot(f, abs(Xw));
title("X(f)");
xlabel("f");

subplot(4,1,3);
plot(f, abs(Zw));
title("Z(f)");
xlabel("f");

subplot(4,1,4);
plot(t, abs(zt));
title("z(t)");
xlabel("t");