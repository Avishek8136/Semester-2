A = [1 0; -1 1];
[vec, val] = eig(A);  % Compute eigenvectors and eigenvalues
S = vec;  % Set S as the matrix of eigenvectors
diagonalized_matrix = S * val * inv(S);  % Compute S*Lambda*S^(-1)
disp("Diagonalized matrix:")
disp(diagonalized_matrix)
