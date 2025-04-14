# MATLAB Engineering Projects

This repository contains three MATLAB projects developed as part of a university engineering course. Each task demonstrates a different technical focus — from structural analysis to parametric animation and simulation of physical systems. The code is well-structured, fully commented, and written to reflect real-world engineering applications.

---

## Task A – Stress Analysis in a Steel Structure

This MATLAB script (`TaskA.m`) performs a detailed analysis of a 3D stress state in a steel structure. It calculates the following:

- **Stress invariants** (I1, I2, I3)
- **Hydrostatic stress**
- **Second deviatoric invariant** and **von Mises equivalent stress**
- **Principal stresses** (using both characteristic polynomial roots and eigenvalues)
- **Maximum shear stress**
- **Strain energy density**

### Key Concepts Demonstrated:
- Use of **arrays/matrices** to represent the stress tensor
- Use of **MATLAB functions** like `roots()` and `eig()` for principal stress and eigenvalue calculations
- Application of **basic programming constructs**: variables, arithmetic, functions, and structured outputs
- Clear **engineering rationale** and documentation throughout

The script is well-commented and outputs all calculated values to the console for interpretation. This task showcases the ability to translate a real-world mechanical engineering problem into code.

> This task was part of a final course assignment in MATLAB involving structural analysis and mechanical behaviour under stress.

---

## Task B – Parametric Trajectory Animation of Two Particles

This MATLAB script animates the real-time motion of two particles along distinct parametric paths in the 2D XY-plane.

### Features:
- Parametric functions define the X and Y motion of both particles
- A live animation displays:
  - Particle positions
  - Trajectory lines to the origin
  - A dynamic line connecting the two particles
- The animation loop uses a `while` loop with real-time updates via `set()` and `drawnow`

### Key Concepts Demonstrated:
- Use of **function handles** for clean parametric motion
- Implementation of a **real-time animation loop** using `pause()`, `drawnow`, and graphical updates
- Application of **MATLAB plotting functions** for data visualisation
- Clear use of **basic programming constructs**: variables, conditionals (`while`), and function calls

> This task showcases how mathematical expressions can be transformed into dynamic visual simulations using MATLAB.

---

## Task C – Simulation of a Pendulum in a Hemispherical Basin

This MATLAB function simulates the vertical motion of a pendulum moving within a **frictionless hemispherical basin**, by solving the system's non-linear differential equations.

### Features:
- Validates user input for basin size (`R`), starting height (`h`), and time (`Tf`)
- Derives initial conditions based on the hemisphere geometry
- Uses MATLAB’s `ode45` solver to integrate the equations of motion
- Plots the vertical displacement over time
- Displays the small-angle oscillation period for comparison

### Key Concepts Demonstrated:
- Use of **custom function structure** with multiple inputs and outputs
- Implementation of **ODE solving** with `ode45`
- Application of **physics-based modelling** using gravitational and geometric relations
- **Input validation** and structured **user feedback**
- Strong **code clarity** with full documentation and rational comments

> This task highlights the ability to convert complex physical systems into working simulations using MATLAB's built-in tools and clear engineering logic.
