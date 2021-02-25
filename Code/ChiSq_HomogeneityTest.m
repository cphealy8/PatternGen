function [pValue,ChiSquared,df] = ChiSq_HomogeneityTest(PP,Window,quadratBins)
%CHISQ_HOMOGENEITYTEST Determine if a point process is homogenous
%   Detailed explanation goes here

%%
% Divide window into quadrats and get observed number of points in each
% quadrat
[~,~,nobserved] = Window2Quadrats(PP,Window,quadratBins);

% Compute expected.
Npts = length(PP);
nQuadrats = length(nobserved); 
nexpected = Npts/nQuadrats;

% Compute Chi-squared statistic;
nChiSquared = ((nobserved-nexpected).^2)/nexpected; % Chi-squared of each observation
ChiSquared = sum(nChiSquared); % Chi Squared statistic

% Compute Degrees of freedom
df = nQuadrats-1;

% Compute p-value of the Chi-Squared statistic
pValue = 1-chi2cdf(ChiSquared,df);
end