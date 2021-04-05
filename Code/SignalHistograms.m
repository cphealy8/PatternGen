%% Parameters
clc;clear;close all;
dx = 100;
win = [0 1 0 1];
npts = 100;
%% Function Pattern
fun = @(x,y) sin(x/6)+cos(y/6);
FuncS =Func2Signal(fun,win,dx,'Normalization','on');
map{1} = NormRange(FuncS,[0 1]);
%% Turing Pattern
TPattern = TuringPattern('dims',dx*[win(2)-win(1) win(4)-win(3)]);
map{2} = NormRange(TPattern,[0 1]);
%% Gaussian Kernel
Sig2Pts_GaussianKernel
map{3} = NormRange(IMap,[0 1]);
%% Uniform Kernel
Sig2Pts_UniformKernel
map{4} = NormRange(IMap,[0 1]);
%% Image
im=rgb2gray(imread('hestain.png'));

%Crop to square
mindim = dx;
im(mindim:end,:)=[];
im(:,mindim:end)=[];
im = double(im);
map{5} = NormRange(im,[0 1]);

%%
edges = linspace(0,1,21);
space=edges(2)-edges(1);
nx = linspace(space/2,edges(end)-space/2,length(edges)-1);
for n=1:length(map)
    [hcounts{n},~,~] = histcounts(map{n}(:),edges,'Normalization','Probability');
    
%     % Normalize
%     hmax = max(hcounts{n});
%     hcounts{n}=hcounts{n}/hmax;
end

%% Plot Frequency distributions
FSize=11;
ResultDir = '..\Results\RK';
colors = {'#d7191c','#2b83ba','#fdae61','#abdda4','#ffff91'};
% colors = {'#d7191c','#2b83ba','#fdae61','#abdda4','#ffff91'};

FH = figure('Units','centimeters','Position',[5 5 8 8]);

hold on
for n=1:length(hcounts)
    lcolor = hex2rgb(colors{n});
    semilogy(nx,hcounts{n},'Color',lcolor,'LineWidth',2)
end
legend('Function','Turing','Gaussian Kernel','Uniform Kernel','Image')
xlabel('Pixel Intensity','FontSize',FSize);
ylabel('Frequency','FontSize',FSize);
set(gca,'FontSize',FSize-1);
% set(gca, 'YScale', 'log')
[file,path] = uiputfile(fullfile(ResultDir,'*.pdf'));
saveas(FH,fullfile(path,file(1:end-4)),'pdf')

%% Get histograms
% figure
% ax(1) = histogram(map{1});
% ax(1).Normalization='Probability';
% ax(1).BinWidth = 0.05;
% hold on
% for n=2:length(map)
%     ax(n) = histogram(map{n});
%     ax(n).Normalization='Probability';
%     ax(n).BinWidth = 0.05;
% end
% 
% legend('Function','Turing','Gaussian Kernel','Uniform Kernel','Image')
