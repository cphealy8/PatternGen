% A Points
nptsA = round(npts*0.5);
InhDist = 0.08;
PkgDens = 0.3;
pts = InhibitionPP(win,PkgDens,InhDist,'MaxPts',nptsA);

imRes = 100;
clustRad = 0.1;
% sigKern = fspecial('gaussian',clustRad*imRes,0.05*imRes);
sigKern = CircKern(clustRad*imRes);
sig = pts2signal(pts,win,imRes,sigKern);
sig(sig>0)= 1;

nptsB = npts-nptsA;
ThinRatio = GetThinningRatio(1-sig);
ptsBase =PoissonPP(win,ceil(nptsB/ThinRatio));
ptsB = ThinByIntensity(1-sig,win,ptsBase);

