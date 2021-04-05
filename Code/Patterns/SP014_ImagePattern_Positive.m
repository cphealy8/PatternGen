% dx =100;
IMap = im;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(mindim*BasePP(:,1),mindim*BasePP(:,2),'.r');
% plot(mindim*pts(:,1),mindim*pts(:,2),'.b')
