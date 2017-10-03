% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 3
clear;
w = [35,40,45];
for n = 1:size(w)(2)
  t = 0.01;
  while (t*exp(1.2)*cos(w(n)*t) < 10) && (t^3 < 10)
    t = t + 0.01;
  endwhile
  answer(n) = t;
endfor
disp(w);
disp(answer);