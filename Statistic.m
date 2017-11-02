clc;
clear;
% %Once Assignment statistic
%     %Once Assignment statistic variable
%  timeMe=[];
%  timeHungarian=[];
%  costMe=[];
%  costHungarian=[];
%  row=1;
%  count=1;
%  %start statistic processing
% for size=200:200:1000
%     data{count}=round(rand(size,2)*100);     
%     colum=1;
%    for k=[3,9,21,45,93]  
%        %get cost matrix to test,because this two algorithm use the same
%        %data set but their calculation module are not same
%        costMatHungarian=getCostMat(data{count},k);
%        costMatMe=costMatHungarian(1:k,:);
%        tic;[~,costHungarian(row,colum)] = munkres(costMatHungarian);timeHungarian(row,colum)=toc;
%        tic;[ ~,costMe(row,colum) ] = AssignmentByIntLinPro( costMatMe );timeMe(row,colum)=toc;
%        colum=colum+1;
%    end
%    row=row+1;
%    count=count+1;
% end
% %%the two once assignment avariable difference
% %timeOnceAssignDiff=timeHungarian-timeMe;
% %drawing the two once assignment figure
% costMeFig=bar3(costMe);
% set(costMeFig,'FaceColor','green');
% hold on;
% costHungarianFig=bar3(costHungarian);
% title('single-partition cost figure');
% set(costHungarianFig,'FaceColor','m');
% legend([costMeFig(1),costHungarianFig(1)],'Proposed Method','Mikko''s Method');
% set(gca,'zscale','log');
% set(gca,'xticklabel',[3,9,21,45,93]);
% set(gca,'yticklabel',200:200:1000);
% xlabel('k');
% ylabel('size');
% zlabel('cost');
% 
% figure,timeMeFig=bar3(timeMe);
% title('single-partition time figure');
% set(timeMeFig,'FaceColor','green');
% hold on;
% timeHungarianFig=bar3(timeHungarian);
% set(timeHungarianFig,'FaceColor','m');
% legend([timeMeFig(1),timeHungarianFig(1)],'Proposed Method','Mikko''s Method');
% set(gca,'zscale','log');
% set(gca,'xticklabel',[3,9,21,45,93]);
% set(gca,'yticklabel',200:200:1000);
% xlabel('k');
% ylabel('size');
% zlabel('time');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Clustering Statistic
    %Clustering statistic variable
clusterCount_S=[];
clusterMSE_S=[];
clusterTime_S=[];

clusterCount_Me=[];
clusterMSE_Me=[];
clusterTime_Me=[];

clusterMSE_Kbs=[];
clusterTime_Kbs=[];

row=1;
count=1;
%start clustering processing
for size=200:200:1000
    data{count}=round(rand(size,2)*100);
    colum=1;
    for k=[3,9,21,45,93]
        [~,u]=kmeanspp(data{count}',k);
        u=u';
        %my algorithm
        tic;
        [clusterMSE_S(row,colum),clusterCount_S(row,colum)]=balanced_kmeans(data{count},k,u);
        clusterTime_S(row,colum)=toc;
        %the original author algorithm
        tic;
        [ ~,~,clusterMSE_Me(row,colum),clusterCount_Me(row,colum)] = BalancedKmeansWithIntLinPro( data{count},k,u );
        clusterTime_Me(row,colum)=toc;
        %kbs algorithm
        nb=ones(1,k)*fix(size/k);
        for i=1:mod(size,k)
            nb(i)=nb(i)+1;
        end
        tic;
        clusterMSE_Kbs(row,colum)=BalancedKmeansWithKbs(data{count},k,nb);
        clusterTime_Kbs(row,colum)=toc;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        colum=colum+1;
    end
    row=row+1;
    count=count+1;
end
%%the two clustering variable difference
%iterationNumDiff=clusterCount_S-clusterCount_Me;
%mseClusterDiff=clusterMSE_S-clusterMSE_Me;
%timeClusterDiff=clusterTime_S-clusterTime_Me;
%%drawing the three clustering algorithm figure
%iteration count figure
figure,iterationCountFig_S=bar3(clusterCount_S);
title('clustering iteration count figure');
set(iterationCountFig_S,'FaceColor','red');
hold on;
iterationCountFig_Me=bar3(clusterCount_Me);
set(iterationCountFig_Me,'FaceColor','green');
legend([iterationCountFig_S(1),iterationCountFig_Me(1)],'bk','bck');
set(gca,'zscale','log');
set(gca,'xticklabel',200:200:1000);
set(gca,'yticklabel',[3,9,21,45,93]);
xlabel('size');
ylabel('k');
zlabel('iteration count');

%MSE figure
figure,clusterMSEFig_Kbs=bar3(clusterMSE_Kbs);
title('clustering mse figure');
hold on;
set(clusterMSEFig_Kbs,'FaceColor','c');
clusterMSEFig_S=bar3(clusterMSE_S);
set(clusterMSEFig_S,'FaceColor','m');
clusterMSEFig_Me=bar3(clusterMSE_Me);
set(clusterMSEFig_Me,'FaceColor','green')
legend([clusterMSEFig_Kbs(1),clusterMSEFig_S(1),clusterMSEFig_Me(1)],'sck','bk','bck');
set(gca,'zscale','log');
set(gca,'xticklabel',200:200:1000);
set(gca,'yticklabel',[3,9,21,45,93]);
xlabel('size');
ylabel('k');
zlabel('mse');

%time figure
figure,clusterTimeFig_Kbs=bar3(clusterTime_Kbs);
set(clusterTimeFig_Kbs,'FaceColor','green');
hold on;
clusterTimeFig_S=bar3(clusterTime_S);
title('clustering time figure');
set(clusterTimeFig_S,'FaceColor','c');
clusterTimeFig_Me=bar3(clusterTime_Me);
set(clusterTimeFig_Me,'FaceColor','m');
legend([clusterTimeFig_Kbs(1),clusterTimeFig_S(1),clusterTimeFig_Me(1)],'sck','bk','bck');
set(gca,'zscale','log');
set(gca,'xticklabel',200:200:1000);
set(gca,'yticklabel',[3,9,21,45,93]);
xlabel('size');
ylabel('k');
zlabel('time');