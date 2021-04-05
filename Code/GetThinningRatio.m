function [ThinningRatio] = GetThinningRatio(IMap)
%GETTHINNINGRATIO Estimate fraction of points remaining after thinning.
%   Detailed explanation goes here

Area = numel(IMap);

% check Imap

minIMap = min(IMap);

if minIMap<0
    IMap = IMap-minIMap;
    warning('Negative value detected in IMap. Automatic shifting applied to remove negative numbers');
end

maxIMap = max(IMap);
if maxIMap~=1
    warning('IMap should be a matrix of likelihoods ranging between 0 and 1. Maximum of IMap exceeded 1 so automatic normalization was applied')
    IMap = IMap./maxIMap;
end

INet = sum(IMap(:));
ThinningRatio = INet/Area;
end

