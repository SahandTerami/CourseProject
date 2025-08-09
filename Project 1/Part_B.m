clc
clear all
close all

%% Defining_of_X_and_Y
syms   H D x1 x2 u1 u2 k1 k2 X Y
X1=((4*H^2)/(pi*D^2*x1^2))*(u1-k1*sqrt(x1-x2));
X2=((4*H^2)/(pi*D^2*x2^2))*(u2+k1*sqrt(x1-x2)-k2*sqrt(x2));
Y1=k1*sqrt(abs(x1-x2));
Y2=k2*sqrt(x2);
%% System_values
H=10;
D=4;
pi=3.1416;
k1=0.316;
k2=0.296;
%% Jacobi_matrix_A(Part_b)
J=jacobian([X1,X2],[x1,x2]) ;
A(11) = - (8*H^2*(u1 - k1*(x1 - x2)^(1/2)))/(D^2*x1^3*pi) - (2*H^2*k1)/(D^2*x1^2*pi*(x1 - x2)^(1/2));                                                                                          
A(12) = (2*H^2*k1)/(D^2*x1^2*pi*(x1 - x2)^(1/2));
A(21) = (2*H^2*k1)/(D^2*x2^2*pi*(x1 - x2)^(1/2));
A(22) = - (4*H^2*(k2/(2*x2^(1/2)) + k1/(2*(x1 - x2)^(1/2))))/(D^2*x2^2*pi) - (8*H^2*(u2 - k2*x2^(1/2) + k1*(x1 - x2)^(1/2)))/(D^2*x2^3*pi);
A =[A(11) A(12) ; A(21) A(22)]
%% Jacobi_matrix_B(Part_b)
J=jacobian([X,Y],[u1,u2]);
B(11) = (4*H^2)/(D^2*x1^2*pi);
B(12) = 0;
B(21) = 0;
B(22) = (4*H^2)/(D^2*x2^2*pi);
B =[B(11) B(12) ; B(21) B(22)]
%% Jacobi_matrix_C(Part_b)
J=jacobian([Y1,Y2],[x1,x2]);
C(11) =(k1*sign(x1 - x2))/(2*abs(x1 - x2)^(1/2));
C(12) = -(k1*sign(x1 - x2))/(2*abs(x1 - x2)^(1/2));
C(21) = 0;
C(22) = k2/(2*x2^(1/2));
C=[C(11) C(12) ; C(21) C(22)]
%% Jacobi_matrix_D(Part_b)
J=jacobian([Y1,Y2],[u1,u2]); 
D(11) = 0;
D(12) = 0;
D(21) = 0;
D(22) = 0;
D=[D(11) D(12) ; D(21) D(22)]
