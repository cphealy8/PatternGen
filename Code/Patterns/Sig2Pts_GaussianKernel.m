% Self Signal Gen
% Use this to convert a point process into a signal consistently between
% tests.

% dx = 100;
sigRadius = 0.3;
sigSD = sigRadius/5;
sigpts = InhibitionPP(win,0.5,sigRadius/1.2);

sigKern = fspecial('gaussian',sigRadius*dx,sigSD*dx);
sigKern = sigKern./max(sigKern(:));
IMap = pts2signal(sigpts,win,dx,sigKern,'Normalize','true');
