(* ::Package:: *)

(* ========================================================================= *)
(* Lab 03: Equations, Systems of Equations, Matrices & Root-Finding          *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topic 5                                                     *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Analytical & Numerical Polynomial Equations --- *)
Solve[x^4 - 5 x^2 - 3 == 0, x]
Solve[x^8 == 1, x]

(* Quintic equation: exact vs. numerical roots *)
Solve[2 - 4 x + x^5 == 0, x]
NSolve[x^5 - 3 x - 1 == 0, x]

(* --- 2. Parametric Equations, Inequalities & Complex Domain --- *)
Reduce[a x^2 + b x + c == 0, x]
Reduce[{x == 1, x == a}, x]
Reduce[x^2 > 3, x]
Reduce[Abs[z] - z == 1 + 2 I, z]

(* --- 3. Transcendental Root-Finding (FindRoot & Newton-Raphson) --- *)
FindRoot[Tan[x] == x, {x, 4}]

(* Custom 100-digit precision Newton-Raphson via FixedPoint *)
NewtonRoot[fn_, x0_] := FixedPoint[(# - fn[#]/fn'[#]) &, x0]
rootCos = NewtonRoot[Cos, N[1, 100]]
rootCos - N[Pi/2, 100]

(* --- 4. Matrix Operations & Linear Systems --- *)
A = {{2.0, 3.1, -1.1}, {0.2, -0.29, 3.3}, {-1.5, 4.2, 4.7}};
rhs = {-1.0, 2.2, 0.5};

xVec = LinearSolve[A, rhs]
A . xVec (* Verification *)

(* Parametric linear system *)
Solve[{
    2.0 x + 3.1 y - 1.1 z == a,
    0.2 x - 0.29 y + 3.3 z == 2.2,
    -1.5 x + 4.2 y + 4.7 z == 0.5
}, {x, y, z}]

(* Symbolic 2x2 matrix inversion *)
Inverse[{{a, b}, {c, d}}] // MatrixForm

(* --- 5. Structured & Sparse Matrices --- *)
Table[i + j, {i, 5}, {j, 5}] // MatrixForm
sparseMat = SparseArray[{{1, 1} -> a, {3, 2} -> b, {3, 4} -> c}];
MatrixForm[sparseMat]
