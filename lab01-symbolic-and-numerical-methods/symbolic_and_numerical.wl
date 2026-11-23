(* ::Package:: *)

(* ========================================================================= *)
(* Lab 01: Symbolic Algebra, Numerical Methods & Scientific Visualization    *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* ========================================================================= *)

(* --- 1. High-Precision Arithmetic & List Operations --- *)
N[Pi, 200]
angles = {Pi/4, Pi/3, Pi/2, Pi};
Sin[angles]

(* Immediate (=) vs. Delayed (:=) Assignment *)
b = 3;
fImmediate[x_] = x + b;
fDelayed[x_] := x + b;
b = 5;
{fImmediate[4], fDelayed[4]} (* Returns {7, 9} *)
Clear[b, fImmediate, fDelayed]

(* --- 2. Symbolic Algebra, Calculus & Series Expansion --- *)
FactorInteger[20! - 7!]
Factor[x^2 + y^2, GaussianIntegers -> True]

(* Power series expansion *)
seriesExpr = Series[Exp[-a t] (1 + Sin[2 t]), {t, 0, 4}];
Normal[seriesExpr]

(* Symbolic and improper integration *)
Integrate[1/(1 - x^8), x]
Integrate[Exp[-x^2/(2 sigma^2)], {x, -Infinity, Infinity}, Assumptions -> sigma > 0]

(* --- 3. Equation Solving & Linear Systems --- *)
Solve[x^4 - 5 x^2 - 3 == 0, x]
Reduce[a x^2 + b x + c == 0, x]
Reduce[Abs[z] - z == 1 + 2 I, z]

(* Matrix linear system: A . x == rhs *)
A = {{2.0, 3.1, -1.1}, {0.2, -0.29, 3.3}, {-1.5, 4.2, 4.7}};
rhs = {-1.0, 2.2, 0.5};
solVec = LinearSolve[A, rhs]
A . solVec

(* Parametric linear system *)
Solve[{
    2.0 x + 3.1 y - 1.1 z == a,
    0.2 x - 0.29 y + 3.3 z == 2.2,
    -1.5 x + 4.2 y + 4.7 z == 0.5
}, {x, y, z}]

(* Numerical root finding *)
FindRoot[Tan[x] == x, {x, 4}]

(* --- 4. Fixed-Point Iteration (Newton-Raphson Method) --- *)
NewtonRoot[fn_, x0_] := FixedPoint[(# - fn[#]/fn'[#]) &, x0]
rootCos = NewtonRoot[Cos, N[1, 100]]
rootCos - N[Pi/2, 100]

(* --- 5. Programming Paradigms & Performance Benchmarking --- *)
(* Procedural style *)
factProcedural[n_] := Module[{acc = 1, i = 1},
    If[! (IntegerQ[n] && Positive[n]), Return["Invalid Input"]];
    While[i <= n, acc = acc * i; i++];
    acc
]

(* Functional & rule-based styles *)
factRuleBased[1] = 1;
factRuleBased[n_Integer?Positive] := n factRuleBased[n - 1]
factFunctional[n_Integer?Positive] := Times @@ Range[n]

(* --- 6. Compiled Functions (Mandelbrot Escape-Time Algorithm) --- *)
mandelbrotIter = Compile[{{x, _Real}, {y, _Real}, {maxIter, _Integer}},
    Module[{c = x + I y, z = 0.0 + 0.0 I, n = 0},
        While[Abs[z] < 2.0 && n < maxIter,
            z = z^2 + c;
            n++
        ];
        n
    ]
];

Plot3D[mandelbrotIter[x, y, 50], {x, -0.4, 0.4}, {y, -1.2, -0.4},
    PlotPoints -> 80, PlotRange -> {0, 50}, Mesh -> False,
    AxesLabel -> {"Re(c)", "Im(c)", "Iterations"}
]

(* --- 7. 2D, 3D & Interactive Scientific Visualization --- *)
Plot[{BesselJ[0, x], BesselJ[2, x], BesselJ[5, x]}, {x, 0, 10},
    PlotLabel -> "Bessel Functions of the First Kind",
    AxesLabel -> {"x", "J_n(x)"},
    Frame -> True, GridLines -> Automatic,
    PlotStyle -> {Red, Green, Blue}
]

ParametricPlot3D[{Cos[u]/u, Sin[u]/u, u/400}, {u, Pi, 20 Pi},
    PlotStyle -> Thick, AxesLabel -> {"x", "y", "z"}
]

Manipulate[
    Plot[{Sin[x], Sin[a x + b]}, {x, 0, 2 Pi},
        PlotStyle -> Thick, AxesLabel -> {"x", "y"}
    ],
    {{a, 1, "Frequency"}, 1, 8},
    {{b, 0, "Phase"}, 0, 2 Pi}
]
