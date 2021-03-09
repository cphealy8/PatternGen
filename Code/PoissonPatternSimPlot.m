
%% Multi-plot Overlay
clc;clear;close all;
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\RK';
fSize = 11;


% FOR UNIVARIATE PLOTS
% patternType = 'PP';
% fileIDs = 1:3; % Poisson Processes
% colors = {'y','m','c'};

% FOR BIVARIATE PLOTS
patternType='PAB';
fileIDs=1:2;
colors = {'m','c'};

filenames = getFileNames(DataDir,patternType);



FH2 = figure('Units','centimeters','Position',[5 5 8 8]);

% Plot CSR intervals
    filename = filenames{fileIDs(1)};
    filedir = fullfile(DataDir,filename);
    load(filedir)
    
for n=1:length(fileIDs)
    filename = filenames{fileIDs(n)};
    filedir = fullfile(DataDir,filename);
    load(filedir)
    
    % statistics
    meanCSR = mean(LmR);
    sdCSR = std(LmR);
    maxCSR = max(LmR);
    minCSR = min(LmR);
    meanPlusCSR = meanCSR+sdCSR;
    meanMinusCSR = meanCSR-sdCSR;
    r2 = [r, fliplr(r)];
    inBetween = [minCSR, fliplr(maxCSR)];


    lwd = 2;
    lcolor = colors{n};
    

    fill(r2, inBetween,lcolor,'LineStyle','none','FaceAlpha',0.2);
    hold on 
    plot(r,meanCSR,'Color',lcolor,'LineWidth',lwd)

%     plot(r,meanPlus,'Color',lcolor,'LineWidth',lwd*.5)
%     plot(r,meanMinus,'Color',lcolor,'LineWidth',lwd*.5);
    
    xlabel('Scale (r, a.u.)','FontSize',fSize)
    ylabel('L(r)-r','FontSize',fSize)
    xlim([0 r(end)])
    axis square
    set(gca,'FontSize',fSize-1)
%     title(filename(1:end-4),'Interpreter','none')
    

        absmax(n)= max(abs([meanCSR minCSR maxCSR]));

    % print
%     ResultName = fullfile(ResultDir,filename(1:end-4));

end
ylim([-1 1]*max(absmax)*1.05)
yline(0,'-k');
% legend(filenames(fileIDs)')
[file,path] = uiputfile(fullfile(ResultDir,'*.pdf'));
saveas(FH2,fullfile(path,file(1:end-4)),'pdf')
close all