clc 
clear all
close all
%% State_space_Matrix(Part_e)
A=[-0.01814 0.01814;0.03556 -0.0566];
B=[0.1624 0;0 0.3183];
C=[0.11172 -0.11172;0 0.06618];
D=[0 0;0 0];
%% controllability(Part_e)
Pc=ctrb(A,B);
R=rank(Pc);
if R==2
    disp('System is controllable')
else
    disp('System is not controllable')
end
%% Observability(Part_e)
Po=obsv(A,C);
Ro=rank(Po);
if Ro==2
    disp('System is observable')
else
    disp('System is not observable')
end
%% Controller
P=[-3 -3];
k=place(A,B,P)
Ac=A-B*k
%% Observer
p=[-6;-6];
L = place(a,c,p)
Ao=A-L*C

