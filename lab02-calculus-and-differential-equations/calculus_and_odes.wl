(* ::Package:: *)

(* ========================================================================= *)
(* Lab 02: Calculus, Power Series, Integral Transforms & Differential Eqns   *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Topics: Taylor Series, Improper Integrals, ODEs (DSolve / NDSolve),       *)
(*         Laplace Transforms, and Phase-Space Trajectory Visualization      *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Power Series & Asymptotic Expansions --- *)
series1 = Series[Exp[-a t] (1 + Sin[2 t]), {t, 0, 5}]
Normal[series1]

(* Series composition and algebraic manipulation *)
polyApprox = Normal[Series[Sin[x]/x, {x, 0, 8}]]
Plot[{Sin[x]/x, polyApprox}, {x, -4 Pi, 4 Pi},
    PlotRange -> {-0.5, 1.2},
    PlotLegends -> {"Sin[x]/x", "Taylor Order 8"},
    PlotStyle -> {Thick, Dashed},
    GridLines -> Automatic
]

(* --- 2. Symbolic & Improper Integration --- *)
(* Rational function integration and derivative check *)
intRational = Integrate[1/(1 - x^8), x]
Simplify[D[intRational, x]]

(* Gaussian improper integral *)
Integrate[Exp[-x^2/(2 sigma^2)], {x, -Infinity, Infinity}, Assumptions -> sigma > 0]

(* High-precision numerical evaluation of improper integrals *)
impInt = Integrate[x^(2/3) Log[3/x^(1/2)]^3 Exp[-2 x^(1/3)], {x, 0, Infinity}]
N[impInt, 50]

(* --- 3. Laplace Transforms --- *)
LaplaceTransform[t^2 Exp[-a t] Sin[omega t], t, s]
InverseLaplaceTransform[1/((s + a)^2 + omega^2), s, t]

(* --- 4. Analytical & Numerical Differential Equations --- *)
(* Damped harmonic oscillator (analytical solution via DSolve) *)
oscillatorSol = DSolve[{
    y''[t] + 2 gamma y'[t] + omega0^2 y[t] == 0,
    y[0] == 1, y'[0] == 0
}, y[t], t] // FullSimplify

(* Nonlinear Lorenz system (numerical integration via NDSolve) *)
sigma = 10; rho = 28; beta = 8/3;
lorenzSol = NDSolve[{
    x'[t] == sigma (y[t] - x[t]),
    y'[t] == x[t] (rho - z[t]) - y[t],
    z'[t] == x[t] y[t] - beta z[t],
    x[0] == 1, y[0] == 1, z[0] == 1
}, {x, y, z}, {t, 0, 30}];

(* 3D Phase-space trajectory of the Lorenz attractor *)
ParametricPlot3D[
    Evaluate[{x[t], y[t], z[t]} /. lorenzSol],
    {t, 0, 30},
    PlotPoints -> 2000,
    ColorFunction -> Function[{x, y, z, t}, Hue[t]],
    AxesLabel -> {"x(t)", "y(t)", "z(t)"},
    PlotLabel -> "Lorenz Attractor Phase Trajectory"
]
