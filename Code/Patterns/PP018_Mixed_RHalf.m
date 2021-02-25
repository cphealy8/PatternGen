PkgDens = 0.5;
InhDist = 0.3;

ClustCenters = InhibitionPP(win,PkgDens,InhDist);
numClusts = length(ClustCenters);

ptsperclust = round(npts/numClusts);
childmean = ptsperclust-1;
childsd = ptsperclust/10;

clusterRadius = 0.05;
pts = PoissonClusts(win,ClustCenters,[childmean childsd],[0 clusterRadius],'ChildNumProbs','normal');