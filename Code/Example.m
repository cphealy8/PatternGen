for n = 1:10
    ID = 0.02:0.01:0.2;
    for k =1:length(ID)
        sigRadius = .15;
        sigSD = .03;
        sigpts = InhibitionPP(win,0.4,ID(k));

        sigKern = fspecial('gaussian',sigRadius*dx,sigSD*dx);
        sigKern = sigKern./max(sigKern(:));
        IMap = pts2signal(sigpts,win,dx,sigKern,'Normalize','true');
% close all 
%         imagesc(IMap)
%         hold on
%         plot(sigpts(:,1)*100,sigpts(:,2)*100,'.r');
%         axis equal
%         axis tight
%         ax = gca;
%         ax.XTick = [];
%         ax.YTick = [];

        vPix(n,k) = sum(IMap(:)>0.2)/numel(IMap);
        ncells(n,k) = length(sigpts);
    end
end



density = ceil(logspace(1,3,20));
for n = 1:10
    for k =1:length(density)
        sigRadius = .15;
        sigSD = .03;
        sigpts = PoissonPP(win,density(k));

        sigKern = fspecial('gaussian',sigRadius*dx,sigSD*dx);
        sigKern = sigKern./max(sigKern(:));
        IMap = pts2signal(sigpts,win,dx,sigKern,'Normalize','true');

% close all 
%         imagesc(IMap)
%         hold on
%         plot(sigpts(:,1)*100,sigpts(:,2)*100,'.r');
%         axis equal
%         axis tight
%         ax = gca;
%         ax.XTick = [];
%         ax.YTick = [];

        pvPix(n,k) = sum(IMap(:)>0.2)/numel(IMap);
        pncells(n,k) = length(sigpts);
    end
end

% Compare
semilogx(2*mean(ncells)/100,mean(vPix),'-b','LineWidth',2);
hold on
semilogx(2*ncells(:)/100,vPix(:),'.b')

semilogx(mean(pncells)/100,mean(pvPix),'-r','LineWidth',2);
semilogx(pncells(:)/100,pvPix(:),'.r')
axis tight
yline(0.9,'--k')
xlabel('Cost per 100 cells ($)')
ylabel('Protein Saturation')




 
