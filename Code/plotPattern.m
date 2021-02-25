function [plotAxes] = plotPattern(pts,varargin)
%PLOTPATTERN Plot spatial patterns
%   Detailed explanation goes here

%% Parse inputs
p = inputParser;

addRequired(p,'pts',@isnumeric)
addOptional(p,'ptsB',[],@isnumeric)
addOptional(p,'signal',[],@isnumeric)
addOptional(p,'windowsize',[],@isnumeric)
addOptional(p,'MarkerSize',5, @isnumeric)
addOptional(p,'FontSize',10,@isnumeric)

parse(p,pts,varargin{:});

ptsB = p.Results.ptsB;
signal = p.Results.signal;
windowsize = p.Results.windowsize;
MarkerSize = p.Results.MarkerSize;
FontSize = p.Results.FontSize;

%% Check inputs
pts=fixOrientation(pts);

xcoords = pts(:,1);
ycoords = pts(:,2);

minX = min(xcoords);
maxX = max(xcoords);
minY = min(ycoords);
maxY = max(ycoords);

if ~isempty(ptsB)
    ptsB=fixOrientation(ptsB);

    xcoordsB = ptsB(:,1);
    ycoordsB = ptsB(:,2);
    
    minXB = min(xcoordsB);
    maxXB = max(xcoordsB);
    minYB = min(ycoordsB);
    maxYB = max(ycoordsB);
end



if isempty(windowsize)
%     if ~isempty(signal)&&~isempty(ptsB)
%         windowsize = [min([0 minX minXB])...
%                       max([maxX maxXB length(signal)])...
%                       min([0 minY minYB])...
%                       max([maxY maxYB width(signal)])];
    windowsize = [minX maxX minY maxY];              
    if ~isempty(signal)
        windowsize = [0 length(signal) 0 width(signal)];
    end
    
    if ~isempty(ptsB)
        windowsize = [min([minX minXB]) max([maxX maxXB])...
                      min([minY minYB]) max([maxY maxYB])];
    end
end


%% Plot
if ~isempty(ptsB)
    plot(xcoords,ycoords,'or','MarkerFaceColor','r','MarkerSize',MarkerSize);
    hold on
    plot(xcoordsB,ycoordsB,'db','MarkerFaceColor','b','MarkerSize',MarkerSize);
elseif ~isempty(signal)
    imagesc(signal)
    hold on
    plot(xcoords,ycoords,'or','MarkerFaceColor','r','MarkerSize',MarkerSize);
else
    plot(xcoords,ycoords,'or','MarkerFaceColor','r','MarkerSize',MarkerSize);
end
axis equal
axis(windowsize)
plotAxes = gca;
set(plotAxes,'FontSize',FontSize)

end

function [pts] = fixOrientation(pts)
[nrows,ncols] = size(pts);

if ncols~=2 && nrows~=2
    error('pts must be a 2-column matrix of point coordinates')
end

if ncols>nrows && nrows==2
    pts = pts';
end

end

