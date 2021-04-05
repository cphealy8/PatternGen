% dx =100;
IMap = TuringPatt;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(100*pts(:,1),100*pts(:,2),'.r')