function dg = ren1(t,g )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
l=length(g);
N=l/2;
dg=zeros(l,1);

for i=1:N
     if i==N
            j=1;
        else
            j=i+1;
     end
        d=norm(g(2*j-1:2*j,1) + g(2*i-1:2*i,1));
        a=pi/N + 0.01*(100 - d);
        R= [cos(a) sin(a); -sin(a) cos(a)];
        dr= R*(g(2*j-1:2*j,1) + g(2*i-1:2*i,1));
        dg(2*i-1,1)=dr(1);
        dg(2*i,1) = dr(2);
end 
end
