# 📘 Modern Control 1

This repository contains projects from the Modern Control 1 course.

## 📁 Directory Structure

- `Project 1/` – Codes and description for the project of 'State-Space Control of a Two-Liquid-Tank System'
- `Project 2/` – Codes and description for the project of 'Modeling and Control of a Quarter-Car Suspension Vibration System'
- `Project 3/` – Codes and description for the project of 'Modeling and Control of a Bicycle Vehicle System'
- `Project 4/` – Codes and description for the project of 'Modeling and Digital Control of a Quarter-Car Suspension Vibration System'
- `README.md` – You’re here!

## 🎯 Purposes

- `Project 1:` – The purpose of this project is to simulate both the nonlinear open-loop system and its linearized equivalent. Additionally, the project analyzes the controllability and observability of the linearized system. It also involves the design and implementation of a state feedback controller and an observer in continuous time.

- `Project 2:` – The purpose of this project is to simulate the open-loop dynamics of a Quarter-Car Suspension Vibration System. Additionally, various controllers will be designed for the system. In the advanced control approach, a state observer (SVFC) along with classical full-state feedback controllers—such as PID, PI, or P action—will be used to estimate the state variables.

- `Project 3:` – The purpose of this system is to simulate the open-loop behavior and control the vehicle’s lateral dynamics using the steering angle as the input.

- `Project 4:` – The purpose of this project is to simulate both the nonlinear open-loop system and its linearized equivalent. Additionally, the project analyzes the controllability and observability of the linearized system. It also involves the design and implementation of a state feedback controller and an observer in discrete time.

## 🧠 Technical Notes

- All code is written in **MATLAB/Simulink**.


## 🛠️ Project 1
Description: 

Consider a fluid system consisting of two tanks with two input flow rates \( u_1 = q_{1f}(t) \) and \( u_2 = q_{2f}(t) \), and outputs \( y_1 = q_1(t) \) and \( y_2 = q_2(t) \), as illustrated in the figure below.

<img width="346" height="189" alt="image" src="https://github.com/user-attachments/assets/457a0ad2-6736-47d9-95db-781fe6f4ab15" />

- `a:` Linearize the nonlinear system equations around the equilibrium point and derive the linearized state-space equations.
- `b:` Obtain the transfer function matrices of the linearized system.
- `c:` Apply step, sinusoidal, and impulse inputs to the nonlinear system, compute and plot the system’s response. Then repeat the same for the linearized system and compare the results.
- `d:` For the linearized system, analyze the controllability and observability.
- `e:` If it is possible to design a state feedback controller and observer for the linearized system, design and implement the closed-loop control system along with the state estimator.
- `f:` Investigate the effect of parameter variations on the designed control system.
- `g:` Investigate the effect of measurement noise on the output of the designed control system.

## 🛠️ Project 2
Description: 

This system models the quarter-car vibration as shown in the figure. The input to the system is the force U(t), and the output is the displacement 𝑥1(𝑡).

<img width="479" height="355" alt="image" src="https://github.com/user-attachments/assets/37db7433-9b1a-463d-a746-a0442c0dafab" />

- `a:` Find the transfer function between the input u and the output y = x1
- `b:` To simulate the open-loop behavior of the system, obtain and plot the state variables’ responses considering non-zero initial conditions.
- `c:` Investigate which classical controllers (P-action, PI-action, or PID-action) can be applied to the system to satisfy the controller design requirements. Implement each controller that is feasible for the system.
- `d:` Investigate whether an advanced state vector feedback controller (SVFC) can be designed for the system. If yes, design and implement such a controller that meets the specified requirements.
- `e:` Design a continuous-time full-state observer to estimate the system’s state variables and demonstrate that the estimation performs correctly.

## 🛠️ Project 3
Description: 

This project aims to investigate the lateral dynamics of a vehicle based on the bicycle model and design its control. The system model is illustrated in the figure below.

<img width="468" height="336" alt="image" src="https://github.com/user-attachments/assets/a5c2eeef-61f8-4f48-bc9c-24ebba483aad" />

- `a:` Considering the steering angle input 𝛿(𝑡) as:a) unit impulse,b) step input,c) A sinusoidal input (with one period), simulate the open-loop lateral dynamics equations of the vehicle.
- `b:` Implement the state vector feedback control strategy for this system.
- `c:` For the state vector feedback control system designed in the previous part, design a continuous-time full-order state observer that, during the implementation of the closed-loop state vector feedback control system, can simultaneously estimate the state variables and provide them to the controller. Then, perform a complete simulation of the resulting closed-loop system.
- `d:` Assume that in the above vehicle system model, there is a disturbance input and also measurement noise in the output signals. Investigate whether the designed control system still performs correctly under these conditions.

## 🛠️ Project 4
Description: 

Consider again the dynamic system from Project 1. In this section, we aim to discretize the continuous-time system with a sampling time 𝑇, and then design a finite-time settling digital controller (Finite Time Settling Control: FTSC) along with a two-stage finite-time settling observer that achieves zero steady-state estimation error.

<img width="413" height="286" alt="image" src="https://github.com/user-attachments/assets/10684c57-0d68-436e-95ad-230895580b43" />

- `a:` Discretize the state-space equations of the system.
- `b:` Design and implement a finite-time digital feedback controller with zero steady-state error, without considering the observer. Demonstrate that the steady-state error is eliminated.
- `c:` Considering the observer, design and implement a fully digital closed-loop control system with state estimation that ensures zero steady-state error
- `d:` Investigate the effect of system parameter variations.
- `e:v Assuming the presence of noise in the output, does the designed system still function correctly?
