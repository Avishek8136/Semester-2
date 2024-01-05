A=[-1 -1;-1 -2 ; -2 -1; -2 -2; 1 1; 1 2;2 1;2 2 ];
covar=cov(A);
[u,v]=eigs(covar);
firstprincipaldirection=(u(:,1));
secondprincipaldirection=(u(:,2));
scatter(A(:,1),A(:,2));
hold on;
quiver(0, 0, firstprincipaldirection(1), firstprincipaldirection(2), 'r', 'LineWidth', 2);
quiver(0,0,secondprincipaldirection(1),secondprincipaldirection(2),'g','LineWidth',2);
axis equal;
% Set the limits of the plot
xlim([-2.5 2.5]);
ylim([-2.5 2.5]);
% Add labels and title
xlabel('X');
ylabel('Y');
title('Principal Directions');

%b
projectedData1D = A * firstprincipaldirection;
% Display the 1D projected data points
disp("1D projected data points:");
disp(projectedData1D);

%c
projectedData2D=A*secondprincipaldirection;
meandata=mean(A);
% Reconstruct the data from the first principal component
reconstructedData1D = projectedData1D * firstprincipaldirection' + meandata;
% Reconstruct the data from the second principal component
reconstructedData2D = projectedData2D * secondprincipaldirection' + meandata;
% Reconstruct the data from both components
reconstructedDataBoth = (projectedData1D * firstprincipaldirection' + projectedData2D * secondprincipaldirection') + meandata;
% Plot the reconstructed data points (first principal component)
scatter(reconstructedData1D(:, 1), reconstructedData1D(:, 2), 'filled', 'MarkerFaceColor', '#D3D3D3');
% Plot the reconstructed data points (second principal component)
scatter(reconstructedData2D(:, 1), reconstructedData2D(:, 2), 'filled', 'MarkerFaceColor', '#A9A9A9');
% Plot the reconstructed data points (both components)
scatter(reconstructedDataBoth(:, 1), reconstructedDataBoth(:, 2), 'filled', 'MarkerFaceColor', '#808080');
hold off;

%d
% Compute the MSE for each case
mse1D = mean((A - reconstructedData1D).^2, 'all');
mse2D = mean((A - reconstructedData2D).^2, 'all');
% Display the MSE for each case
disp("MSE for 1D projection:");
disp(mse1D);
disp("MSE for 2D projection:");
disp(mse2D);

%e
% Perform SVD using MATLAB
[U, S, V] = svd(A);
% Get the dominant V vector
dominantV = V(:, 1);
% Plot the dominant V vector
figure;
plot([0, dominantV(1)], [0, dominantV(2)], 'r', 'LineWidth', 2);
axis equal;
xlim([-0.1 0.8]);
ylim([-0.1 0.8]);
xlabel('X');
ylabel('Y');
title('Dominant V Vector');
% Display the dominant V vector
disp("Dominant V vector:");
disp(dominantV);