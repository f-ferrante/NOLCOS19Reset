function inside = D(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Jump set
% Return 0 if outside of D, and 1 if inside D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xp1 = x(1);
xp2 = x(2);
xc1 = x(3);
xc2 = x(4);
tau=x(6);
global M rho Cp flag
xp=[xp1;xp2];
xc=[xc1;xc2];
yp=Cp*xp;
F=[yp; xc]'*M*[yp; xc];
if flag==0
if (F>=0&&((tau>=rho&&tau<=2*rho)))
    inside = 1;
else
    inside = 0;
end
else
    inside=0;
end
%inside = 0;
end