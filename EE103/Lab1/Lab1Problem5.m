% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 5
clear;

t = 0:0.01:10;
f1 = 0.2;
f2 = 0.425;

[s1,s2,s3] = SumOfSinusoids(t,f1,f2);

figure;
hold on;
plot(t, s1, 'k');
plot(t, s2, 'g');
plot(t, s3, 'r');
title("SK, Problem 5, Graph two sinusoids and their sum");
xlabel("time(time units)");
ylabel("y axis units");
legend('s1', 's2', 's3');

figure;
subplot(3,1,1);
plot(t, s1, 'k');
title("SK, Problem 5, Graph two sinusoids and their sum on separate axes");
ylabel("y axis units");

subplot(3,1,2);
plot(t, s2, 'g');
ylabel("y axis units");

subplot(3,1,3);
plot(t, s3, 'r');
ylabel("y axis units");
xlabel("time(time units)");


function [s1,s2,s3] = SumOfSinusoids (t, f1, f2)
  s1 = sin(2*pi*f1*t);
  s2 = sin(2*pi*f2*t);
  s3 = s1 + s2;
end
