(* ::Package:: *)

(* ========================================================================= *)
(* Lab 05: Ordinary Differential Equations & Integral Transforms             *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topic 7                                                     *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Analytical ODEs via DSolve --- *)
(* First-order linear decay ODE *)
decaySol = DSolve[{y'[t] + k y[t] == 0, y[0] == y0}, y[t], t]

(* Second-order damped harmonic oscillator *)
oscillatorSol = DSolve[{
    y''[t] + 2 gamma y'[t] + omega0^2 y[t] == 0,
    y[0] == 1, y'[0] == 0
}, y[t], t] // FullSimplify

(* --- 2. Laplace Transforms --- *)
LaplaceTransform[t^2 Exp[-a t] Sin[omega t], t, s]
InverseLaplaceTransform[1/((s + a)^2 + omega^2), s, t]

(* --- 3. Numerical ODEs & Phase-Space Trajectories via NDSolve --- *)
(* Nonlinear Lorenz system *)
sigma = 10; rho = 28; beta = 8/3;
lorenzSol = NDSolve[{
    x'[t] == sigma (y[t] - x[t]),
    y'[t] == x[t] (rho - z[t]) - y[t],
    z'[t] == x[t] y[t] - beta z[t],
    x[0] == 1, y[0] == 1, z[0] == 1
}, {x, y, z}, {t, 0, 30}];

ParametricPlot3D[
    Evaluate[{x[t], y[t], z[t]} /. lorenzSol],
    {t, 0, 30},
    PlotPoints -> 2000,
    ColorFunction -> Function[{x, y, z, t}, Hue[t]],
    AxesLabel -> {"x(t)", "y(t)", "z(t)"},
    PlotLabel -> "Lorenz Attractor Phase Trajectory"
]
