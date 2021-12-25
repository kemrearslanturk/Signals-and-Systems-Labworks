%part1
x=randn(1,20);
h=randn(1,20);
Y1=KorkutEmreArslanturk(x,h);
m=length(x); k=length(h); Z=1:m+k-1;
Y2=conv(x,h);
figure
subplot(211);
stem(Y1);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('My function result'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 

subplot(212);
stem(Y2);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('conv function result'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 
figure;
plot(Y1,Y2);
grid on;
xlabel('myConvFun') ;
ylabel('conv Function') ;
title('Part 1: Check convolution function'); 
set(gca,'FontSize', 12,'FontName','Arial') ;
%part2
n=-5:1:5;

h1= ((n-1)==0)+((n+1)==0);

unitstep1 = n>=0; unitstep2 = n>=4;
h2= unitstep1-unitstep2;

h3= ((n-1)==0);

figure
subplot(311);
stem(n,h1);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('h1(n)=&(n-1)+&(n+1)'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 

subplot(312);
stem(n,h2);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('h2(n)=u(n)-u(n-4)'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 

subplot(313);
stem(n,h3);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('h3(n)=&(n-1)') ;
set(gca,'FontSize', 12,'FontName','Arial') ; 

x=(cos(pi*n).*((n>=0)-((n-6)>=0)));
x1=KorkutEmreArslanturk(x,h1); 
x2=KorkutEmreArslanturk(x,h2);
x3=x1+x2;
y=KorkutEmreArslanturk(x3,h3);
figure
subplot(311);
stem(x1);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('x(n) conv H1'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 

subplot(312);
stem(x2);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('x(n) conv H2'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 

subplot(313);
stem(x3);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('sum of x(n) conv H1 and x(n) conv H2') ;
set(gca,'FontSize', 12,'FontName','Arial') ;
figure
plot(y);
grid on;
xlabel('time') ;
ylabel('amplitude') ;
title('y(n)') ;
set(gca,'FontSize', 12,'FontName','Arial') ; 
