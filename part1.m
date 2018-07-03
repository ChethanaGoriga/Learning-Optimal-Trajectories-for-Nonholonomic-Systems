clear all
close all
clc

N=4;
inistates = [0;0;100;0;10;20;0;100];

[t,g] = ode45(@ren1,[0:0.01:30],inistates,odeset('RelTol',1e-4,'AbsTol',1e-6));
plot(g(:,1),g(:,2),g(:,3),g(:,4),g(:,5),g(:,6),g(:,7),g(:,8))

d= zeros(length(g),N);
for k =1:length(g)
    for i= 1:N
        if i==N
            j=1;
        else
            j=i+1;
        end
        d(k,i)=norm(g(k,2*j-1:2*j) + g(k,2*i-1:2*i));
    end
end

figure(2)
plot(t,d(:,1),t,d(:,2),t,d(:,3),t,d(:,4))
grid on
