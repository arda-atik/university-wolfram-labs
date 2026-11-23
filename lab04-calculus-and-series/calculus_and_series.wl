(* ::Package:: *)

(* ========================================================================= *)
(* Lab 04: Symbolic Differentiation, Integration, Series & Limits            *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topic 6                                                     *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Derivatives & Symbolic Integration --- *)
exprVec = {x^2, x Sin[x], x^3 Log[x]};
D[exprVec, x]

intRational = Integrate[1/(1 - x^8), x]
Simplify[D[intRational, x]]

Integrate[(Log[x] - 1)/(Log[x]^2 - x^2), x]
Integrate[x/(a + Exp[x]), x]

(* --- 2. Improper Integrals & High-Precision Numerical Evaluation --- *)
Integrate[Exp[-x^2/(2 sigma^2)], {x, -Infinity, Infinity}, Assumptions -> sigma > 0]

impInt = Integrate[x^(2/3) Log[3/x^(1/2)]^3 Exp[-2 x^(1/3)], {x, 0, Infinity}]
N[impInt, 50]

N[Integrate[Sin[Sin[x]], {x, 0, Pi}], 30]

(* --- 3. Power Series & Taylor Approximations --- *)
seriesExpTrig = Series[Exp[-a t] (1 + Sin[2 t]), {t, 0, 4}]
Normal[seriesExpTrig]

polySinc = Normal[Series[Sin[x]/x, {x, 0, 8}]]
Plot[{Sin[x]/x, polySinc}, {x, -4 Pi, 4 Pi},
    PlotRange -> {-0.5, 1.2},
    PlotLegends -> {"Sin[x]/x", "Taylor Order 8"},
    PlotStyle -> {Thick, Dashed},
    GridLines -> Automatic
]

(* --- 4. Limits with Assumptions --- *)
Limit[Exp[-a b x], x -> Infinity, Assumptions -> a > 0 && b > 0]
