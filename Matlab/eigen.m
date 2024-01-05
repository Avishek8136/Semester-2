A=[1 0;0 1];
[vec,val]=eig(A);
disp("eigen vector =")
disp(vec)
disp("eigen value =")
disp(val)
disp("A*lambda1 =")
disp(A*vec(:,1))
disp("lambda1*x=")
disp(vec*val(:,1))
disp("A*lambda2=")
disp(A*vec(:,2))
disp("lambda2*x=")
disp(vec*val(:,2))
%null space is eigen vector of any matrix