clc 
clear all
close all
%% State_space_Matrix(Part_c)
A=[-0.01814 0.01814;0.03556 -0.0566];
B=[0.1624 0;0 0.3183];
C=[0.11172 -0.11172;0 0.06618];
D=[0 0;0 0];
%% Transfer_function_matrix(Part_c)
sys=ss(A,B,C,D);
G=tf(sys)