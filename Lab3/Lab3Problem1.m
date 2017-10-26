% Stephen Kemp
% EE103L Section 01B
% Lab 3
% Problem 1

close all;
clear all;

R = 2;
C = 1;
L = 0.5;
syms y(t) x(t) a b;
Dy(t) = diff(y,t);
eqn = R*C*diff(y,t,2) + diff(y,t) + R/L*y == 0; 
conditions = [y(0)==0, Dy(0)==1];

ySol(t) = dsolve(eqn,conditions);
h = diff(ySol,t)

h1 = @(t) (exp(-t/4).*cos((31^(1/2)*t)/4) - (31^(1/2)*exp(-t/4).*sin((31^(1/2)*t)/4))/31).*(t>=0);
t_1 = -10:.1:30;

figure();
plot (t_1,h1(t_1));