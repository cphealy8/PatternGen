% dx =100;
IMap = TuringPatt;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(1-IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(1-IMap,win,BasePP);

% imagesc(IMap);hold on; plot(100*pts(:,1),100*pts(:,2),'.r')