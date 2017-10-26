% Stephen Kemp
% EE103L Section 01B
% Lab 2
% Problem 4

t = linspace(.5,.75,400);
xt = 3*pi*sin(8*pi*t + 1.3).*cos(4*pi*t - 0.8).*exp(sin(12*pi*t));
energy = trapz(t, abs(xt).^2)

T = 0.5;    % Calculated in part 1
t = linspace(0, T, 400);
xt = 3*pi*sin(8*pi*t + 1.3).*cos(4*pi*t - 0.8).*exp(sin(12*pi*t));
power = 1/T * trapz(t, abs(xt).^2)