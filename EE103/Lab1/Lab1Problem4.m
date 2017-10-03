% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 4

t = linspace(0,1,11);
xt = 4*cos(2*pi*t + 0.2) + 3*sin(pi^2 * t);

% Find max value of xt
max = 0;
for n = 1:size(t)(2)
  if xt(n) > max
    max = xt(n);
  endif
endfor

% Find min value of xt
min = Inf;
for n = 1:size(t)(2)
  if xt(n) < min
    min = xt(n);
  endif
endfor

disp(xt);
disp(max);
disp(min);