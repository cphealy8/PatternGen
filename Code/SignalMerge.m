function [Merge] = SignalMerge(Signal1,Signal2,operation)
%SIGNALMERGE combine two signal maps then renormalize.
%   Detailed explanation goes here
if strcmp(operation,'add')
    Merge = Signal1+Signal2;
elseif strcmp(operation,'multiply')
    Merge = Signal1.*Signal2;
end
Merge = NormRange(Merge,[0 1]);
end

