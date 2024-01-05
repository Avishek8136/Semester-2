function[Q] = getQRbyGramSchmidt(M)
    [m,n] = size(M);
    Q = zeros(m,n);
    Q(:,1) = M(:,1)/norm(M(:,1));
    for i = 2:n
        cv = M(:,i);
        %% Comments
        for j = 1:i-1
            cv = cv-(cv'*Q(:,j))*Q(:,j);
        end
        Q(:,i)=cv/norm(cv);
    end
end
   %% Commenmts

