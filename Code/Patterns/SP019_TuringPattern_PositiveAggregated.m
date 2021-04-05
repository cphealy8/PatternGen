% dx =100;
% npts = 500;

IMap = TuringPatt;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
% BasePP = PoissonPP(win,round(npts/ThinRatio));
PP019_Mixed_IDHalfRHalf

pts = ThinByIntensity(IMap,win,pts);

% imagesc(IMap);hold on; plot(dx*pts(:,1),dx*pts(:,2),'.r')