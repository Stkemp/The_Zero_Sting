% Stephen Kemp
% EE103L Section 01B
% Lab 2
% Problem 1

t1 = [-1:0.1:1];
t2 = [-1:0.01:1];
t3 = [-1:0.001:1];

gt1 = 3*pi*sin(8*pi*t1 + 1.3).*cos(4*pi*t1 - 0.8).*exp(sin(12*pi*t1));
gt2 = 3*pi*sin(8*pi*t2 + 1.3).*cos(4*pi*t2 - 0.8).*exp(sin(12*pi*t2));
gt3 = 3*pi*sin(8*pi*t3 + 1.3).*cos(4*pi*t3 - 0.8).*exp(sin(12*pi*t3));

figure();

subplot(3,1,1);
plot(t1, gt1, 'k');

subplot(3,1,2);
plot(t2, gt2, 'b');

subplot(3,1,3);
plot(t3, gt3, 'r');