function [ u,markedData,MSE_best,count] = BalancedKmeansWithIntLinPro( data,k,u )
%initial some basic parameter
    MSE_best=inf;
    [dataLength,~]=size(data);
%     [~,u]=kmeanspp(data',k);
%     u=u';
    costMat=zeros(k,dataLength);
    re=zeros(dataLength,2);
    count=0;
    preCentroids=u;
%start clustering
    while 1
        clusterCount=1;
        position=0;
    %computing cost matrix
        for i=1:k
            for j=1:dataLength
                  costMat(i,j)=(u(i,:)-data(j,:))*(u(i,:)-data(j,:))';
%                     costMat(i,j)=(pdist2(u(i,:),data(j,:),'euclidean'))^2;
            end
        end
        [assignment,cost]=AssignmentByIntLinPro(costMat);
        for i=1:k
            clusterData=find(assignment(i,:)==1);          
            re(position+1:position+length(clusterData),1)=clusterCount;
            re(position+1:position+length(clusterData),2)=clusterData';
            position=position+length(clusterData);
            clusterCount=clusterCount+1;
        end
        %computing the average and update the centroids
        for i=1:k
            assignedDataNum=re(find(re(:,1)==i),:);
            assignedDataNum(:,1)=[];                %删除标记了cluster编号的assignedDataNum
                                                    %从而得到某一cluster中data的数据编号
            assignedData=data(assignedDataNum,:);
            u(i,:)=mean(assignedData);
        end
        MSE=cost/dataLength;
        if (MSE<MSE_best)
            MSE_best = MSE;
        else
            break;
        end
        
        if norm(preCentroids-u)== 0  %不断迭代直到位置不再变化
           break;
        end
        preCentroids=u;
        count=count+1;
    end
    markedData=[];
%     for i=1:k
%         currentNum=re(find(re(:,1)==i),:);
%         current=data(currentNum(:,2),:);
%         index=linspace(i,i,length(currentNum))';
%         markedData=[markedData;index,current];
%     end
end

