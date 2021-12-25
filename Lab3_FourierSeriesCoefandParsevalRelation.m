%step 1
dt=0.001; f=0.2; T=10; theta=6*dt;
time_interval_1=0:dt:5; time_interval_2=5+dt:dt:10;

time=[time_interval_1 time_interval_2];

value1=-exp(-time_interval_1); 
value2=-sin((2*pi*f*time_interval_2)+(theta));

integral_of_xt=[value1 value2];

%step 2

m=length(integral_of_xt);
x_cal(1,m)=0;
x_cal(1,1)=1;
for i=2:1:m
    x_cal(1,i)=(integral_of_xt(1,i)-integral_of_xt(1,i-1))/dt;
end

%step3
figure
plot(time,integral_of_xt,'k-');
hold on;
plot(time,x_cal,'b-');
legend('integral of x(t)','x(t) function');
xlabel('time');
ylabel('amplitude');

%step4
right_hand=0;

for t=1:1:m-1
   temp=abs(x_cal(t)).*abs(x_cal(t))*dt;
    right_hand=right_hand+temp;
end
right_hand=right_hand*1/T;
 
 %step5
  n=1;
 k=-5000;
temp_3=0;

while k<=5000
    
   temp_3=sum(x_cal.*exp(-1i*k*2*pi/T*time)*dt);
   ck(1,n)=(1/T)*temp_3;
  n=n+1;
    k=k+1;
end
%step6
left_hand=0;
 for t=1:1:10000
   temp_2=abs(ck(t)).*abs(ck(t));
    left_hand=left_hand+temp_2;
 end
%step 7
figure;
stem(right_hand,left_hand);
title('Parseval Relation');
xlabel('rigth hand side of equation');
ylabel('left hand side of equation');


