% Stephen Kemp
% EE103L Section 01B
% Lab 3
% Problem 2

close all;
clear all;

% signal: x, impulse response: h
x1=@(t) 5*(t>=0 & t<10);
x2 = @(t) 2*x1(t-10);
xlc = @(t) x1(t) + x2(t);

h=@(t) 3*(exp(-t/5).*sin(2*t)).*(t>=3);

dtau = 0.1;  
tau = -10:dtau:40;              
dT=0.5;  
t = -10:dT:40;  

figure (1)
y1 = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    x1h = h(t(ii)-tau).*x1(tau);                           
    y1(ii)=trapz(tau,x1h);   
  
% plotting 
    subplot (2,1,1)
    plot(tau, x1(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x1(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, y1, 'k', t (ii), y1(ii), 'ok');
    xlabel ('t'); ylabel ('y1(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;
    
end
  
figure (2)
y2 = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    x2h = h(t(ii)-tau).*x2(tau);                           
    y2(ii)=trapz(tau,x2h); 
  
% plotting 
    subplot (2,1,1)
    plot(tau, x2(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('x2(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, y2, 'k', t (ii), y2(ii), 'ok');
    xlabel ('t'); ylabel ('y2(t) = \int x1(\tau)h(t-\tau) d\tau');
    drawnow;
    
end

figure (3)
ylc = NaN(1, length (t)); 

for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
   
    xlch = h(t(ii)-tau).*xlc(tau);                           
    ylc(ii)=trapz(tau,xlch); 
  
% plotting 
    subplot (2,1,1)
    plot(tau, xlc(tau), 'k-', tau, h(t(ii)-tau), 'b--', t(ii), 0, 'ok');
    xlabel('\tau'); 
    legend('xlc(\tau)','h(t-\tau)');
    
    subplot (2,1,2)
    plot (t, ylc, 'k', t (ii), ylc(ii), 'ok');
    xlabel ('t'); ylabel ('ylc(t) = \int xlc(\tau)h(t-\tau) d\tau');
    drawnow;
    
end

figure (4)
y3 = y2 + y1;
plot (t, y3);
xlabel('t');
ylabel('y3 = y2 + y1');

% y3 looks exactly the same as ylc. This is because convolution is a linear
% operation.
