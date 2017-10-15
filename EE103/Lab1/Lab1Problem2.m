% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 2
clear;
f = [10,15,20];
t = [0,.1,.2,.3,.4];
for n = 1:3
  for m = 1:5
    x(n,m) = 3*cos(2*pi*f(n)*t(m) + 0.1);
  end
end
% what is x(t) when f = 15Hz and t = 0.3s?
disp("when f = 15Hz and t = 0.3s, x(t) = "), disp(x(2,4));


% Problem 3
