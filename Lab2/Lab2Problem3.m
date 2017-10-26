% Stephen Kemp
% EE103L Section 01B
% Lab 2
% Problem 3

a = 0;
b = 20;
step = .1;

t = [a:step:b];
negt = [-a:-step:-b];
xt = MyFunction(t);
xnegt = MyFunction(negt);
xet = .5*(xt + xnegt);
xot = .5*(xt - xnegt);
yt = xet + xot;

figure();

subplot(2,2,1);
plot(t, xt);
title("x(t)");

subplot(2,2,2);
plot(t, xet);
title("x_e(t)");

subplot(2,2,3);
plot(t, yt);
title("y(t)");

subplot(2,2,4);
plot(t, xot);
title("x_o(t)");

function [xt] = MyFunction (t)
    xt = t.*exp(-0.1*t);
end
