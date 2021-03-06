% dx =100;
Sig2Pts_UniformKernel;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(dx*pts(:,1),dx*pts(:,2),'.r');