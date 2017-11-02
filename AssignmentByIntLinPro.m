function [ assignment,cost ] = AssignmentByIntLinPro( costMat )
    options = optimoptions('intlinprog','Display','off','RelativeGapTolerance',0);
    C=costMat';
    [m,n]=size(C);
    f=C(:);                     %目标函数系数矩阵（实际为列向量，intlinprog中得组织成列向量才能计算）
    intcon=(1:m*n)';
    Aeq=zeros(m,m*n);
    for i=1:n
        Aeq(1:m,1+(i-1)*m:i*m)=eye(m,m);
    end
    beq=ones(m,1);
    A=zeros(n*2,m*n);
    for i=1:n
        A(i,1+(i-1)*m:i*m)=ones(1,m)*-1;
    end
    for i=1:n
        A(i+n,1+(i-1)*m:i*m)=ones(1,m);
    end
    b(1:n)=floor(m/n)*-1;
    b(n+1:n*2)=ceil(m/n);

    lb=zeros(m*n,1);
    ub=ones(m*n,1);
    [X,cost]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options);
    assignment=reshape(X,m,n);
    assignment=assignment';
end

