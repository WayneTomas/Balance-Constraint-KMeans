function [ assignment,cost ] = MicroAssignment( costMat )
    options = optimoptions('intlinprog','Display','off','RelativeGapTolerance',0);
    C=costMat';
    [m,n]=size(C);
    f=C(:);
    intcon=(1:m*n)';
    %等式约束条件
    Aeq=zeros(m,m*n);
    for i=1:n
        Aeq(1:m,1+(i-1)*m:i*m)=eye(m,m);
    end
    beq=ones(m,1);
    %不等式约束条件
    A=zeros(n,m*n);
    for i=1:n
        A(i,1+(i-1)*m:i*m)=ones(1,m)*-1;
    end
    b(1:n)=floor(m/n)*-1;

    %变量取值约束条件，此处约束为0<=x<=1,即01规划
    lb=zeros(m*n,1);
    ub=ones(m*n,1);
    [X,cost]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub,options);
    assignment=reshape(X,m,n);
    assignment=assignment';
end

