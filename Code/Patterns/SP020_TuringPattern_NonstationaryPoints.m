NonstationaryMap;
% npts = 500;

SP011_TuringPattern_Positive
pts1 = ThinByIntensity(1-NSMap,win,pts);

SP012_TuringPattern_Negative
pts2 = ThinByIntensity(NSMap,win,pts);

IMap = NormRange(IMap,[0 1]);

pts = [pts1; pts2];