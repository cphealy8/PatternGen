ParentNum = round(npts/5);
ptsperclust = round(npts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.1;
ROpns = [0 radius];

pts = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal');