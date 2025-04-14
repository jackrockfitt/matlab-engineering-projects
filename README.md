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
