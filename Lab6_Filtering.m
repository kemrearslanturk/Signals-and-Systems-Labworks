%part a
sample_freq=1000; Ts=1/sample_freq;  time=0.5;
t=0:Ts:time-Ts;


%part b
x=sin(200*pi*t)+2*sin(400*pi*t)+0.5*sin(600*pi*t);

%part c and d
freqs_1=[0 0.15 0.25 1];
amps_1=[1 1 0 0];
b_1=firpm(80,freqs_1,amps_1);
y_1=filter(b_1,1,x);

figure
freqz(b_1);
grid on;
title('Low Pass Filter');

freqs_2=[0 0.45 0.55 1];
amps_2=[0 0 1 1];
b_2=firpm(80,freqs_2,amps_2);
y_2=filter(b_2,1,x);
figure
freqz(b_2);
grid on;
title('High Pass Filter');

freqs_3 = [0 0.2 0.25 0.5 0.55 1];
amps_3 = [0 0 1 1 0 0];
b_3=firpm(80,freqs_3,amps_3);
y_3=filter(b_3,1,x);
figure
freqz(b_3);
grid on;
title('Bandpass Filter');

%part e


figure
subplot(4,2,1);
plot(t,x);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('Input Sýgnal in time domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(4,2,2);
plot(t,y_1);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('Low Pass Filter Output in time domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(4,2,3);
plot(t,y_2);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('High Pass Filter Output in time domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(4,2,4);
plot(t,y_3);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('Band Pass Filter Output in time domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

f=linspace(-sample_freq/2,sample_freq/2,500);%frequency vector
X=fft(x);
subplot(4,2,5);
plot(f,abs(fftshift(X)/500));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Input Sýgnal in frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

Y_1=fft(y_1);
subplot(4,2,6);
plot(f,abs(fftshift(Y_1)/500));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Low Pass Filter Output in frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

Y_2=fft(y_2);
subplot(4,2,7);
plot(f,abs(fftshift(Y_2)/500));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('High Pass Filter Output in frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

f=linspace(-sample_freq/2,sample_freq/2,500);%frequency vector
Y_3=fft(y_3);
subplot(4,2,8);
plot(f,abs(fftshift(Y_3)/500));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Band Pass Filter Output in frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

%part f
ideal_lp=zeros(1,500);
ideal_lp(abs(f)<75)=1;
ideal_hp=zeros(1,500);
ideal_hp(abs(f)>275)=1;
ideal_mp=zeros(1,500);
ideal_mp(abs(f)<250 & abs(f)>125)=1;
figure
subplot(3,1,1);
plot(f,ideal_lp);
title('Ideal Low Pass Filter');
subplot(3,1,2);
plot(f,ideal_hp);
title('Ideal High Pass Filter');
subplot(3,1,3);
plot(f,ideal_mp);
title('Ideal Band Pass Filter');
