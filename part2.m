clear all
close all
clc
T=100; 
Ts=0.01; 
tt=0:Ts:T; 

for j=1:length(tt)-1
   ttt(j)=tt(j);
end
xx=[6 ; 3 ; 2 ; 1];
yy=[7 ; 9 ; 1 ; 1];
pp=[2 ; 4 ; 2 ; 5];
pq=[1 ; 1 ; 7 ; 6];
theta1 =pi;
theta2 = 2*(pi/2);
theta3 = pi;
theta4 = 2*(pi/2);

x1 = xx(1);
y1 = yy(1);
x2 = xx(2);
y2 = yy(2);
x3 = xx(3);
y3 = yy(3);
x4 = xx(4);
y4 = yy(4);
px1 = pp(1);
py1 = pq(1);
px2 = pp(2);
py2 = pq(2);
px3 = pp(3);
py3 = pq(3);
px4 = pp(4);
py4 = pq(4);

d = 0.5;

for i=1:length(tt)-1
       

S = [1 1 0 1; 1 1 0 1 ; 0 1 1 0 ; 1 1 1 1];
    
   
u1(i) = S(1,2)*(x2(i)-px2-x1(i)+px1)+S(1,3)*(x3(i)-px3-x1(i)+px1)+S(1,4)*(x4(i)-px4-x1(i)+px1); 
u2(i) = S(1,2)*(y2(i)-py2-y1(i)+py1)+S(1,3)*(y3(i)-py3-y1(i)+py1)+S(1,4)*(y4(i)-py4-y1(i)+py1); 
u3(i) = S(2,1)*(x1(i)-px1-x2(i)+px2)+S(2,3)*(x3(i)-px3-x2(i)+px2)+S(2,4)*(x4(i)-px4-x2(i)+px2); 
u4(i) = S(2,1)*(y1(i)-py1-y2(i)+py2)+S(2,3)*(y3(i)-py3-y2(i)+py2)+S(2,4)*(y4(i)-py4-y2(i)+py2); 
u5(i) = S(3,1)*(x1(1)-px1-x3(i)+px3)+S(3,2)*(x2(i)-px2-x3(i)+px3)+S(3,4)*(x4(i)-px4-x3(i)+px3); 
u6(i) = S(3,1)*(y1(i)-py1-y3(i)+py3)+S(3,2)*(y2(i)-py2-y3(i)+py3)+S(3,4)*(x4(i)-py4-x3(i)+py3); 
u7(i) = S(4,1)*(x1(i)-px1-x4(i)+px4)+S(4,2)*(x2(i)-px2-x4(i)+px4)+S(4,3)*(x3(i)-px3-x4(i)+px4); 
u8(i) = S(4,1)*(y1(i)-py1-y4(i)+py4)+S(4,3)*(y3(i)-py3-y4(i)+py4)+S(4,2)*(y2(i)-py2-y4(i)+py4); 
   
% robot 1

    z1(i) = (x1(i)+(d*cos(theta1(i))));
    z2(i) = (y1(i)+(d*sin(theta1(i))));
     
     
    v1(i) = 2*((d*u1(i)*cos(theta1(i))+(d*u2(i)*sin(theta1(i)))));  
    w1(i) = 2*((u2(i)*cos(theta1(i)))-(u1(i)*sin(theta1(i))));
     
      
    x1(i+1) = x1(i) +v1(i)*cos(theta1(i))*Ts;
    y1(i+1) = y1(i) +v1(i)*sin(theta1(i))*Ts;
    theta1(i+1) = theta1(i) + w1(i)*Ts;
    
 % robot 2
    
    z3(i) = (x2(i)+(d*cos(theta2(i))));
    z4(i) = (y2(i)+(d*sin(theta2(i))));
     
     
    v2(i) = 2*((d*u3(i)*cos(theta2(i))+(d*u4(i)*sin(theta2(i)))));  
    w2(i) = 2*((u4(i)*cos(theta2(i)))-(u3(i)*sin(theta2(i))));
     
      
    x2(i+1) = x2(i) +v2(i)*cos(theta2(i))*Ts;
    y2(i+1) = y2(i) +v2(i)*sin(theta2(i))*Ts;
    theta2(i+1) = theta2(i) + w2(i)*Ts;
    
% robot 3
    
    z5(i) = (x3(i)+(d*cos(theta3(i))));
    z6(i) = (y3(i)+(d*sin(theta3(i))));
     
     
    v3(i) = 2*((d*u5(i)*cos(theta3(i))+(d*u6(i)*sin(theta3(i)))));  
    w3(i) = 2*((u6(i)*cos(theta3(i)))-(u5(i)*sin(theta3(i))));
     
      
    x3(i+1) = x3(i) +v3(i)*cos(theta3(i))*Ts;
    y3(i+1) = y3(i) +v3(i)*sin(theta3(i))*Ts;
    theta3(i+1) = theta3(i) + w3(i)*Ts;
    
% robot 4
    
    z7(i) = (x4(i)+(d*cos(theta4(i))));
    z8(i) = (y4(i)+(d*sin(theta4(i))));
     
     
    v4(i) = 2*((d*u7(i)*cos(theta4(i))+(d*u8(i)*sin(theta4(i)))));  
    w4(i) = 2*((u8(i)*cos(theta4(i)))-(u7(i)*sin(theta4(i))));
     
      
    x4(i+1) = x4(i) +v4(i)*cos(theta4(i))*Ts;
    y4(i+1) = y4(i) +v4(i)*sin(theta4(i))*Ts;
    theta4(i+1) = theta4(i) + w4(i)*Ts;
end

% plot system trajectories

plot(x1, y1, x2, y2, x3, y3, x4 , y4)
xlabel('x axis')
ylabel('y axis')
