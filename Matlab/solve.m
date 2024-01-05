disp("FOR Ax=b")
A =  [1 2; 0.48 0.99];
b =  [3.1; 1.47];
disp("(d)")
disp("A matrix")
disp(A)
disp("condition number of A")
disp(cond(A))
disp("b matrix")
disp(b)

%condition number
cond(A)

%Matrix Inversion
disp("With  Matrix Inversion")
x=inv(A)*b;
disp("Solution matrix x=")
disp(x)
%Gauss Elimination
disp("With  Gauss Elimination")
C=[A b];
r=rref(C);
[~,n]=size(r);
x=r(:,n);
disp("Solution matrix x=")
disp(x)
%Using LU
disp("With  Using LU")
[L,U,P]=lu(A)
y = L\(P*b);
x=U\y;
disp("Solution matrix x=")
disp(x)
%Using QR
disp("With  Using QR")
[Q,R]=qr(A)
x=R\(Q'*b)
disp("Solution matrix x=")
disp(x)
