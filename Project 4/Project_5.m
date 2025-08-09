% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % this_program_writed_by_Sahand_Tang_Erami% % % % % % % % %
% % % % % % % % % % % % %Modern_Control_Final_Project % % % % % % % % % % %
% % % % % % % % % % % % % % % % %1397/12/9% % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% in this project I assumed T=0.5
clear all
close all
clc
%% Initialize(Part_a)
A=[0 0 1 0;0 0 0 1;-10 10 -2 2;60 -660 12 -12];
B=[0;0;0.0033;-0.02];
C=eye(4);
D=[0];
%% Descritize(Part_a)
sys=ss(A,B,C,D);
sysd=c2d(sys,.5);
Ad=sysd.A
Bd=sysd.B
Cd=sysd.C
Dd=sysd.D

%% controllability(Part_b)
Pc=ctrb(Ad,Bd);
R=rank(Pc);
if R==4
    disp('System is controllable')
else
    disp('System is not controllable')
end
%% SVFC(Part_b)
Kd=acker(Ad,Bd,[0,0,0,0]);
c1=feedback(sysd,Kd);
dpoles=pole(c1);
% step(c1(1))
N=dcgain(c1(1));
Np=1/N;
c1=c1*Np
step(c1(1))
%% Observability(Part_c)
Pc=obsv(Ad,Cd);
Ro=rank(Pc);
if Ro==4
    disp('System is observable')
else
    disp('System is not observable')
end
%% Observer(Part_c)
L=acker(Ad',[1 0 0 0]',[0,0,0,0])';
Ado=Ad-L*[1 0 0 0];
Bdo=[Bd L];
