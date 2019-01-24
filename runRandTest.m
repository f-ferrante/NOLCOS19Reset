global Ac Bc Cc Dc
for i=1:100
global flag
flag=0;
a=2*pi*rand;
xp0(i,1:2)=[cos(a),sin(a)];
x0=[xp0(i,1:2)';0;0;0;0];
normxp0=norm(xp0(i,1:2)');
%test hybrid controller%%%%%%%%%%%%%%%%%%%%%%
Out=runSim(x0);
x=Out(:,1:6);
xp=x(:,1:2);
xc=x(:,3:4);
v=x(:,5);
tau=x(:,6);
t=Out(:,8);
j=Out(:,7);
normxHybrid=(xp(:,1).^2+xp(:,2).^2);
L2normHybrid(i)=sqrt(trapz(t,normxHybrid));
%%%test CT controller
 flag=1;
 Out=runSim(x0);
 x=Out(:,1:6);
 xp=x(:,1:2);
 xc=x(:,3:4);
 v=x(:,5);
 tau=x(:,6);
 t=Out(:,8);
 j=Out(:,7);
 yp=xp(:,1);
 normxCT=(xp(:,1).^2+xp(:,2).^2);
 L2normCT(i)=sqrt(trapz(t,normxCT));
%%%Test pole-placement poles -1\pm i
%Store hybrdid Controller
Ac0=Ac;
Bc0=Bc;
Cc0=Cc;
Dc0=Dc;
clear Ac Bc Cc Dc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Kp=[-2, -2];
Lp=[2; 2];
Controller=ss(Ap+Bp*Kp-Lp*Cp,Lp, Kp,0);
global Ac Bc Cc Dc
Ac=Controller.a;
Bc=Controller.b;
Cc=Controller.c;
Dc=Controller.d;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Out=runSim(x0);
x=Out(:,1:6);
xp=x(:,1:2);
xc=x(:,3:4);
v=x(:,5);
tau=x(:,6);
t=Out(:,8);
j=Out(:,7);
yp=xp(:,1);
normxCTPole=(xp(:,1).^2+xp(:,2).^2);
L2normCTPole(i)=sqrt(trapz(t,normxCTPole));
%%%restore hybrid controller
clear Ac Bc Cc Dc
global Ac Bc Cc Dc
Ac=Ac0;
Bc=Bc0;
Cc=Cc0;
Dc=Dc0;
end
%%Compute criteria
improvL2=(-L2normHybrid+L2normCT)./L2normCT*100;
improvL2Pole=(-L2normHybrid+L2normCTPole)./L2normCTPole*100;
