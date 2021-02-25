ParentNum = round(npts/20);
ptsperclust = round(npts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.1;
ROpns = [radius*0.9 radius];

pts = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal','OmitParents',true);