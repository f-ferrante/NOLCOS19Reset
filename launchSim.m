clc;
Out=runF();
x=Out(:,1:6);
xp=x(:,1:2);
xc=x(:,3:4);
v=x(:,5);
tau=x(:,6);
t=Out(:,8);
j=Out(:,7);
yp=xp(:,1);
q=1/2*(1-sign(tau-rho));
signal=Cc(1).*xc(:,1)+Cc(2).*xc(:,2)+Dc*yp;
u=(1-q).*signal+v.*q;
%% Multi figure
%   hold on; 
%   plotflows(t,j,x(:,1)-x(:,3),'--k',1,[0,0,0]);
%   hold on;
%   plotflows(t,j,x(:,2)-x(:,4),'--k',1,[0,0,0]+0.55);
%  grid on;
%hold on;
%plotflows(t,j,Phi,'-k',1,[0,0,0]);
% 
% %[EE, V]=plotV(P1,P2,epsilon,e,tau,t,j,'k',1,sigma);
% 
% hold on;
% subplot(3,1,1)
% plotflows(t,j,x(:,1)-x(:,3),'-k',1,[0,0,0]+0.0);
% hold on;
% grid on;
% subplot(3,1,2)
% plotflows(t,j,x(:,2)-x(:,4),'-k',1,[0,0,0]+0.55);
% hold on;
% grid on;
% 
% subplot(3,1,3)
% plotflows(t,j,e,'-k',1,[0,0,0]+0.0);
% hold on;
% grid on;

%% Build input
% time1=0:0.01:5;
% time2=5:0.01:10;
% time3=10:0.01:15;
% time4=15:0.01:25;
% 
% for i=1:max(size(time1))
%     w(i)=-1;   
% end
% 
% for j=i+1:i+max(size(time2))
%     w(j)=1;   
% end
% 
% for d=j+1:j+max(size(time3))
%     w(d)=-1;   
% end
% 
% for k=d+1:d+max(size(time4))
%     w(k)=0;   
% end
% 
%   
%  subplot(3,1,3)
%  plot(time,w,'-k');
%  xlabel('t')
%  hold on;
%  grid on;
% 








