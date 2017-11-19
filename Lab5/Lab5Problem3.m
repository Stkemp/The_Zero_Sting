% Stephen Kemp
% EE103L Section 01B
% Lab 5
% Problem 3
clear all;
close all;

load('ecg_signal.mat');

R = 10*10^3;
C = 133*10^-9;
H = @(w,m) ((1+m)*((2*1i*w*R*C).^2+1)) ./ ...
    ((2*1i*w*R*C).^2 + 4*(1-m)*1i*w*R*C +1);
dT=t(2)-t(1);
f = linspace(-250, 250, 1250);
w = f*2*pi;
Hw = H(w,0.9);
xt = ecg;
Xw = fft(xt)*dT;
Xw = fftshift(Xw);
Zw = Xw.*Hw;
zt = ifft(ifftshift(Zw))/dT;

E = @(t, gt) trapz(t, abs(gt).^2);

EnergyX(1) = 0;
EnergyZ(1) = 0;
for ii = 2:length(f)
    EnergyX(ii) = E(f(1:ii), Xw(1:ii));
    EnergyZ(ii) = E(f(1:ii), Zw(1:ii));
end

Ext = E(t, xt)
Ezt = E(t, zt)

figure(1);
subplot(2,1,1);
plot(f, EnergyX);
title("Energy of X(f)");
xlabel("f");

subplot(2,1,2);
plot(f, EnergyZ);
title("Energy of Z(f)");
xlabel("f");