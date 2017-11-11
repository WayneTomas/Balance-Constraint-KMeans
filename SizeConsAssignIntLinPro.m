function [ assignment,cost ] = SizeConsAssignIntLinPro( costMat,sizeConsMat )
    options = optimoptions('intlinprog','Display','off','RelativeGapTolerance',0);
    C=costMat';
    [m,n]=size(C);
    f=C(:);                     %目标函数系数矩阵（实际为列向量，intlinprog中得组织成列向量才能计算）
    intcon=(1:m*n)';            %限定所求X矩阵所有元素为整数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%关于等式约束条件的构造说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          
% 在Blance-Constraint K-Means算法的数学建模中（我的原始版本的建模，参见V0.0.18之前版本的论文，与老师改过的公式
%的区别在于，我的模型一行表示一个cluster，一列表示一个object，与老师的建模正好相反，而代码是按我的建模写的），
%等式约束条件，用来表示X矩阵（分配矩阵）一列所有元素相加，只能等于1（其现实意义为：一个object只能属于一个cluster，如
%假设200 points分3类，第一列第1个元素为1，则第一列其他2个元素只能为0，即point 1分给了第1类，它不能属于其他类）。
%现对Aeq矩阵做出如下必要说明（仍用上例）：
%   1.所构建的Aeq矩阵，为（200，（200*3））的矩阵，每一行表示X矩阵的一列（一个object）的分配情况，由于目标系数矩阵f
%   为一个600*1的列向量（costMat中的每个元素构成的向量（按行一个一个），每个元素表示点分给不同类的代价），Aeq的列在
%   此处构建中没有特殊含义。
%   2.Aeq中，标1的元素，表示当前计算的为这几个位置，如第1个，第201个，第401个，即在所求分配矩阵中处于x11，x21，x31
%   位置的元素，这几个位置表示的就是第1个object，由于它只能属于一个cluster，所以这三个位置加起来应当为1（即分配
%   矩阵A中，只有一个元素为1，其余为0，即Aeq1*x11+Aeq2*x21+Aeq3*x31=1，可能的一种情况是只有x11为1，其余为0）
%   3.在构造Aeq矩阵时，通过仔细观察矩阵构造，采用了取巧的赋值情况，即使用eye的单位矩阵函数一次性赋值，只要执行k次
%   循环即可，避免了重复赋值效率的降低，体现了Matlab的向量化写法。
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%关于等式约束条件的构造说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Aeq=zeros(m,m*n);
    for i=1:n
        Aeq(1:m,1+(i-1)*m:i*m)=eye(m,m);
    end
    beq=ones(m,1);
    Aeq=sparse(Aeq);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%关于不等式约束条件的构造说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%其构造思想与等式约束条件一致，都是通过两个矩阵（约束矩阵A与所求分配矩阵X）来共同决定等式约束。
%现对A矩阵（指的是下文代码中的约束矩阵A，非论文中所提的分配矩阵A，为防止歧义，现特别说明）作为必要说明（按上例）：
%   1.IntLinProg函数对于不等式约束，本质上只接受<=的条件，对于>=要对约束方程两边同时乘以-1，转化为<=的形式。
%   2.min number of cluster<=a1*x11+a2*x12*...an*xnn<= max number of cluster
%     这是矩阵构建使用的核心公式。所以，所构建的A矩阵，一行600个元素，选取其中的200个，如第一行选择1-200，即表明
%     在对应的分配矩阵中的，第一行（第一类）200个points的分配情况，要求其个数小于min number of cluster，且大于
%     max number of cluster。同理，A矩阵第二行选取201-400，对应的则是分配矩阵中的第二行（第二类）的情况，其余依次
%     类推。
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%关于不等式约束条件的构造说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    A=zeros(n*2,m*n);
%     for i=1:n
%         A(i,1+(i-1)*m:i*m)=ones(1,m)*-1;
%     end
%     for i=1:n
%         A(i+n,1+(i-1)*m:i*m)=ones(1,m);
%     end
%     for i=1:n
%         b(1:n)=sizeConsMat(i)*-1;
%         b(n+1:n*2)=sizeConsMat(i);
%     end
    for i=1:n
        A(i,1+(i-1)*m:i*m)=ones(1,m)*-1;
        A(i+n,1+(i-1)*m:i*m)=ones(1,m);
        b(1:n)=sizeConsMat(i)*-1;
        b(n+1:n*2)=sizeConsMat(i);
    end
    A=sparse(A);

%   上下界限定
    lb=zeros(m*n,1);        %lb，low bounds，此处限定为0
    ub=ones(m*n,1);         %ub，upper bounds，此处限定为1。由于上面intcon已经限定了整个X矩阵为整数，且此处又限定
                            %了X的上界与下界，所以即X的值只能取0或1，即0-1整数规划     
%   执行0-1整数规划函数intlinprog
    [X,cost]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options);
    if(isempty(X))
        mException=MException('Error:AssignmentMatrixEmpty',...
            'There is no solution found of Size Constraint Clustering!');
        throw(mException);
    else
        assignment=reshape(X,m,n);
        assignment=assignment';
    end
end