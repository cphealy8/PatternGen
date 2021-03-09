PkgDens = 0.5;
InhDist = 0.15;

ClustCenters = InhibitionPP(win,PkgDens,InhDist);
numClusts = length(ClustCenters);

ptsperclust = round(npts/numClusts);
childmean = ptsperclust;
childsd = ptsperclust/10;

clusterRadius = 0.1;
pts = PoissonClusts(win,ClustCenters,[childmean childsd],[0 clusterRadius],'ChildNumProbs','normal');