%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Francesco Ferrante 2019
%
% Description: This code generates the example in the paper
% "Dynamic reset output feedback with guaranteed convergence rate" by
% Ferrante F. & Zaccarian L
%
% For this code to be correctly exectuted, one needs the following software:

%1- For the solution to LMIs:

    %1.1- YALMIP; freely available at: https://yalmip.github.io/download/
     
    %1.2- The SDPT3 solver; freely available at: https://github.com/SQLP/SDPT3

%2- Hybrid Equations Toolbox for the simulation of hybrid systems. This is freely avaialable at:

   %https://www.mathworks.com/matlabcentral/fileexchange/41372-hybrid-equations-toolbox-v2-04

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ControllerDesign; %design reset controller

runRandTest; %design reset controller