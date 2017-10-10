% Stephen Kemp
% EE103L Section 01B
% Lab 2
% Problem 2

clear;

t = [-10:0.1:15];
xt = Piecewise(t);
ta = t + 2;
xta = Piecewise(ta);
tb = t - 3;
xtb = Piecewise(tb);
tc = [10:-0.1:-15];
xtc = Piecewise(tc);
td = tc + 4;
xtd = -2*Piecewise(td);

figure();
plot(t, xt);

figure();
subplot(2,2,1);
plot(t, xta);

subplot(2,2,2);
plot(t, xtb);

subplot(2,2,3);
plot(t, xtc);

subplot(2,2,4);
plot(t, xtd);

function [xt] = Piecewise (t)
  for ii = 1:length(t)
    if (t(ii) >= -5 && t(ii) < 5)
      xt(ii) = -2*abs(t(ii)) + 10;
    elseif (t(ii) >=5 && t(ii) < 10)
      xt(ii) = 10;
    else
      xt(ii) = 0;
    end
  end
end