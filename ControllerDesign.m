clear all;

Ap=[0,1; 0, 0];

Bp=[0;1];

Cp=[1 0];
 
alpha=1;
np=max(size(Ap));
nu=min(size(Bp));
ny=min(size(Cp));

Cbreve=blkdiag(eye(np), Cp);
rho=0.01;
sigma=10;
t=sdpvar(1,1,'symmetric');
X=sdpvar(np,np,'symmetric');
Y=sdpvar(np,np,'symmetric');
K=sdpvar(np,np,'full');
L=sdpvar(np,nu,'full');
R=sdpvar(ny,np,'full');
N=sdpvar(ny,nu,'full');
Mtilde=sdpvar(np+ny,np+ny,'symmetric');
S=sdpvar(nu,np,'full');
Q=sdpvar(nu,ny,'full');
T=sdpvar(np,np,'full');
J=sdpvar(np,ny,'full');
 
 A1=[Ap, zeros(np,np), Bp;
     zeros(np,np), zeros(np,np), zeros(np,nu);
     zeros(nu,np),zeros(nu, np), zeros(nu,nu)];
 
 Phi=expm(A1*rho);
 Arho=Phi(1:np,1:np);
 Brho=Phi(1:np,2*np+1:2*np+nu);  
 
 Gamma=[Ap*Y+Bp*R, Ap+Bp*N*Cp;
        K,X*Ap+L*Cp];
  
Lambda=[Arho*Y+Brho*S, Arho+Brho*Q*Cp;
         T, X*Arho+J*Cp];
     
 Psi=[S, Q*Cp];    
    
Upsilon=[Y, eye(np); eye(np), X];

PiF=Gamma+Gamma'+2*alpha*Upsilon-sigma*Cbreve'*Mtilde*Cbreve;

PiJ=[-exp(-2*alpha*rho)*Upsilon+Cbreve'*Mtilde*Cbreve, Lambda', Psi';
      Lambda, -Upsilon,zeros(2*np,nu);
      Psi,zeros(nu,2*np),-eye(nu)];

problem=[Gamma+Gamma'>=-2.3*Upsilon,...
    Gamma+Gamma'<=2.3*Upsilon,...
    PiJ<=-eye(max(size(PiJ)))*1e-9,PiF<=-eye(max(size(PiF)))*1e-9];
   
options=sdpsettings('solver','sdpt3','verbose',2);

solution=optimize(problem,0,options);
if(solution.problem==0)
 
%%Controller parameters%%%
K=double(K);
R=double(R);
L=double(L);
Y=double(Y);
X=double(X);
N=double(N);

S=double(S);
T=double(T);
Q=double(Q);
J=double(J);
Mtilde=double(Mtilde);
U=X;
V=inv(X)-Y;

Sigma_C=[inv(U), -inv(U)*X*Bp; zeros(nu, np),eye(nu)]*[K-X*Ap*Y,L; R, N]*[inv(V'), zeros(np, nu);-Cp*Y*inv(V'), eye(nu)];

Ac=Sigma_C(1:np,1:np);
Bc=Sigma_C(1:np,np+1:nu+np);
Cc=Sigma_C(np+1:np+nu,1:np);
Dc=Sigma_C(np+1:np+nu,np+1:np+ny);
M=[zeros(ny,np), eye(ny); inv(V), -inv(V)*Y*Cp']*Mtilde*[zeros(np,ny), inv(V');eye(ny), -Cp*Y*inv(V')];
Sigma_D=[-inv(U)*X*Brho, inv(U); eye(nu),zeros(nu, np)]*[S, Q; T-X*Arho*Y, J]*[zeros(np, nu),inv(V');eye(nu),-Cp*Y*inv(V')];
Gc=Sigma_D(1:np,1:ny);
Kc=Sigma_D(1:np,ny+1:ny+np);
Gv=Sigma_D(np+1:ny+np,1:ny);
Kv=Sigma_D(np+1:nu+np,ny+1:ny+np);
lambda=2*alpha;
end
global rho Ap Bp Cp Ac Bc Cc Dc lambda Gv Kv Gc Kc M


