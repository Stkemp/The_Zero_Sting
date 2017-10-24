% Stephen Kemp
% EE103L Section 01B
% Lab 3
% Problem 1

close all;
clear all;

R = 2;
C = 1;
L = 0.5;
C1 = 2;
C2 = 1;
syms y(t) x(t);
eqn = R*C*diff(y,t,2) + diff(y,t) + R/L*y == 0; 
ySol(t) = dsolve(eqn);
t_1 = [-5:0.01:5];
y_t = ySol(t_1);