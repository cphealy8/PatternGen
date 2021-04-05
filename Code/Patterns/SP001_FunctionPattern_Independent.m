% dx = 100;
fun = @(x,y) sin(x/6)+cos(y/6);
IMap =Func2Signal(fun,win,dx,'Normalization','on');

ThinRatio = GetThinningRatio(IMap);
pts = PoissonPP(win,round(npts));
% pts = ThinByIntensity(IMap,win,BasePP);

% imagesc(IMap);hold on; plot(100*pts(:,1),100*pts(:,2),'.r')