% Bivariate PP
PPName = 'Pos. Assoc.- 10 to 90 - Nonhomogenous Parallel'; % metadata

% A Points
nptsA = round(npts*0.1);
InhDist = 0.17;
PkgDens = 0.45;
ptsA = InhibitionPP(win,PkgDens,InhDist);

% B Points
nptsB = npts-nptsA;
ptsBperclust = round(nptsB/nptsA);
[~,~,ptsB] = PoissonClusts(win,ptsA,ptsBperclust,[0 0.08]);