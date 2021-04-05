%PLOTALLPATTERNS plot all patterns defined in the patterns subdirectory and
%save them as pdfs.
clc; clear; close all;
ptfnames = dir('Patterns');
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\Patterns';
addpath('Patterns')

%% Preliminary simulations
dx = 100;
win = [0 1 0 1];
npts = 100;
TuringPatt = TuringPattern('dims',dx*[win(2)-win(1) win(4)-win(3)]);

im=rgb2gray(imread('hestain.png'));
%Crop to square
mindim = dx;
im(mindim:end,:)=[];
im(:,mindim:end)=[];
im = double(im);

%% Run through patterns
for n = 1:length(ptfnames)
ptfilename = ptfnames(n).name;
if contains(ptfilename,'PP')
    npts = 100;
    % Generate Point process
    run(ptfilename);
    
    % Plot Point Process
    FH = figure('Units','centimeters','Position',[5 5 4.5 4.5]);
    plotPattern(pts,'WindowSize',win,'DisplayAxes',false,'MarkerSize',3);
    title(ptfilename,'Interpreter','none')
    
    RootName = ptfilename(1:end-2);
    ResultName = fullfile(ResultDir,RootName);
    saveas(FH,ResultName,'pdf')
    close all
elseif contains(ptfilename,'PAB')
    
    run(ptfilename);
    FH = figure('Units','centimeters','Position',[5 5 4.5 4.5]);
    plotPattern(pts,'PtsB',ptsB,'WindowSize',win,'DisplayAxes',false,'MarkerSize',3);
    title(ptfilename,'Interpreter','none')
    
    RootName = ptfilename(1:end-2);
    ResultName = fullfile(ResultDir,RootName);
    saveas(FH,ResultName,'pdf')
    close all
elseif contains(ptfilename,'SP')
    npts=100;
    run(ptfilename);
    FH = figure('Units','centimeters','Position',[5 5 4.5 4.5]);
    imagesc(IMap)
    hold on
    plot(dx*pts(:,1),dx*pts(:,2),'or','MarkerFaceColor','r','MarkerSize',3)
    
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    set(gca,'ytick',[])
    set(gca,'xtick',[])
    
    RootName = ptfilename(1:end-2);
    ResultName = fullfile(ResultDir,RootName);
    saveas(FH,ResultName,'pdf')
    close all
end

end
