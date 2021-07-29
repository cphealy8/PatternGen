tPPName = 'Aggregated - Small Clusters - Homogenous'; % metadata

ParentNum = round(npts/10);
ptsperclust = round(npts/ParentNum);
ChildNumMean = ptsperclust-1;
ChildNumSD = ptsperclust/10;

ChildNumOpns = [ChildNumMean ChildNumSD];

radius = 0.05;
ROpns = [0 radius];

pts = PoissonClusts(win,ParentNum,ChildNumOpns,ROpns,'ChildNumProbs','normal');

plot(pts(:,1),pts(:,2),'o','MarkerSize',8,'LineWidth',2,...
    'MarkerEdgeColor',[165 30 42]/255,...
    'MarkerFaceColor',[213 63 80]/255);
axis equal
axis square
axis tight
ax = gca;
ax.XTick = [];
ax.YTick = [];