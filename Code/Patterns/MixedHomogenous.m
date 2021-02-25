PPName = 'Mixed - Homogenous'; % metadata

PkgDens = 0.5;
InhDist = 0.3;


ClustCenters = InhibitionPP(win,PkgDens,InhDist);
numClusts = length(ClustCenters);

ptsperclust = round(npts/NumClusts);
childmean = ptsperclust-1;
childsd = ptsperclust/10;

clusterRadius = 0.1;
pts = PoissonClusts(win,ClustCenters,[childmean childsd],[0 clusterRadius],'ChildNumProbs','normal');