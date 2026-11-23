# University Wolfram Mathematica Labs (12YPAS)

Wolfram Mathematica (Wolfram Language) laboratory scripts and computational models from the **12YPAS** (*Computational and Programming Systems*) coursework at **CTU in Prague (FNSPE / FJFI)**[cite: 1, 9, 12].

## Repository Structure

| Lab | Directory | Main Topics |
| :--- | :--- | :--- |
| **Lab 01** | `lab01-symbolic-expressions-and-functions/` | High-precision arithmetic, lists & indexing, immediate (`=`) vs. delayed (`:=`) evaluation, user-defined functions[cite: 1, 2, 10, 12] |
| **Lab 02** | `lab02-algebraic-manipulation-and-simplification/` | Polynomial expansion & simplification, integer/polynomial factorization, Gaussian integers, rule replacement (`/.`, `//.`)[cite: 1, 2, 10, 12] |
| **Lab 03** | `lab03-equations-and-linear-algebra/` | Analytical & numerical equation solving (`Solve`, `NSolve`, `Reduce`, `FindRoot`), Newton-Raphson via `FixedPoint`, linear systems & `SparseArray`[cite: 2, 3, 10, 12] |
| **Lab 04** | `lab04-calculus-and-series/` | Symbolic derivatives & integration, improper integrals, power/Taylor series approximations, limits with assumptions[cite: 2, 3, 10, 11, 12] |
| **Lab 05** | `lab05-ordinary-differential-equations/` | Analytical (`DSolve`) & numerical (`NDSolve`) ODEs, Laplace transforms, Lorenz attractor phase-space trajectories[cite: 3, 12] |
| **Lab 06** | `lab06-visualizations-and-animations/` | 2D/3D plots, contour & density maps, parametric 3D surfaces (Möbius strip, twisted toroid), acoustic membrane animation, compiled 3D Mandelbrot surface[cite: 4, 5, 6, 7, 8, 12] |
| **Lab 07** | `lab07-blackbody-radiation-modeling/` | Planck's spectral radiance law, short-wavelength limits, Wien's displacement law, SI physical constants (`Quantity`), Stefan-Boltzmann integral[cite: 11] |

## Running the Scripts

Each module is provided as a standalone Wolfram Language (`.wl`) script[cite: 1, 2, 3, 4, 5, 6, 7, 8, 10, 11]. You can run them directly in the Wolfram Mathematica FrontEnd or from a terminal using `wolframscript`:

```bash
wolframscript -f lab07-blackbody-radiation-modeling/plancks_law.wl
