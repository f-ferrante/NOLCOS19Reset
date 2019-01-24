function xplus=g(x)
xp1 = x(1);
xp2 = x(2);
xc1 = x(3);
xc2 = x(4);
v = x(5);
tau=x(6);
global Kc Kv Gc Gv Cp
xp=[xp1;xp2];
xc=[xc1;xc2];
yp=Cp*xp;

xpplus=xp;
xcplus=Kc*xc+Gc*yp;
vplus=Kv*xc+Gv*yp;
tauplus=0;

xplus=[xpplus;xcplus;vplus;tauplus];
end