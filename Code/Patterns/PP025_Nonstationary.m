NonstationaryMap
npts = 108;

%% Clustered


ParentNum = round(npts/5);
ptsperclust = round(npts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.1;
ROpns = [0 radius];

pts = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal');

pts1 = ThinByIntensity(1-NSMap,win,pts);


%%
InhDist = radius/2;
PkgDens = npts*pi*(InhDist^2)/(4*winArea(win));

pts = InhibitionPP(win,PkgDens,InhDist);
pts2 = ThinByIntensity(NSMap,win,pts);

pts = [pts1;pts2];

% ThinRatio = GetThinningRatio(IMap);
% BasePP = PoissonPP(win,round(npts/ThinRatio));
% pts = ThinByIntensity(IMap,win,BasePP);
% cnt = cnt+1;
% nump(cnt) = length(pts);