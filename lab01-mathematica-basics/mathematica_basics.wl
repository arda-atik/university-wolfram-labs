(* ::Package:: *)

(* ========================================================================= *)
(* Lab 01: Basics of Working with the Mathematica System                     *)
(* Topics: Syntax, Precision, Symbolic Algebra, Linear Systems, 2D/3D Plots, *)
(*         Lists, and Interactive Manipulate Interfaces                      *)
(* ========================================================================= *)

(* --- 1. Basic Syntax, Exact vs. Numerical Evaluation --- *)
3 + 4/2
Sin[Pi/3]
N[Sin[Pi/3]]
Sin[Pi/3] // N
N[Pi, 1000]
500!

(* Assignment and output suppression *)
x = Pi/3;
Sin[x]
Clear[x]

(* --- 2. Lists and Indexing --- *)
seznam = {Pi/4, Pi/3, Pi/2, Pi};
Sin[seznam]
seznam[[1]]

MatrixForm[{{1, 2, 3}, {4, 5, 6}}]

(* --- 3. Equation Solving and Linear Algebra --- *)
Solve[x^2 - 3 x + 2 == 0, x]
NSolve[x^5 - 3 x - 1 == 0, x]
Reduce[Abs[z] - z == 1 + 2 I, z]
Reduce[x^2 > 3, x]

(* Matrix linear system: mat . xvec == b *)
mat = {{2.0, 3.1, -1.1}, {0.2, -0.29, 3.3}, {-1.5, 4.2, 4.7}};
b = {-1.0, 2.2, 0.5};
xvec = LinearSolve[mat, b]
mat . xvec

(* Symbolic linear system with parameter 'a' *)
sol = Solve[{
    2.0 x + 3.1 y - 1.1 z == a,
    0.2 x - 0.29 y + 3.3 z == 2.2,
    -1.5 x + 4.2 y + 4.7 z == 0.5
}, {x, y, z}]

(* Symbolic algebra and matrix inversion *)
Expand[(a + b)^5]
Simplify[Sin[a]^2 + Cos[a]^2]
Inverse[{{a, b}, {c, d}}] // MatrixForm

(* Numerical root finding: Tan[x] == x *)
FindRoot[Tan[x] == x, {x, 4}]

(* --- 4. User-Defined Functions & Calculus --- *)
f[x_] := Sin[x] + Cos[x]^2
f[a]
f[0.5]
D[f[x], x]
Integrate[f[x], x]

g[x_, y_] := Cos[x^2 + y^2] Exp[(-x^2 - y^2)/3]
Plot3D[g[x, y], {x, -Pi, Pi}, {y, -Pi, Pi}, PlotRange -> All]

(* --- 5. 2D, 3D, Contour & Parametric Visualizations --- *)
Plot[{x^2, Sin[5 x], x^2 + Sin[5 x]}, {x, -Pi, Pi},
    PlotStyle -> {{Thick, Blue}, {Thick, Green}, {Thick, Red}},
    AxesLabel -> {Style["x", Italic, 22], Style["y", Italic, 22]}
]

Plot3D[x^2 + Sin[5 x + y^2], {x, -Pi, Pi}, {y, -Pi, Pi}]
ContourPlot[x^2 + Sin[5 x + y^2], {x, -Pi, Pi}, {y, -Pi, Pi}]
DensityPlot[x^2 + Sin[5 x + y^2], {x, -Pi, Pi}, {y, -Pi, Pi}]

ParametricPlot[{Cos[u]/(u + 1), Sin[u]/(u + 1)}, {u, Pi, 4 Pi}, PlotStyle -> Thick]
ParametricPlot3D[{Cos[u]/u, Sin[u]/u, u/400}, {u, Pi, 20 Pi}, PlotStyle -> Thick]

(* --- 6. List Generation & Sparse Matrices --- *)
Table[i + j, {i, 5}, {j, 5}]
Array[h, {4, 2}, {10, 20}]
Range[10, 20, 2]
NestList[h, a, 4]
SparseArray[{{1, 1} -> a, {3, 2} -> b, {3, 4} -> c}] // MatrixForm

(* --- 7. Interactive Dynamic Manipulators --- *)
Manipulate[
    Plot[{Sin[x], Sin[a x + b]}, {x, 0, 2 Pi}, PlotStyle -> Thick],
    {{a, 1, "Frequency"}, 1, 8},
    {{b, 0, "Phase"}, 0, 2 Pi}
]
