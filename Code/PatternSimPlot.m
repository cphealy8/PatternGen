clc;clear;close all;
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\RK';

patternType = 'PAB';
filenames = getFileNames(DataDir,patternType);
nfiles = length(filenames);

% Set ylimits
if strcmp(patternType,'PP')
    yabsmax = 0.2;
elseif strcmp(patternType,'PAB')
    yabsmax = 0.12;
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
patternType = 'PAB';
filenames = getFileNames(DataDir,patternType);


% FOR UNIVARIATE PLOTS
% fileIDs = 1:3; % Poisson Processes
% fileIDs = [4:8]; % PoissonClusters
% fileIDs = [4 9 10 20]; % Poisson Clusters Other
% fileIDs = [11:14]; % Metner Regularity
% fileIDs = [16:19]; % Mixed


colors = {'#000000','#d7191c','#2b83ba','#fdae61','#abdda4','#ffffbf'};

FH2 = figure('Units','centimeters','Position',[5 5 4.5 4.5]);
for n=1:length(fileIDs)
    filename = filenames{fileIDs(n)};
    filedir = fullfile(DataDir,filename);
    load(filedir)
    
    % statistics
    meanLmR = mean(LmR);
    sdLmR = std(LmR);
    meanPlus = meanLmR+sdLmR;
    meanMinus = meanLmR-sdLmR;
    
    % plot
    
    lwd = 1;
    lcolor = hex2rgb(colors{n});
    
    plot(r,meanLmR,'Color',lcolor,'LineWidth',lwd)
    hold on 
%     plot(r,meanPlus,'Color',lcolor,'LineWidth',lwd*.5)
%     plot(r,meanMinus,'Color',lcolor,'LineWidth',lwd*.5);
    
    xlabel('Scale (r, a.u.)')
    ylabel('L(r)-r')
    xlim([0 r(end)])
    axis square
%     title(filename(1:end-4),'Interpreter','none')
    

        absmax(n)= max(abs([meanLmR]));

    % print
%     ResultName = fullfile(ResultDir,filename(1:end-4));

end
ylim([-1 1]*max(absmax)*1.05)
yline(0,'--k');
% legend(filenames(fileIDs)')
[file,path] = uiputfile(fullfile(ResultDir,'*.pdf'));
saveas(FH2,fullfile(path,file(1:end-4)),'pdf')
close all