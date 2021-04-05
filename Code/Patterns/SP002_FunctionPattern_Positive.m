% dx = 100;
fun = @(x,y) sin(x/6)+cos(y/6);
IMap =Func2Signal(fun,win,dx,'Normalization','on');
IMap = NormRange(IMap,[0 1]);

ThinRatio = GetThinningRatio(IMap);
BasePP = PoissonPP(win,round(npts/ThinRatio));
pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(100*pts(:,1),100*pts(:,2),'.r')