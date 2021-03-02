% A Points
nptsA = round(npts*0.2);
InhDist = 0.14;
PkgDens = 0.3;
pts = InhibitionPP(win,PkgDens,InhDist,'MaxPts',nptsA);

% B Points
nptsB = npts-nptsA;
ptsBperclust = round(nptsB/nptsA);
[~,~,ptsB] = PoissonClusts(win,pts,ptsBperclust,[0 0.05]);