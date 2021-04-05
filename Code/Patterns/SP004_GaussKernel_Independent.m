% dx =100;
Sig2Pts_GaussianKernel;
IMap = NormRange(IMap,[0 1]);

% ThinRatio = GetThinningRatio(IMap);
pts = PoissonPP(win,round(npts));
% pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(dx*pts(:,1),dx*pts(:,2),'.r')