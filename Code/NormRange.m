function [y] = NormRange(x,range)
%NORMRANGE Normalize values in x to the range=[min max];
%   Detailed explanation goes here

minx = min(x(:));
maxx = max(x(:));

xrange = maxx-minx;
rrange = diff(range);

x2 = x*(rrange/xrange);

shift = min(x2(:))-range(1);

y = x2-shift;
end

