% Stephen Kemp
% EE103L Section 01B
% Lab 1


% Problem 3
clear;
w = [35,40,45];
for n = 1:length(w)
  t = 0.01;
  while (t*exp(1.2)*cos(w(n)*t) < 10) && (t^3 < 10)
    t = t + 0.01;
  end
  answer(n) = t;
end
disp(w);
disp(answer);