% Stephen Kemp
% EE103L Section 01B
% Lab 3
% Problem 3

close all;
clear all;

dt = .0001;
t = -0.1:dt:0.1;

w = sin(400*pi*t);
x = @(t) (cos(100*pi*t) + sin(400*pi*t) - cos(800*pi*t)).*(t>=0);
h = @(t) (400*exp(-200*t).*cos(400*pi*t)).*(t>=0);

y = conv(x(t), h(t))*dt;
y = y(.1/dt:3*.1/dt);

figure();

subplot(3,1,1);
plot(t, x(t));

subplot(3,1,2);
plot(t, y);

subplot(3,1,3);
plot(t, w);

% the filtered signal looks much closer to the un-corrupted input signal.
% However, there is still some amplitude wavering.