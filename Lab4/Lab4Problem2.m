% Stephen Kemp
% EE103L Section 01B
% Lab 4
% Problem 2
clear all;
close all;

% generate one period of the function -5<t<5
x = @(t) 0.6*((t>=-2) - (cos(pi*t)+1).*((t>=-1) - (t>=1)) - (t>=2));
t = linspace(-5,5);
xt = x(t);

Ck = Lab4Problem1(xt,t,51,1);