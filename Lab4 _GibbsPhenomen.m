%step1

load('matrix_Double.mat'); %load mat file 
V = matrix_Double(:);
V= V';

%step2

dt=1; T=length(V);n=1; k=-2000; temp_3=0; time=1:T;
 ck=zeros(1,T);
while k<=2000
    
   temp_3=sum(V.*exp(-1i*k*2*pi/T*time)*dt);
   ck(1,n)=(1/T)*temp_3;
  n=n+1;
    k=k+1;
end

%step3

 array1=zeros(1,T);
 array2=zeros(1,T);
 array3=zeros(1,T);
 array4=zeros(1,T);

m1=1901:1:2101; m2=1501:1:2501; m3=1001:1:3001; m4=1:1:4001;

origin=2001;
for timea=1:1:T
   array1(1,timea)=sum(ck(1,m1).*exp(1i*(m1-origin)*2*pi/T*timea));
   array2(1,timea)=sum(ck(1,m2).*exp(1i*(m2-origin)*2*pi/T*timea));
   array3(1,timea)=sum(ck(1,m3).*exp(1i*(m3-origin)*2*pi/T*timea));
   array4(1,timea)=sum(ck(1,m4).*exp(1i*(m4-origin)*2*pi/T*timea));
end
array1=real(array1); array2=real(array2); array3=real(array3); array4=real(array4);

%step 4

temp=0;
for i=1:1:T
   ch=array1(1,i)-V(1,i);
   ch=ch*ch;
    temp=temp+ch;
end
MSE1=(1/T)*temp;

temp=0;
for i=1:1:T
   ch=array2(1,i)-V(1,i);
   ch=ch*ch;
    temp=temp+ch;
end
MSE2=(1/T)*temp;
temp=0;
for i=1:1:T
   ch=array3(1,i)-V(1,i);
   ch=ch*ch;
    temp=temp+ch;
end
MSE3=(1/T)*temp;
temp=0;
for i=1:1:T
   ch=array4(1,i)-V(1,i);
   ch=ch*ch;
    temp=temp+ch;
end
MSE4=(1/T)*temp;

x=[100 500 1000 2000];
y=[MSE1 MSE2 MSE3 MSE4];
figure
plot(x,y);
grid on;
xlabel('M Values') ;
ylabel('MSE Values') ;
title('Mean Square Error of each approximation'); 
set(gca,'FontSize', 12,'FontName','Arial') ; 


%part5
[row, column]=size(matrix_Double);
figure
image_original=uint8(real((reshape(V,[row column])))); 
image
imshow(image_original)
figure
image_approximated=uint8(real((reshape(array1,[row column]))));
imshow(image_approximated)
figure
image_approximated=uint8(real((reshape(array2,[row column])))); 
imshow(image_approximated)
figure
image_approximated=uint8(real((reshape(array3,[row column])))); 
imshow(image_approximated)

figure
image_approximated=uint8(real((reshape(array4,[row column])))); 
imshow(image_approximated)
