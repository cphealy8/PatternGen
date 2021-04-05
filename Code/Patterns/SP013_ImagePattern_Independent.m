% dx =100;
IMap = im;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
pts = PoissonPP(win,round(npts));
% pts = ThinByIntensity(1-IMap,win,BasePP);

% imagesc(IMap);hold on; plot(mindim*BasePP(:,1),mindim*BasePP(:,2),'.r');
% plot(mindim*pts(:,1),mindim*pts(:,2),'.b')
