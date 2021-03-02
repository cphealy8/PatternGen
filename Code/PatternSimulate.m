%PATTERNSIMULATE Simulate point patterns and compute relevant statistics.
clc; clear; close all;
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\Patterns';
addpath('Patterns');
%% parameters
msims = 199;
r = linspace(0,0.5,101);
r(1) = [];
quadratBins = 4;

%% Get point Files
ncnt = 0; % counter
TotTime = 0; % Total time

patterntype = 'PAB'; 
ptfnames = getFileNames('Patterns',patterntype);

nPP = length(ptfnames);

totalSims = nPP*msims;
tsim = zeros(1,totalSims);

%% simulations
f = waitbar(0,'Simulating...');
for n = 1:length(ptfnames)
win = [0 1 0 1];
npts = 100;

ptfilename = ptfnames{n};
for m = 1:msims
    ncnt = ncnt+1;
    tic


    

    ptsB = [];
    % Generate Point process
    run(ptfilename);
    
    % Defaults
    numpts(m) = length(pts); % no. of pts
    numptsB = NaN;
    
    % RUN SIMULATIONS
    if strcmp(patterntype,'PP') % Univariate Ripley's K
        [~,~,L] = Kest(pts,win,'t',r);
        LmR(m,:) = L-r;
    elseif strcmp(patterntype,'PAB') % Bivariate Ripley's K
        numptsB(m) = length(ptsB);
        [~,~,L] = Kmulti(pts,ptsB,win,'t',r);
        LmR(m,:) = L-r;
    end
    
    % Compute ChiSquare Homogeneity Test
%     [ChiSqPVal(m),ChiSq(m),ChiSqDF(m)] = ChiSq_HomogeneityTest(pts,win,quadratBins);
    
    
    % Timing and progress bar updates
    tsim(ncnt) = toc;
    TimePerSim = mean(tsim);
    simsRem = totalSims-ncnt;
    TimeRem = TimePerSim*simsRem;
    percComplete = ncnt/totalSims;
    waitbar(percComplete,f,sprintf('Pattern: %d/%d Simulation: %d/%d\nETR:%d min',n,nPP,m,msims,round(TimeRem/60)));
end
%pooled stats
% ChiSqPool = sum(ChiSq);
% ChiSqDFPool = sum(ChiSqDF);
% ChiSqDFPool = (quadratBins*msims-1);
% ChiSqPValPool = 1-chi2cdf(ChiSqPool,ChiSqDFPool);

% Save the data;
savename = fullfile(DataDir,strcat(ptfilename(1:end-2),'.mat'));
save(savename,'r','LmR','msims','quadratBins','pts','ptsB','numpts','numptsB','win')
end
close(f)