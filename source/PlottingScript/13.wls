Print["Start"]
Clear["Global`*"]

\[Mu]k = 1;
W = 4;
L = 0.5;
x0 = 0;
xp0 = 1;
lst = Table[
	With[{sol = NDSolve[{x''[t] + \[Mu]k W/L x[t] == 0, x[0] == x0, x'[0] == xp0}, x, {t, 0, tf}][[1]]},
		Graphics[
			{
				Blue
					, Disk[{-L, 0}, .25]
					, Disk[{L, 0}, .25]
				, Thickness[.0025], LightBlue
					, Table[Line[{{-L, 0}, {.25 Cos[\[Theta] - tf] - L, .25 Sin[\[Theta] - tf]}}], {\[Theta], 0, 2 \[Pi], \[Pi]/3}]
					, Table[Line[{{L, 0}, {.25 Cos[\[Theta] + tf] + L, .25 Sin[\[Theta] + tf]}}], {\[Theta], 0, 2 \[Pi], \[Pi]/3}]
				, Thickness[.005], Brown
					, Line[{{-L - .5 + x[tf] /. sol, .25}, {L + .5 + x[tf] /. sol, .25}}]
				, Darker@Green
					, Arrow[{{-L, .25}, {-L + .1 \[Mu]k (L - x[tf] /. sol) W/(2 L), .25}}]
					, Arrow[{{L, .25}, {L - .1 \[Mu]k (L + x[tf] /. sol) W/(2 L), .25}}]
				, Orange
					, Arrow[{{-L, .25}, {-L, .25 + .1 (L - x[tf] /. sol) W/(2 L)}}]
					, Arrow[{{L, .25}, {L, .25 + .1 (L + x[tf] /. sol) W/(2 L)}}]
			}
			, PlotRange -> {{-2.1, 2.1}, {-.5, 1.5}}
			, ImageSize -> 400
			, Axes -> {False, True}
			, Ticks -> False
			, AxesStyle -> Dashed
		]
	]
, {tf, 0, Sqrt[\[Mu]k W/L]/2 \[Pi], 0.05}];
Export[DirectoryName[$InputFileName] <> "13.gif", lst]

Print["End"]