% dx =100;
% npts = 100;

Sig2Pts_GaussianKernel;
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
% BasePP = PoissonPP(win,round(npts/ThinRatio));
PP012_MetnerInhibition_IDHalf;

pts = ThinByIntensity(IMap,win,pts);

% imagesc(IMap);hold on; plot(dx*pts(:,1),dx*pts(:,2),'.r')