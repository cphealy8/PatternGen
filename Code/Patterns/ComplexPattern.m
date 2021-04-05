%% Initial Conditions Comparison %%%%%%%%%%
dx = 100;
win = [0 1 0 1];
npts = 100;

%%
InhDist = 0.05;
PkgDens = 0.5;

pts = InhibitionPP(win,PkgDens,InhDist);
S0 = pts2signal(pts,win,dx,CircKern(2));
%%

IMap = TuringPattern('dims',dx*[win(2)-win(1) win(4)-win(3)],'Bo',S0);
figure
subplot(1,2,1)
imagesc(S0)
axis tight
axis equal
subplot(1,2,2)
imagesc(IMap)
axis tight
axis equal
%% Complex Map
dx = 100;
BasePts = InhibitionPP(win,0.5,0.2);
SpiralKern = NormRange(double(imread('../../Data/SpiralKernel.png')),[0 1]);
GaussKern = NormRange(double(fspecial('gaussian',30,10)),[0 1]);
ComboKern = SpiralKern.*GaussKern;

KernMap = pts2signal(BasePts,win,dx,ComboKern);

DenseReg = InhibitionPP(win,0.5,0.08);
CircKernMap = pts2signal(BasePts,win,dx,CircKern(13))>0;
ClustCenters = ThinByIntensity(CircKernMap,win,DenseReg);
ClustPts = PoissonClusts(win,ClustCenters,20,[0 0.04]);
RegPts = InhibitionPP(win,0.5,0.02);
RemPts = ThinByIntensity(1-CircKernMap,win,RegPts);


fun = @(x,y) x-y;
Gradient =Func2Signal(fun,win,dx,'Normalization','on');
ComboSig = KernMap+Gradient.*(1-CircKernMap);
RemPts = ThinByIntensity(Gradient,win,RemPts);
%Combine
figure
imagesc(ComboSig)
hold on
plot(ClustPts(:,1)*dx,ClustPts(:,2)*dx,'.r','MarkerSize',10)
plot(RemPts(:,1)*dx,RemPts(:,2)*dx,'.r','MarkerSize',10);
axis equal
axis tight