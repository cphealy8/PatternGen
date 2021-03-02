%PLOTALLPATTERNS plot all patterns defined in the patterns subdirectory and
%save them as pdfs.
clc; clear; close all;
ptfnames = dir('Patterns');
DataDir = '..\Data\Patterns';
ResultDir = '..\Results\Patterns';
addpath('Patterns')

for n = 1:length(ptfnames)
win = [0 1 0 1];
npts = 100;

ptfilename = ptfnames(n).name;
if contains(ptfilename,'PP')
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
end

    
end
