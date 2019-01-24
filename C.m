function [value discrete] = C(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen B??
%
% Description: Flow set
% Return C if outside of D, and 1 if inside C
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

if (F<=0||(tau>=0&&tau<=rho))
   
    value = 1;
else
    value = 0;
end
else
    value=1;
end
%value=1;
end