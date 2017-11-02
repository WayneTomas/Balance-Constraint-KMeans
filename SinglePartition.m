clc;
clear;
load iris.dat
load wine.dat
load thyroid.dat
load s1.dat
%Once Assignment statistic
    %Once Assignment statistic variable
timeMe=[];
timeHungarian=[];
 costMe=[];
 costHungarian=[];
 row=1;
 count=1;
 data{1}=iris;
 data{2}=wine;
 data{3}=thyroid;
 data{4}=s1;
 %start statistic processing
for i=1:4
%     data{count}=round(rand(size,2)*100);     
    colum=1;
   for k=[3,9,21,45,93]  
       %get cost matrix to test,because this two algorithm use the same
       %data set but their calculation module are not same
       costMatHungarian=getCostMat(data{count},k);
       costMatMe=costMatHungarian(1:k,:);
       tic;[~,costHungarian(row,colum)] = munkres(costMatHungarian);timeHungarian(row,colum)=toc;
       tic;[ ~,costMe(row,colum) ] = AssignmentByIntLinPro( costMatMe );timeMe(row,colum)=toc;
       colum=colum+1;
   end
   row=row+1;
   count=count+1;
end
%%the two once assignment avariable difference
%timeOnceAssignDiff=timeHungarian-timeMe;
%drawing the two once assignment figure
costMeFig=bar3(costMe);
set(costMeFig,'FaceColor','green');
hold on;
costHungarianFig=bar3(costHungarian);
title('single-partition cost figure of real datasets');
set(costHungarianFig,'FaceColor','m');
legend([costMeFig(1),costHungarianFig(1)],'Proposed Method','Mikko''s Method');
set(gca,'zscale','log');
set(gca,'xticklabel',[3,9,21,45,93]);
set(gca,'yticklabel',{'iris','wine','thyroid','s1'});
xlabel('k');
ylabel('data');
zlabel('cost');

figure,timeMeFig=bar3(timeMe);
title('single-partition time figure of real datasets');
set(timeMeFig,'FaceColor','green');
hold on;
timeHungarianFig=bar3(timeHungarian);
set(timeHungarianFig,'FaceColor','m');
legend([timeMeFig(1),timeHungarianFig(1)],'Proposed Method','Mikko''s Method');
set(gca,'zscale','log');
set(gca,'xticklabel',[3,9,21,45,93]);
set(gca,'yticklabel',{'iris','wine','thyroid','s1'});
xlabel('k');
ylabel('data');
zlabel('time');