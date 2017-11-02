% 随机数据集
% % 统计随机数据集MSE的变异系数
statisticRow=1;%随便取的变量名，没什么含义
for q=1:5
   for w=1:5
       for e=1:iterationTimes
           statisticSetMSE_Me(statisticRow,e)=clusterMSESave_Me{1,e}(q,w);
           statisticSetMSE_S(statisticRow,e)=clusterMSESave_S{1,e}(q,w);
           statisticSetMSE_Kbs(statisticRow,e)=clusterMSESave_Kbs{1,e}(q,w);
       end
       varianceMSE_Me(q,w)=sqrt(var(statisticSetMSE_Me(statisticRow,:)));
       varianceMSE_S(q,w)=sqrt(var(statisticSetMSE_S(statisticRow,:)));
       varianceMSE_Kbs(q,w)=sqrt(var(statisticSetMSE_Kbs(statisticRow,:)));
       statisticRow=statisticRow+1;
   end
end
cvMSE_Me=varianceMSE_Me./clusterMSE_Me;
cvMSE_S=varianceMSE_S./clusterMSE_S;
cvMSE_Kbs=varianceMSE_Kbs./clusterMSE_Kbs;
% % 
% % 统计随机数据集中Iteration Count的变异系数
statisticRow=1;
for q=1:5
    for w=1:5
        for e=1:iterationTimes
           statisticSetCount_Me(statisticRow,e)=clusterCountSave_Me{1,e}(q,w);
           statisticSetCount_S(statisticRow,e)=clusterCountSave_S{1,e}(q,w);
       end
       varianceCount_Me(q,w)=sqrt(var(statisticSetCount_Me(statisticRow,:)));
       varianceCount_S(q,w)=sqrt(var(statisticSetCount_S(statisticRow,:)));
       statisticRow=statisticRow+1;
    end
end
cvCount_Me=varianceCount_Me./clusterCount_Me;
cvCount_S=varianceCount_S./clusterCount_S;
% % 
% % 统计随机数据集中Time的变异系数
statisticRow=1;
for q=1:5
    for w=1:5
        for e=1:iterationTimes
           statisticSetTime_Me(statisticRow,e)=clusterTimeSave_Me{1,e}(q,w);
           statisticSetTime_S(statisticRow,e)=clusterTimeSave_S{1,e}(q,w);
           statisticSetTime_Kbs(statisticRow,e)=clusterTimeSave_Kbs{1,e}(q,w);
       end
       varianceTime_Me(q,w)=sqrt(var(statisticSetTime_Me(statisticRow,:)));
       varianceTime_S(q,w)=sqrt(var(statisticSetTime_S(statisticRow,:)));
       varianceTime_Kbs(q,w)=sqrt(var(statisticSetTime_Kbs(statisticRow,:)));
       statisticRow=statisticRow+1;
    end
end
cvTime_Me=varianceTime_Me./clusterTime_Me;
cvTime_S=varianceTime_S./clusterTime_S;
cvTime_Kbs=varianceTime_Kbs./clusterTime_Kbs;
% % % 
% % % 
% % % 
