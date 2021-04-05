tt% A Points
nptsA = round(npts*0.5);
InhDist = 0.08;
PkgDens = 0.3;
pts = InhibitionPP(win,PkgDens,InhDist,'MaxPts',nptsA);


% B Points
nptsB = npts-nptsA;
ptsBperclust = round(nptsB/nptsA);
[~,~,ptsB] = PoissonClusts(win,pts,ptsBperclust,[0 0.05]);