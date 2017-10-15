% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 4
clear;

t = linspace(0,1,11);
xt = 4*cos(2*pi*t + 0.2) + 3*sin(pi^2 * t);

% Find max value of xt
maximum = max(xt);

% Find min value of xt
minimum = min(xt);

% Find average element values
avg = mean(xt);

% Find indices of elements with element values > 4
indeces = 0;
n = 1;
for i = 1:length(t)
  if xt(i) > 4
    indeces(n) = i;
    n = n+1;
  end
end


% Find

disp(xt);
disp(maximum);
disp(minimum);
disp(avg);
disp(indeces);