function [qPP,quadrat,npts,quadratArea] = Window2Quadrats(PP,window,quadratBins)
%WINDOW2QUADRATS Break a window up into quadrats.
%   Detailed explanation goes here

%%
PP = fixOrientation(PP); % Force 2-column format

windowwidth = window(2)-window(1);
windowheight = window(4)-window(3);

if numel(quadratBins)==1
    nquadX = quadratBins;
    nquadY = quadratBins;
elseif numel(quadratBins)==2
    nquadX = quadratBins(1);
    nquadY = quadratBins(2);
else
    error('quadratBins has too many dimensions')
end
widthdx = windowwidth/nquadX;
widthdy = windowheight/nquadY;

quadratArea = widthdx*widthdy;

%%
Counter = 0;
qPP = cell(1,nquadX*nquadY);
for n=1:nquadX
    for m=1:nquadY
        Counter = Counter+1;
        
        xstart = (n-1)*widthdx;
        xend = n*widthdx;
        ystart = (m-1)*widthdy;
        yend = m*widthdy;
        
        quadrat{Counter} = [xstart xend ystart yend];
        qPP{Counter} = CropPts2Win(PP,quadrat{Counter});
        
        npts(Counter) = max(size(qPP{Counter}));
    end
end

end

