%part1
fc=50; fs=1000;
time1=linspace(0,0.1,100); time3=linspace(0,0.5,500);
array1=zeros(1,100); xdeneme=zeros(1,400); xtry=cos(2*pi*fc*time1);
x1=[xtry xdeneme];
figure
plot(time3,x1);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('Graph of x1(t) function'); 
set(gca,'FontSize', 12,'FontName','Arial'); 

Fs=linspace(-fs/2,fs/2,1024);
dt=0.001;
N=1024;
k=1;
array=zeros(1024,1);

while k<=1024
    array(k)=sum(x1.*exp(-1i*2*pi*time3*(k-512))*dt);
   k=k+1;
end

Fx=(fft(x1,N))/1024;
Fx=fftshift(Fx);

figure
subplot(2,1,1)
plot(Fs,abs(array));
grid on;
xlabel('sampling frequency') ;
ylabel('amplitude') ;
title('Graph of our FFT function'); 
set(gca,'FontSize', 12,'FontName','Arial');
subplot(2,1,2);
plot(Fs,abs(Fx))
grid on;
xlabel('sampling frequency') ;
ylabel('amplitude') ;
title('Graph of MATLAB FFT'); 
set(gca,'FontSize', 12,'FontName','Arial');

%part2
d=0.5; Ts=0.001;
t=0:Ts:d;
x2= ((t)>=0.0)+((t>=0.1)-2*(t>=0.2));
y=((t)>=0.0)+((t>=0.1)-2*(t>=0.2)+2*(t>=0.3)+2*(t>=0.4)-4*(t>=0.5));
N=length(t);
X2=fft(x2,N);
Y=fft(y,N);
H=Y./X2;
h=ifft(H);

figure
subplot(3,1,1)
plot(t,x2,'b-');
grid on;
xlabel('Time') ;
ylabel('X2(t)') ;
title('Input'); 
set(gca,'FontSize', 12,'FontName','Arial');

subplot(3,1,2);
plot(t,y,'b-')
grid on;
xlabel('Time') ;
ylabel('y(t)') ;
title('Output'); 
set(gca,'FontSize', 12,'FontName','Arial');


subplot(3,1,3)
plot(t,h,'b-')
grid on;
xlabel('time') ;
ylabel('h(t)') ;
title('Impulse Response'); 
set(gca,'FontSize', 12,'FontName','Arial');


