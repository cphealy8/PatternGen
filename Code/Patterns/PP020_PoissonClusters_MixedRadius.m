tempnpts = npts/2;
ParentNum = round(tempnpts/5);
ptsperclust = round(tempnpts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.05;
ROpns = [0 radius];

pts1 = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal');

ParentNum = round(tempnpts/5);
ptsperclust = round(tempnpts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.1;
ROpns = [0 radius];

pts2 = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal');

pts = [pts1;pts2];