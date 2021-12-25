%Part 1.1
t=1;
freq=1;
x1=linspace(0,1,1000);
y1=-2+sin(2*pi.*x1*t*freq*3);
x2=linspace(1,2,1000);
c=length(x2);
y2=[0 0 0 0 0 0 0 0 0 0];
y2=repmat(y2,1,10);
y2(1)=1;
y2=repmat(y2,1,10);
d=length(y2);
x3=linspace(2,3,1000);
y3=2+sin(2*pi.*x3*t*freq*5+90);
x=[x1 x2 x3];
y=[y1 y2 y3];
figure
plot(x,y,'k-', 'LineWidth',2) ;
grid on;
xlabel('Time, sec') ;
ylabel('Amplitude') ;
title('Figure 1( The illustration of the signal x(t)versus time)') ;
set(gca,'FontSize', 12,'FontName','Arial') ; 
axis([0 3 -4 4]);


%Part 1.2
figure
plot(-x,y,'k-', 'LineWidth',2) ;
grid on;
xlabel('Time, sec') ;
ylabel('Amplitude') ;
title('Figure 2( xr(t) =x(-t))');
set(gca,'FontSize', 12,'FontName','Arial');

%Part 1.3
time=linspace(0,3,3000);
z=flip(y)
even=(1/2)*[y+z];
odd=(1/2)*[y-z];
figure
subplot(2,1,1);
plot(time,even,'k-','LineWidth',2);
xlabel('Time, sec');
ylabel('Amplitude');
title('Even parts of parts of the signal x(t)');
set(gca,'FontSize', 12,'FontName','Arial');
subplot(2,1,2);
plot(time,odd,'k-','LineWidth',2);
grid on;
xlabel('Time, sec');
ylabel('Amplitude');
title('Odd parts of parts of the signal x(t)');
set(gca,'FontSize', 12,'FontName','Arial');

%part2

t=0:0.004:1;
x1=sin(2*pi*5*t);
x2=cos(2*pi*7*t);
x3=x1+x2;
Y1=0; Y2=0; Y3=0;

for i=0:2:4
    Y1= Y1 + sin(2*pi*5*(t-i));
    Y2= Y2 + cos(2*pi*7*(t-i));
    Y3= Y3 + (cos(2*pi*7*(t-i))+sin(2*pi*5*(t-i)));
end
figure
subplot(2,2,1);
plot(t,Y1,'k-','LineWidth',2);
xlabel('Time, sec');
ylabel('Amplitude');
title('Y1');
set(gca,'FontSize', 12,'FontName','Arial');
subplot(2,2,2);
plot(t,Y2,'k-','LineWidth',2);
grid on;
xlabel('Time, sec');
ylabel('Amplitude');
title('Y2');
set(gca,'FontSize', 12,'FontName','Arial');
subplot(2,2,3);
plot(t,Y1+Y2,'k-','LineWidth',2);
grid on;
xlabel('Time, sec');
ylabel('Amplitude');
title('Y1+Y2');
set(gca,'FontSize', 12,'FontName','Arial');
subplot(2,2,4);
plot(t,Y3,'k-','LineWidth',2);
grid on;
xlabel('Time, sec');
ylabel('Amplitude');
title('Y3');
set(gca,'FontSize', 12,'FontName','Arial');

figure
plot(Y1+Y2,Y3,'k-','LineWidth',2);
grid on;
xlabel('Y1+Y2');
ylabel('Y3');
title('linearity/nonlinearity Graph');
set(gca,'FontSize', 12,'FontName','Arial');
