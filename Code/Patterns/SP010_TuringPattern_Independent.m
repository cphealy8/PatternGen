% dx =100;
IMap = TuringPatt;
IMap = NormRange(IMap,[0 1]);

pts = PoissonPP(win,npts);


% imagesc(IMap);hold on; plot(100*pts(:,1),100*pts(:,2),'.r')