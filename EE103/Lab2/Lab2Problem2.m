% Stephen Kemp
% EE103L Section 01B
% Lab 2
% Problem 2

t = [-10:0.1:15];
xt = Piecewise(t);
ta = t + 2;
xta = Piecewise(ta);
tb = t - 3;
xtb = Piecewise(tb);

figure();
plot(t, xt);

figure();
subplot(2,2,1);
plot(t, xta);

subplot(2,2,2);
plot(t, xtb);

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