function [Area] = winArea(win)
%WINAREA get window area
%   [Area] = winArea(win) gets area of a rectangular window specified by
%   the parameter win = [xmin xmax ymin ymax];
%
%   Author: Connor Healy (connor.healy@utah.edu)
%   Affiliation: University of Utah
Area = (win(2)-win(1))*(win(4)-win(3));
end

