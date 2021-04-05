% dx =100;
Sig2Pts_GaussianKernel;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(1-IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(1-IMap,win,BasePP);

% imagesc(IMap);hold on; plot(dx*pts(:,1),dx*pts(:,2),'.r')