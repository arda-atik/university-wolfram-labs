(* ::Package:: *)

(* ========================================================================= *)
(* Lab 02: Algebraic Manipulation, Simplification & Transformation Rules     *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topic 4                                                     *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Polynomial Expansion & Simplification --- *)
expandedPoly = Expand[(a + b)^5]
Simplify[expandedPoly]

(* Trigonometric & algebraic identities *)
Simplify[Sin[a]^2 + Cos[a]^2]
FullSimplify[(1 - Cos[2 x])/Sin[2 x]]

(* --- 2. Integer & Polynomial Factorization --- *)
FactorInteger[20! - 7!]
Factor[x^40 - 1]

(* Factorization over Gaussian integers *)
Factor[x^2 + y^2]
Factor[x^2 + y^2, GaussianIntegers -> True]

(* --- 3. Local Substitution Rules (/.) --- *)
1 + x + x^2 /. x -> 2 - y
x + 5 y /. {x -> 2, y -> 3}

(* Evaluating expressions at equation roots *)
theRoots = Solve[x^2 + 15 x + 42 == 0, x]
x + 5 /. theRoots[[1]]

(* --- 4. Repeated Rule Application (//.) --- *)
(* Single-pass vs. exhaustive logarithmic expansion rule *)
log[a b c d] /. log[x_ y_] -> log[x] + log[y]
log[a b c d] //. log[x_ y_] -> log[x] + log[y]
