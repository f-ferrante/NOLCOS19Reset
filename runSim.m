function [outF]= runSim(x0)

% initial conditions
%x1_0 = -10;
%x2_0 = 10;
%x3_0 = 0;
%x4_0 = 0;

 %x1_0=-2*0.6291;
 %x2_0=2*10;
 %x3_0=2*0.1360; 
 %x4_0=2*0.7653;
%x0 = [x1_0;x2_0;x3_0;x4_0;0;0];
% simulation horizon
TSPAN=[0  10];
JSPAN = [0 1000];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1e-3,'MaxStep',0.01);

maxStepCoefficient = .1;  % set the maximum step length. At each run of the
                   % integrator the option 'MaxStep' is set to 
                   % (time length of last integration)*maxStepCoefficient.
                   %  Default value = 0.1

% simulate
%[t x j] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options,maxStepCoefficient);
[t j x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);
% plot solution
% position


    
% hold on
% plotflows(t,j,x(:,1)-x(:,3));
% grid on
% plotflows(t,j,x(:,2)-x(:,4));

outF=[x,j,t];

end
