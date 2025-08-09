clc
clear
close all
%% System_values
H=10;
D=4;
pi=3.1416;
K1=0.316;
K2=0.296;
%% Time_values
ts=0;
tf=10;
dt=0.01;
t=ts:dt:tf;
%% Initial_values
u1(1)=0;
u2(1)=0;
xhat1(1)=0;
xhat2(1)=0;
X1(1)=xhat1(1);
X2(1)=xhat2(1);
%% Gains
k1=4.3612;
k2=3.1117;
k3=3.1117;
k4=1.2473;
l1=53.5433;
l2=90.6618;
l3=0.3183;
l4=90.3439;
%% SVFC_and_observer_for_step
for i=2:length(t)
u1(i)=1;
u2(i)=1;
%Observer & SVFC
Y1(i-1)=(0.11172)*X1(i-1)-(0.11172)*X2(i-1);
Y2(i-1)=(0.06618)*X2(i-1);

X1(i)=X1(i-1)+dt*(-0.018141476628452*X1(i-1)+0.018141476628452*X2(i-1)+0.162382348687210*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1)));
X2(i)=X2(i-1)+dt*(0.035556602383417*X1(i-1)-0.056620924415524*X2(i-1)+0.318263211127003*(u2(i-1)-k3*xhat1(i-1)-k4*xhat2(i-1)));
%Observer
yhat1(i-1)=(0.11172)*xhat1(i-1)-(0.11172)*xhat2(i-1);
yhat2(i-1)=(0.06618)*xhat2(i-1);

xhat1(i)=xhat1(i-1)+dt*(-0.018141476628452*xhat1(i-1)+0.018141476628452*xhat2(i-1)+ ...
    0.162382348687210*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1))+l1*(Y1(i-1)-yhat1(i-1))+l2*(Y2(i-1)-yhat2(i-1)));
xhat2(i)=xhat2(i-1)+dt*(0.035556602383417*xhat1(i-1)-0.056620924415524*xhat2(i-1)+...
    0.318263211127003*(u2(i-1)-k3*xhat1(i-1)-k4*xhat2(i-1))+l3*(Y1(i-1)-yhat1(i-1))+l4*(Y2(i-1)-yhat2(i-1)));

end
%% Plot
grid on
hold on
xlabel Time(s)
ylabel Amplitude
title 'SVFC Gain Change in system'
plot(t,X2);
plot(t,X1);
 legend x1 x2
% plot(t,xhat2);
% plot(t,xhat1);

% t=ts:dt:tf-dt;
% plot(t,Y2);
% plot(t,Y1);

% plot(t,yhat2);
% plot(t,yhat1);
