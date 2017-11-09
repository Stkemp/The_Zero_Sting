%x_single_period(t)= t^3 - j2*pi*t^2, 0<t<=5 

close all
clear all
clc

%% single period definition
t_single_period = linspace(0,5);
x_single_period = t_single_period.^3 - 1i*2*pi*t_single_period.^2;


%% period and fundamental angular freq.
T=5;
w0=2*pi/T; 

%% replicating single period
number_of_periods=2;
x_extended=repmat(x_single_period,1,number_of_periods);   % 1 row, 5 column: number of periods
% generating new 'time' variable to match signal 'x_extended'
t_extended=linspace(t_single_period(1),number_of_periods*(t_single_period(end)-t_single_period(1)),length(x_extended));


%% exponential FS, approximation with 51 terms
k=-25:25; %k=index of harmonics

for ii=1:length(k)
    Ck(ii)=(1/T)*trapz(t_single_period, x_single_period.*exp(-1i*k(ii)*w0*t_single_period));
end

w0k=w0*k;  
figure (2)
subplot(211)
stem(w0k,abs(Ck))

legend('Magnitude spectrum  k=-25:25')
xlabel('\omega')

subplot(2,1,2)
stem(w0k,angle(Ck)*180/pi);
legend('Phase spectrum  k=-25:25')
xlabel('\omega')
ylabel('degrees')

%% signal reconstruction from FS components
% reconstructing 2 cycles

t_reconstracted=linspace(t_single_period(1),2*(t_single_period(end)-t_single_period(1)),...
    2*length(x_single_period));
x_reconstracted=zeros(1,length(t_reconstracted));  % initiating with zeros (0)


for ii=1:length(k)
    x_reconstracted=x_reconstracted+Ck(ii)*exp(1i*k(ii)*w0*t_reconstracted);
end

figure(1)
subplot(2,1,1)
hold on;
plot(t_extended,x_extended);
plot(t_reconstracted,x_reconstracted)
xlabel('t');
title('Real part of x(t)')
legend('original signal', 'approximation with 51 terms');

subplot(2,1,2)
hold on;
plot(t_extended, imag(x_extended));
plot(t_reconstracted, imag(x_reconstracted))
xlabel('t');
title('Imaginary part of x(t)')
legend('original signal', 'approximation with 51 terms');
