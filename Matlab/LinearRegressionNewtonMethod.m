function [slope, intercept] = LinearRegressionNewtonMethod(x, y)
    n = length(x);
    x_mean = sum(x) / n;
    y_mean = sum(y) / n;

    numerator = sum((x - x_mean) .* (y - y_mean));
    denominator = sum((x - x_mean) .^ 2);

    slope = numerator / denominator;
    intercept = y_mean - slope * x_mean;
end

function plotDataAndLine(x, y, slope, intercept)
    % Plot the data points
    scatter(x, y, 'ro', 'LineWidth', 2);
    hold on;

    % Plot the line
    x_values = linspace(min(x), max(x), 100);
    y_values = slope * x_values + intercept;
    plot(x_values, y_values, 'b-', 'LineWidth', 2);

    xlabel('t');
    ylabel('y');
    title('Optimal Line using Linear Regression');
    grid on;

    % Add legend
    legend('Data Points', 'Optimal Line');
    hold off;
end

% Given points
t = [-1, -2, -2, -1, 1, 2, 1, 2];
y = [-1, -2, -1, 2, 2, 1, 1, 2];

% Find the optimal line
[slope, intercept] = LinearRegressionNewtonMethod(t, y);

% Display the results
disp('Optimal line:');
disp(['y = ' num2str(slope) 'x + ' num2str(intercept)]);

% Plot the data points and the optimal line
plotDataAndLine(t, y, slope, intercept);
