NonstationaryMap

PAB004_PosAssoc_2080
ptsA1 = ThinByIntensity(1-NSMap,win,pts);
ptsB1 = ThinByIntensity(1-NSMap,win,ptsB);

PAB010_NegAssoc_2080_DiamHalf
ptsA2 = ThinByIntensity(NSMap,win,pts);
ptsB2 = ThinByIntensity(NSMap,win,ptsB);

pts = [ptsA1;ptsA2];
ptsB = [ptsB1;ptsB2];

