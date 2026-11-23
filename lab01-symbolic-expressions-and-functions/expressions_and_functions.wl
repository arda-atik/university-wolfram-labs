(* ::Package:: *)

(* ========================================================================= *)
(* Lab 01: Symbolic Expressions, Precision & User-Defined Functions          *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topics 1 - 3                                                *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Exact Arithmetic vs. Arbitrary-Precision Numerical Evaluation --- *)
exactSum = 3^100 + 45/78
N[Pi, 200]
BesselJ[5, 34.6]
Zeta[1/2 + 14 I]

(* --- 2. Lists, Vectorized Evaluation & Indexing --- *)
angles = {Pi/4, Pi/3, Pi/2, Pi};
Sin[angles]
angles[[2]]

exprList = {x^2, x Sin[x], x^3 Log[x]};
exprList[[3]]

(* --- 3. Immediate (=) vs. Delayed (:=) Assignment --- *)
b = 3;
fImmediate[x_] = x + b;
fDelayed[x_] := x + b;

b = 5;
{fImmediate[4], fDelayed[4]} (* Evaluates to {7, 9} *)

(* Comparing immediate vs. delayed random generation *)
randOnce = RandomReal[];
randEach := RandomReal[];
Table[randOnce, {5}]
Table[randEach, {5}]

Clear[b, fImmediate, fDelayed, randOnce, randEach]

(* --- 4. User-Defined Functions (Single & Multi-Variable) --- *)
f[x_] := Sin[x] + Cos[x]^2
f[a]
f[0.5]

g[x_, y_] := Cos[x^2 + y^2] Exp[(-x^2 - y^2)/3]
g[0.1, 0.4]

(* Pattern-restricted function definitions *)
factorialRule[1] = 1;
factorialRule[n_Integer?Positive] := n factorialRule[n - 1]
factorialRule[10]
