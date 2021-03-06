clc;clear;close all;
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\RK';

patternType = 'PP';
filenames = getFileNames(DataDir,patternType);
nfiles = length(filenames);

% Set ylimits
if strcmp(patternType,'PP')
    yabsmax = 0.2;
elseif strcmp(patternType,'PAB')
    yabsmax = 0.12;
elseif strcmp(patternType,'SP')
    yabsmax = 0.1;
end


for n=1:nfiles
    filename = filenames{n};
    filedir = fullfile(DataDir,filenames{n});
    load(filedir)
    
    % statistics
    meanLmR = mean(LmR);
    sdLmR = std(LmR);
    meanPlus = meanLmR+sdLmR;
    meanMinus = meanLmR-sdLmR;
    
    % plot
    FH = figure('Units','centimeters','Position',[5 5 4.5 4.5]);
    lwd = 2;
    plot(r,meanLmR,'-r','LineWidth',lwd)
    hold on 
    plot(r,meanPlus,'-r','LineWidth',lwd*.5)
    plot(r,meanMinus,'-r','LineWidth',lwd*.5);
    ylim([-1 1]*yabsmax)
    xlim([0 r(end)])
    axis square
    xlabel('Scale (r, a.u.)')
    ylabel('L(r)-r')
    title(filename(1:end-4),'Interpreter','none')
    
    absmax(n)= max(abs([meanPlus meanMinus]));
    
    % print
    ResultName = fullfile(ResultDir,filename(1:end-4));
    saveas(FH,ResultName,'pdf')
    close(FH)
end


%% Multi-plot Overlay
clc;clear;close all;
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\RK';
FSize = 11;



% FOR UNIVARIATE PLOTS
patternType = 'PP';
% fileIDs = 1:3; % Poisson Processes
% fileIDs = [2 4:8]; % PoissonClusters
fileIDs = [2 8 9 10]; % Poisson Clusters Other
% fileIDs = [2 11:15]; % Matern Regularity
% fileIDs = [2 16:19]; % Mixed
% fileIDs = [2 11 21:24]; % Matern Regularity with Noise
% fileIDs = [25 25]; % Nonstationary

% FOR BIVARIATE PLOTS
% patternType = 'PAB';
% fileIDs = [1:2]; % Independent
% fileIDs = [3:6]; % Positive Association
% fileIDs = [1 3 5]; % Positive Association 5050
% fileIDs = [2 4 6]; % Positive Association 2080
% fileIDs = [1 3 5 7 9]; % % 5050
% fileIDs = [2 4 6 8 10]; % 2080
% fileIDs = [7:10]; % Negative Association
% fileIDs = [1 7 9]; % Negative Association 5050
% fileIDs = [2 8 10]; % Negative Association 2080
% fileIDs = [2 11]; % Nonstationary

% FOR Signal Pattern Plost
% patternType = 'SP';
% fileIDs = 1:3; % Function
% fileIDs = [4 5 6 16 17]; % Gaussian Kernel
% fileIDs = [7 8 9]; % Uniform Kernel
% fileIDs = [10 11 12 18 19]; % Turing
% fileIDs = [13 14 15]; % Image
% fileIDs = [1 20 21];


filenames = getFileNames(DataDir,patternType);


colors = {'#000000','#d7191c','#2b83ba','#fdae61','#abdda4','#ffff91'};
% colors = {'#d7191c','#2b83ba','#fdae61','#abdda4','#ffff91'};

FH2 = figure('Units','centimeters','Position',[5 5 8 8]);

% Plot CSR intervals (this is always based upon the first index listed
% under fileIDs)
    filename = filenames{fileIDs(1)};
    filedir = fullfile(DataDir,filename);
    load(filedir)
    
    if contains(filename,'Nonstationary')
        LmR = LmRRand;
    end
    
    meanCSR = mean(LmR);
    sdCSR = std(LmR);
    maxCSR = max(LmR);
    minCSR = min(LmR);
    meanPlusCSR = meanCSR+sdCSR;
    meanMinusCSR = meanCSR-sdCSR;
    r2 = [r, fliplr(r)];
    inBetween = [minCSR, fliplr(maxCSR)];
    fill(r2, inBetween, 'k','LineStyle','none','FaceAlpha',0.2);
    yline(0,'-k')
    
    hold on

    

for n=2:length(fileIDs)
    filename = filenames{fileIDs(n)};
    filedir = fullfile(DataDir,filename);
    load(filedir)
    
    % statistics
    meanLmR = mean(LmR);
    sdLmR = std(LmR);
    meanPlus = meanLmR+sdLmR;
    meanMinus = meanLmR-sdLmR;
    
    % plot
    
    lwd = 1.5;
    lcolor = hex2rgb(colors{n});
    
    plot(r,meanLmR,'Color',lcolor,'LineWidth',lwd)
    hold on 
%     plot(r,meanPlus,'Color',lcolor,'LineWidth',lwd*.5)
%     plot(r,meanMinus,'Color',lcolor,'LineWidth',lwd*.5);
    
    xlabel('Scale (r, a.u.)','FontSize',FSize)
    ylabel('L(r)-r','FontSize',FSize)
    xlim([0 r(end)])
    axis square
%     title(filename(1:end-4),'Interpreter','none')
    

        absmax(n)= max(abs([meanLmR minCSR maxCSR]));

    % print
%     ResultName = fullfile(ResultDir,filename(1:end-4));

end
set(gca,'FontSize',FSize-1);
ylim([-1 1]*max(absmax)*1.05);
% legend(filenames(fileIDs)')
[file,path] = uiputfile(fullfile(ResultDir,'*.pdf'));
saveas(FH2,fullfile(path,file(1:end-4)),'pdf')
close all