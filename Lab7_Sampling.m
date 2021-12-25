clc
clear all;
%part a

load('LabSample.mat');

Ts=1/Fs;
temp=length(x);
fin=temp*Ts;

%part b

t=(0:Ts:fin-Ts);

%part c

D_1=2; D_2=4; D_3=8;

%part d

oursz=size(t);
impulse_train_1=zeros(oursz); 
impulse_train_2=zeros(oursz);
impulse_train_3=zeros(oursz);
impulse_train_1(1:D_1:end)=1;
impulse_train_2(1:D_2:end)=1;
impulse_train_3(1:D_3:end)=1;

%part e

down_samp_sig_1=x.*(impulse_train_1)';
down_samp_sig_2=x.*(impulse_train_2)';
down_samp_sig_3=x.*(impulse_train_3)';

%part f

X=fft(x,Fs/2)/(Fs/2);
DSS_1=fft(down_samp_sig_1,Fs/2)/(Fs/2);
DSS_2=fft(down_samp_sig_2,Fs/2)/(Fs/2);
DSS_3=fft(down_samp_sig_3,Fs/2)/(Fs/2);

f=linspace(-Fs/2,Fs/2,22050);
figure
subplot(2,2,1);
plot(f,abs(fftshift(X)));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Input Sýgnal in frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(2,2,2);
plot(f,abs(fftshift(DSS_1)));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Fourier transform of Sampled Signal for D=2 at frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(2,2,3);
plot(f,abs(fftshift(DSS_2)));
grid on;
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Fourier transform of Sampled Signal for D=4 at frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 
subplot(2,2,4);
plot(f,abs(fftshift(DSS_3)));
grid on;
xlabel('frequency') ;
ylabel('amplitude') ;
title('Fourier transform of Sampled Signal for D=8 at frequency domain');
set(gca,'FontSize', 8,'FontName','Arial'); 

%part g

n=200;
freqs_1=[0 0.453 0.50 1];
freqs_2=[0 0.24 0.30 1];
freqs_3=[0 0.12 0.20 1];
amps_1=[D_1 D_1 0 0]; amps_2=[D_2 D_2 0 0]; amps_3=[D_3 D_3 0 0];
filter_1=firpm(n,freqs_1,amps_1);
filter_2=firpm(n,freqs_2,amps_2);
filter_3=firpm(n,freqs_3,amps_3);

%part h
result_1=conv(down_samp_sig_1,filter_1);
result_2=conv(down_samp_sig_2,filter_2);
result_3=conv(down_samp_sig_3,filter_3);

%part i
diff=length(result_1)-length(x);
diff=diff/2;
last_result_1=result_1(1+diff:1:end-diff);
last_result_2=result_2(1+diff:1:end-diff);
last_result_3=result_3(1+diff:1:end-diff);

%part j

temp_2=0; temp_3=0; temp_4=0;
T=length(x);

ch=sum(abs(x-last_result_1).^2);
MSE1=ch/T;
ch=sum(abs(x-last_result_2).^2);
MSE2=ch/T;
ch=sum(abs(x-last_result_3).^2);
MSE3=ch/T;

%part k 
sound(last_result_1,Fs)
%sound(last_result_2,Fs)
%sound(last_result_3,Fs)

%part l= We can say D_1=2 is best we can say that according to MSE values
%or voices. Cause of this situation D_1 has the fewest sampling period so
%that it gives a result closer to the original signal.