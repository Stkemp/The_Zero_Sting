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
% generate 3 periods of function for interval -5<t<25
% sourced from https://www.mathworks.com/matlabcentral/answers/163582-how-to-plot-a-piecewise-periodic-function-please-help
intvl = [-5 25];
pxt = repmat(x(t),1,diff(intvl)/10);
pt = linspace(intvl(1),intvl(2),length(pxt));

Ck = Lab4Problem1(xt,t,51,1);

figure(2);
plot(pt, pxt);
title("x(t)");
xlabel("t");


