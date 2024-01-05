A= [1 2 3; 4 5 6;7 8 9];
[m, n] = size(A);
rref_A = A;
row_idx=1;
for col_idx = 1:n
   pivot_row = find(rref_A(row_idx:end, col_idx), 1) + row_idx-1;
   if isempty(pivot_row)
       continue;
   end
   rref_A([row_idx, pivot_row], :) = rref_A([pivot_row, row_idx], :);
   pivot_val = rref_A(row_idx, col_idx);
   rref_A(row_idx, :) = rref_A(row_idx, :) / pivot_val;
   for i = 1:m
       if i ~= row_idx
           rref_A(i, :) = rref_A(i, :) - rref_A(i, col_idx)* rref_A(row_idx, :);
       end
    end
row_idx = row_idx + 1;
end
disp(rref_A)
