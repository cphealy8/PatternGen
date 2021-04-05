NonstationaryMap;
npts = 100; 
SP011_TuringPattern_Positive
IMap1 = SignalMerge(IMap,1-NSMap,'multiply');

SP002_FunctionPattern_Positive
IMap2 = SignalMerge(IMap,NSMap,'multiply');

IMap = SignalMerge(IMap1,IMap2,'add');

% npts = 500;
ThinRatio = GetThinningRatio(IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(IMap,win,BasePP);