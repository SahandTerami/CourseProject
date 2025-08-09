% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % this_program_writed_by_Sahand_Tang_Erami% % % % % % % % %
% % % % % % % % % % % % %Modern_Control_Final_Project % % % % % % % % % % %
% % % % % % % % % % % % % % % % %1397/12/9% % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clc
clear all
close all
%% Initialize(Part_b)
M=1000;
Vx=20;
Lf=1;
Lr=1.5;
Iz=1650;
Calr=60e3;
Calf=60e3;
%% State_space_matrix(Part_b)
A=[0 1 0 0
    0 -(2*(Calr+Calf)/(M*Vx)) 2*(Calf+Calr)/M (2*(-Calf*Lf+Calr*Lr)/(M*Vx))
    0 0 0 1
    0 -(2*(Lf*Calf-Lr*Calr)/(Iz*Vx)) 2*(Calf*Lf-Calr*Lr)/Iz -(2*((Lf^2)*Calf+(Lr^2)*Calr)/(Iz*Vx))];
B=[0;2*Calf/M;0;(2*Lf*Calf)/Iz];
C=[0 0 1 0];
D=[0];
%%  Plot(Part_b)
sys=ss(A,B,C,D);
impulse(sys);
%step(sys)
% t = 0:0.001:2*pi;
% u = sin(t);
% lsim(sys,u,t)
