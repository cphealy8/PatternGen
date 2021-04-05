% Self Signal Gen
% Use this to convert a point process into a signal consistently between
% tests.

% dx = 100;
sigRadius = 0.1;
sigSD = sigRadius/5;
sigpts = InhibitionPP(win,0.5,2.5*sigRadius);

sigKern = double(CircKern(sigRadius*dx));
sigKern = sigKern./max(sigKern(:));
IMap = pts2signal(sigpts,win,dx,sigKern,'Normalize','true');

