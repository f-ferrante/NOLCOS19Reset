function y= dz(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(abs(x)<=1)
y=0;
else
y=sign(x)*(abs(x)-1);
end

