(* ::Package:: *)

(* ========================================================================= *)
(* Lab 07: Blackbody Radiation & Planck's Law                                *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Topics: Spectral Radiance, Asymptotic Limits, Wien's Displacement Law,    *)
(*         Physical Constants (Quantity), and Stefan-Boltzmann Law           *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. Spectral Radiance Definition (Planck's Law) --- *)
(* B(lambda, T) = (2 * Pi * h * c^2 / lambda^5) * 1 / (Exp[h*c / (lambda*k*T)] - 1) *)
IPlanck[lambda_, T_] := (2 * Pi * c^2 * h / lambda^5) * 1 / (Exp[h * c / (lambda * k * T)] - 1)

(* Dimensionless normalized form (c = 1, h = 1, k = 1) *)
IPlanckNorm[lambda_, T_] := IPlanck[lambda, T] /. {c -> 1, h -> 1, k -> 1}

(* Plot spectral distribution for T = 1 and T = 1.2 *)
Plot[{IPlanckNorm[lambda, 1], IPlanckNorm[lambda, 1.2]}, {lambda, 0, 1.7},
    PlotLegends -> {"T = 1.0", "T = 1.2"},
    AxesLabel -> {"\[Lambda]", "I(\[Lambda], T)"},
    PlotLabel -> "Normalized Blackbody Spectral Radiance",
    PlotStyle -> Thick,
    GridLines -> Automatic
]

(* --- 2. Short-Wavelength Asymptotic Behavior --- *)
$Assumptions = h > 0 && c > 0 && k > 0 && T > 0;

(* Verify lim_{lambda -> 0+} I(lambda, T) = 0 *)
Limit[IPlanck[lambda, T], lambda -> 0, Direction -> "FromAbove"]

(* --- 3. Wien's Displacement Law Derivation --- *)
(* Find peak wavelength lambda_max where dI/dlambda = 0 *)
dIPlanck = D[IPlanck[lambda, T], lambda];
lambdaMax = Solve[dIPlanck == 0, lambda]

(* Substitute SI physical constants using built-in Quantity *)
lambdaMaxSI = N[lambdaMax /. {
    c -> Quantity["SpeedOfLight"],
    h -> Quantity["PlanckConstant"],
    k -> Quantity["BoltzmannConstant"]
}]

(* --- 4. Total Radiated Power & Stefan-Boltzmann Law --- *)
(* Integrate spectral radiance over all wavelengths: R = \int_0^\infty I(lambda, T) dlambda *)
Rad = Integrate[IPlanck[lambda, T], {lambda, 0, Infinity}]

(* Evaluate numerical constant with SI units (Stefan-Boltzmann constant * T^4) *)
RadSI = N[Rad /. {
    c -> Quantity["SpeedOfLight"],
    h -> Quantity["PlanckConstant"],
    k -> Quantity["BoltzmannConstant"]
}]

(* Analytical verification against (2 * Pi^5 * k^4 / (15 * c^2 * h^3)) * T^4 *)
StefanBoltzmannExact = N[(2 * Pi^5 * k^4 * T^4) / (15 * c^2 * h^3) /. {
    c -> Quantity["SpeedOfLight"],
    h -> Quantity["PlanckConstant"],
    k -> Quantity["BoltzmannConstant"]
}]

(* Reset global assumptions and symbols *)
Clear[h, c, k, T];
$Assumptions = True;
