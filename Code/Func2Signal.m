function [Signal] = Func2Signal(fun,win,dx,varargin)
%FUNC2SIGNAL convert a 2D function f(x,y) to a signal map. 
%   Func2Signal(fun,win,dx) converts the 2D function (specified as an
%   anonymous function e.g. fun = @(x,y) x+y; into a surface map spanning
%   the region win =[xmin xmax ymin ymax] with resolution dx (e.g. dx=100).
%   
%   Author: Connor Healy (connor.healy@utah.edu)
%   Affiliation: University of Utah, Dept. of Biomedical Engineeering
%%
p = inputParser;
addRequired(p,'fun')
addRequired(p,'win')
addRequired(p,'dx')
addParameter(p,'Normalization','off',@ischar)

parse(p,fun,win,dx,varargin{:})

Normalization = p.Results.Normalization;

%%
width = win(2)-win(1);
height = win(4)-win(3);

nx = round(width*dx);
ny = round(height*dx);

x = 1:nx;
y = 1:ny;

[xx,yy] = meshgrid(x,y);
Signal=reshape(fun(xx,yy),[ny nx]);

if strcmp(Normalization,'on')
    minS = min(Signal(:));
    maxS = max(Signal(:));
    
    Signal = (Signal-minS)./(maxS-minS);
end

end

