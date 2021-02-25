function [pts] = fixOrientation(pts)
%FIXORIENTATION forces an input pts vector to be in a 2-column format
[nrows,ncols] = size(pts);

if ncols~=2 && nrows~=2
    error('pts must be a 2-column matrix of point coordinates')
end

if ncols>nrows && nrows==2
    pts = pts';
end

end