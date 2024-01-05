function R = getR(Q,M)
    [m,n]=size(Q);
    R=zeros(m,n);
    for i=1:n
        cv=M(:,i);
        for j=1 : i
            R(j,i)=cv'*Q(:,j);
        end
    end
end