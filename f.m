function xdot = f(x)   
% state
xp1 = x(1);
xp2 = x(2);
xc1 = x(3);
xc2 = x(4);
v = x(5);
tau=x(6);
global rho Ap Bp Cp Ac Bc Cc Dc lambda M
xp=[xp1;xp2];
xc=[xc1;xc2];
yp=Cp*xp;
q=1/2*(1-sign(tau-rho));
u=(1-q)*(Cc*xc+Dc*yp)+v*q;
xpdot=Ap*xp+Bp*u;
vdot=-(1-q)*lambda*v;
xcdot=(1-q)*(Ac*xc+Bc*yp);
taudot=1-dz(tau/(rho));
%F=[yp; xc]'*M*[yp; xc]
xdot=[xpdot;xcdot;vdot;taudot];
end