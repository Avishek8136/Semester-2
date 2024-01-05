A=[1 2 3;4 5 6;7 8 9];
rref_M=rref(A);
rank_M=rank(rref_M);
rowspace_M=rref_M(1:rank_M,:);
colspace_M=A(:,1:rank_M);
disp("row space of A=")
disp(rowspace_M)
disp("column space of A=")
disp(colspace_M)
scatter(colspace_M(:,1),colspace_M(:,2),"*b");
hold on;
scatter(rowspace_M(1,:),rowspace_M(2,:),"*r");

