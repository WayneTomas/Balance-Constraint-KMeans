function [ costMat ] = getCostMat( data,k )
    n = size(data,1);
    for j = 1:k
        pass = 0;
        while pass == 0
            i = randi(n);
            pass = 1;
            for l = 1:j-1
               if data(i,:) == C(l,:) 
                   pass = 0;
               end
            end
        end
        C(j,:) = data(i,:);
    end
    costMat = zeros(n);
    for i=1:n
        for j = 1:n
            costMat(i,j) = (data(j,:)-C(mod(i,k)+1,:))*(data(j,:)-C(mod(i,k)+1,:))';
        end
    end
end
