% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % this_program_writed_by_Sahand_Tang_Erami% % % % % % % % %
% % % % % % % % % % % % %Modern_Control_Final_Project % % % % % % % % % % %
% % % % % % % % % % % % % % % % %1397/12/9% % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
clc
clear all
close all
%% Initialize(Part_b_and_c)
% A=[0 0 1 0;0 0 0 1;-10 10 -2 2;60 -660 12 -12];
% B=[0;0;0.0033;-0.02];
% C=[1 0 0 0];
% D=[0];
% 
% A = [1, 0.00958419619475136, 0.0104077383156783
%     0, 0.880217654134450, 2.02956823954280
%     0, -0.102406711940655, 0.862350586928406];
% B = [0.0388811995595289; 11.5416986681227; 10.5268226869341];
% C = [1,0,0];
D=[0];
% [m,~] = size(A);
% A_a = [A zeros(m,1); C*A 1];
% B_a = [B;C*B];
% C_a = [zeros(1,m) 1];
% Q = C_a'*C_a;



A=[1,0.00958419619475136,0.0104077383156783,0;0,0.880217654134450,2.02956823954280,0;0,-0.102406711940655,0.862350586928406,0;1,0.00958419619475136,0.0104077383156783,1];
B=[0.0388811995595289;11.5416986681227;10.5268226869341;0.0388811995595289];
C=[0,0,0,1];
x0=[.2;0;0;0];
%% transfer_function(Part_b)
sys=ss(A,B,C,D);
% [num,den]=ss2tf(A,B,C,[0]);
% syss=tf(num,den)
%% Response_to_initial_condition_(Part_c)
% sys=ss(A,B,C,D);
% initial(sys,x0)
grid
%% controllability(Part_e)
Pc=ctrb(A,B);
R=rank(Pc);
if R==4
    disp('System is controllable')
else
    disp('System is not controllable')
end
%% SVFC_gain(Part_e)
syse=ss(A,B,eye(4),D);
K=place(A,B,[-7,-8,-9,-10]);
c1=feedback(syse,K);
P=pole(c1);
N=dcgain(c1(1));
Np=1/N;
%% Observability(Part_f)
Po=obsv(A,C);
Ro=rank(Po);
if Ro==4
    disp('System is observable')
else
    disp('System is not observable')
end
%% Observer
PO=pole(sys);
L=acker(A',C',PO)';
Ao=A-L*C;