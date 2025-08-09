% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % this_program_writed_by_Sahand_Tang_Erami% % % % % % % % %
% % % % % % % % % % % % %Modern_Control_Final_Project % % % % % % % % % % %
% % % % % % % % % % % % % % % % %1397/12/9% % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clc
clear all
close all
%% System_Values(Part_c_and_d_and_e)
M=1573;
Vx=30;
Lf=1.1;
Lr=1.58;
Iz=2873;
Calr=80e3;
Calf=80e3;
%% System_State_space_matrix(Part_c_and_d_and_e)
A=[0 1 0 0
    0 -(2*(Calr+Calf)/(M*Vx)) 2*(Calf+Calr)/M (2*(-Calf*Lf+Calr*Lr)/(M*Vx))
    0 0 0 1
    0 -(2*(Lf*Calf-Lr*Calr)/(Iz*Vx)) 2*(Calf*Lf-Calr*Lr)/Iz -(2*((Lf^2)*Calf+(Lr^2)*Calr)/(Iz*Vx))];
B=[0;2*Calf/M;0;(2*Lf*Calf)/Iz];
C=[1 0 0 0];
D=[0];
sys=ss(A,B,C,D)
[num,den]=ss2tf(A,B,C,D)
%% controllability(Part_c)
sys=ss(A,B,eye(4),D);
Pc=ctrb(sys);
R=rank(Pc);
if R==4
    disp('System is controllable')
else
    disp('System is not controllable')
end
%% SVFC(Part_c)
P=[-5-3*i,-5+3i,-7 -10];
K=place(A,B,P);
sys1=feedback(sys,K);
%step(sys1(1))
%% Observability(Part_d)
Po=obsv(sys);
Ro=rank(Po);
if Ro==4
    disp('System is observable')
else
    disp('System is not observable')
end
%% Observer(Part_d)
P=[-5-3*i,-5+3i,-7 -10];
L=place(A',C',P)';
Ao=A-L*C;
%% Time_values(Part_d)
ts=0;
tf=10;
dt=0.01;
t=ts:dt:tf;
%% Initial_values(Part_d)
u1(1)=0;
xhat1(1)=0;
xhat2(1)=0;
xhat3(1)=0;
xhat4(1)=0;
X1(1)=xhat1(1);
X2(1)=xhat2(1);
X3(1)=xhat3(1);
X4(1)=xhat4(1);
%% gain(Part_d)
k1=K(1);
k2=K(2);
k3=K(3);
k4=K(4);
l1=L(1);
l2=L(2);
l3=L(3);
l4=L(4);
%% SVFC_and_observer_for_step(Part_d)
for i=2:length(t)
u1(i)=1;

%Observer & SVFC
Y1(i-1)=X1(i-1);
Y2(i-1)=0;
Y3(i-1)=0;
Y4(i-1)=0;

X1(i)=X1(i-1)+dt*(X2(i-1));
X2(i)=X2(i-1)+dt*(-15.9462*X1(i-1)-10.2252*X2(i-1)+75.0683*X3(i-1)-14.8013*X4(i-1)+...
    101.7165*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1)-k3*xhat3(i-1)-k4*xhat4(i-1)));
X3(i)=X3(i-1)+dt*(X4(i-1));
X4(i)=X4(i-1)+dt*(-3.3059*X1(i-1)+0.8911*X2(i-1)-26.7316*X3(i-1)-6.8804*X4(i-1)+...
    61.2600*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1)-k3*xhat3(i-1)-k4*xhat4(i-1)));
%Observer
yhat1(i-1)=xhat1(i-1);
yhat2(i-1)=0;
yhat3(i-1)=0;
yhat4(i-1)=0;

xhat1(i)=xhat1(i-1)+dt*(xhat2(i-1));
xhat2(i)=xhat2(i-1)+dt*(-15.9462*xhat1(i-1)-10.2252*xhat2(i-1)+75.0683*xhat3(i-1)-14.8013*xhat4(i-1)+...
    101.7165*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1)-k3*xhat3(i-1)-k4*xhat4(i-1)))+...
    l1*(Y1(i-1)-yhat1(i-1))+l2*(Y2(i-1)-yhat2(i-1))+l3*(Y3(i-1)-yhat3(i-1))+l4*(Y4(i-1)-yhat4(i-1));
xhat3(i)=xhat3(i-1)+dt*(xhat4(i-1));
xhat4(i)=xhat4(i-1)+dt*(-3.3059*xhat1(i-1)+0.8911*xhat2(i-1)-26.7316*xhat3(i-1)-6.8804*xhat4(i-1)+...
    61.2600*(u1(i-1)-k1*xhat1(i-1)-k2*xhat2(i-1)-k3*xhat3(i-1)-k4*xhat4(i-1)))+...
    l1*(Y1(i-1)-yhat1(i-1))+l2*(Y2(i-1)-yhat2(i-1))+l3*(Y3(i-1)-yhat3(i-1))+l4*(Y4(i-1)-yhat4(i-1));

end
%% Plot
grid on
hold on
%%%% system state space%%%%
% xlabel Time(s)
% ylabel Amplitude
% title 'System state space'
% plot(t,X1);
% plot(t,X2);
% plot(t,X3);
% plot(t,X4);
% legend x1 x2 x3 x4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%observer state space%%%%
% xlabel Time(s)
% ylabel Amplitude
% title 'observer state space'
% plot(t,xhat1);
% plot(t,xhat2);
% plot(t,xhat3);
% plot(t,xhat4);
% legend xhat1 xhat2 xhat3 xhat4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%