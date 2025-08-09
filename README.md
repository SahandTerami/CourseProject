# 📘 Modern Control 1

This repository contains projects from the Modern Control 1 course.

## 📁 Directory Structure

- `Project 1/` – Codes and description for the project of 'State-Space Control of a Two-Liquid-Tank System'
- `Project 2/` – Codes and description for the project of 'Modeling and Control of a Quarter-Car Suspension Vibration System'
- `Project 3/` – Codes and description for the project of 'Modeling and Control of a Bicycle Vehicle System'
- `Project 4/` – Codes and description for the project of 'Modeling and Digital Control of a Bicycle Vehicle System'
- `README.md` – You’re here!

## 🎯 Purpose

This repository provides partially implemented code to help you get started with each assignment.  
Within each notebook, you'll find `TODO` sections that guide you through the required implementations. These are designed to support your understanding of the concepts taught in class.

- `Project 1:` – The purpose of this project is to simulate both the nonlinear open-loop system and its linearized equivalent, as presented in the reference paper. Additionally, the project analyzes the controllability and observability of the linearized system. It also involves the design and implementation of a state feedback controller and an observer.

- `Project 2:` – The purpose of this project is to simulate the open-loop dynamics of a Quarter-Car Suspension Vibration System. Additionally, various controllers will be designed for the system. In the advanced control approach, a state observer (SVFC) along with classical full-state feedback controllers—such as PID, PI, or P action—will be used to estimate the state variables.

- `Project 3:` – The purpose of this system is to simulate the open-loop behavior and control the vehicle’s lateral dynamics in continuous time using the steering angle as the input.

- `Project 4:` – The purpose of this system is to simulate the open-loop behavior and control the vehicle’s lateral dynamics in discrete time using the steering angle as the input.

## 🧠 Technical Notes

- All code is written in **MATLAB**.


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


