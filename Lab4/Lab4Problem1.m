function [Ck] = Lab4Problem1 (x, t, Nk, p)

% Ck = exponential fourier series cofficient  
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal  
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x' 


    dT=t(2)-t(1);
    T= dT*(length(t)-1);
    w0=2*pi/T;   

    % Check the number of inputs, 'nargin' returns number of input arguments 
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=101;   % you can set any default value you like 
        p=0;      % not plots
    elseif nargin ==3
        p=0;      % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6


    %% evaluate Ck
    for i = 1: length(k)
        integrand = (x.*exp(-1i*k(i)*w0*t)) / T;
        Ck(i) = trapz(t, integrand);
    end
    
    %% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        figure(1);
        
        subplot(3,1,1);
        stem(w0*k, abs(Ck));
        title("Ck Magnitude Plot");
        xlabel("\omega");
        ylabel("Magnitude");
        
        subplot(3,1,2);
        stem(w0*k, angle(Ck)*180/pi);
        title("Ck Phase Plot");
        xlabel("\omega");
        ylabel("Phase");
        
        % generate 3 cycles of the original signal
        intvl = [t(1) t(end)+2*T];
        pxt = repmat(x,1,int32(diff(intvl)/T));
        pt = linspace(intvl(1),intvl(2),length(pxt));
        
        % reconstruct signal using Ck
        t_recon = linspace(t(1), t(end)+2*T, 3*length(t));
        x_recon = zeros(1,length(t_recon));
        for i = 1:length(k)
            x_recon = x_recon + Ck(i).*exp(1i*k(i)*w0*t_recon);
        end
        
        % plot the 3 cycles of the original signal and reconstruced signal
        subplot(3,1,3);
        hold on;
        plot(pt, pxt);
        plot(t_recon, x_recon);
        title("3 Cycles of x(t)");
        xlabel("t");
        ylabel("Amplitude");
        legend('Original', 'Reconstructed');
    end
     
end