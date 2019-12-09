function d = d(angle)
R = 0.00132;
g = -9.8;
theta = angle;
v0 = 100;
f=@(x,y) [y(3);y(4);-R*norm([y(3),y(4)])*y(3);-R*norm([y(3),y(4)])*y(4) + g];
a=0; b=15;  
y0=[0;0;cos(theta)*v0;sin(theta)*v0];
options = odeset('Events','FuncioEvent');
[x,Y]=ode45(f,[a,b],y0,options);
d = Y(end,1) - 500;
end

