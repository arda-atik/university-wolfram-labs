(* ::Package:: *)

(* ========================================================================= *)
(* Lab 06: 2D/3D Visualizations, Parametric Surfaces & Animations         *)
(* Course: 12YPAS - Computational and Programming Systems (CTU FNSPE)        *)
(* Syllabus Ref: Topic 8                                                     *)
(* ========================================================================= *)

ClearAll["Global`*"]

(* --- 1. 2D Function Plots & Bessel Functions --- *)
Plot[Sin[1/x], {x, -1.0, 1.0},
    PlotPoints -> 200,
    AxesLabel -> {"x", "Sin[1/x]"}
]

Plot[{BesselJ[0, x], BesselJ[2, x], BesselJ[5, x]}, {x, 0, 10},
    PlotLabel -> "Bessel Functions J_n(x)",
    AxesLabel -> {"x", "J_n(x)"},
    Frame -> True, GridLines -> Automatic,
    PlotStyle -> {Red, Green, Blue}
]

(* --- 2. 3D Surfaces, Contour Plots & Density Plots --- *)
Plot3D[Sin[Sin[x] + y], {x, -3, 3}, {y, -3, 3},
    PlotPoints -> 40, Mesh -> False,
    AxesLabel -> {"x", "y", "z"}
]

ContourPlot[Exp[-Sqrt[x^2 + y^2]] Cos[ArcTan[x, y]], {x, -1, 1}, {y, -1, 1},
    PlotPoints -> 40, ColorFunction -> Hue
]

DensityPlot[Sin[x + Cos[y]], {x, 0, 3 Pi/2}, {y, 0, 3 Pi/2},
    ColorFunction -> Hue, PlotPoints -> 50, Mesh -> False
]

(* --- 3. Parametric 3D Surfaces (Mobius Strip & Twisted Toroid) --- *)
ParametricPlot3D[
    {Sin[t], Sin[2 t] Sin[u], Sin[2 t] Cos[u]},
    {t, -Pi/2, Pi/2}, {u, 0, 2 Pi},
    PlotPoints -> 40
]

aMobius = 1.0; bMobius = 0.5;
rMobius[t_, v_] := aMobius + bMobius v Cos[t/2]
ParametricPlot3D[
    {rMobius[t, v] Cos[t], rMobius[t, v] Sin[t], bMobius v Sin[t/2]},
    {t, 0, 2 Pi}, {v, -1, 1},
    PlotPoints -> 50, Boxed -> False, Axes -> False
]

f3 = (2 + Cos[u/2] Sin[t] - Sin[u/2] Sin[3 t]) Cos[u];
g3 = (2 + Cos[u/2] Sin[t] - Sin[u/2] Sin[3 t]) Sin[u];
h3 = Sin[u/2] Sin[t] + Cos[u/2] Sin[3 t];
ParametricPlot3D[{f3, g3, h3}, {t, 0, 2 Pi}, {u, 0, 2 Pi},
    PlotPoints -> 40, Boxed -> False, Axes -> False,
    ViewPoint -> {0.859, -2.018, 2.577}
]

(* --- 4. Circular Acoustic Planar Membrane (Animation via Manipulate) --- *)
zCutoff = 5.13562^2;
Manipulate[
    Plot3D[
        -BesselJ[2, Sqrt[x^2 + y^2]] x Cos[t] (1 + Sign[zCutoff - x^2 - y^2])/(x^2 + y^2)
        - 0.1 (1 - Sign[zCutoff - x^2 - y^2]),
        {x, -6.5, 6.5}, {y, -6.5, 6.5},
        PlotRange -> {-0.46, 0.46}, PlotPoints -> 35,
        Boxed -> False, Axes -> False
    ],
    {{t, 0, "Time t"}, 0, 2 Pi}
]

(* --- 5. Compiled 3D Mandelbrot Escape-Time Surface --- *)
compilIterCount = Compile[{{x, _Real}, {y, _Real}, {lim, _Integer}},
    Module[{c = x + I y, z = 0.0 + 0.0 I, n = 0},
        While[Abs[z] < 2.0 && n < lim,
            z = z^2 + c;
            n++
        ];
        n
    ]
];

Plot3D[compilIterCount[x, y, 50], {x, -0.4, 0.4}, {y, -1.2, -0.4},
    PlotPoints -> 80, PlotRange -> {0, 50},
    Mesh -> False, Ticks -> None,
    ViewPoint -> {1.3, -2.4, 2.0}
]
