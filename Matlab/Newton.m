function Newton()
    DataPoints = [-1 -1; -2 -2; -2 -1; -1 -2; 1 2; 2 1; 1 1; 2 2];
    Theta = findgd(DataPoints);
    disp(Theta)
    plotmymodel(DataPoints, Theta);
end
function Theta = findgd(DataPoints)
    a = zeros(2, 1);
    maxIterations = 100;
    iterations = 0;
    while iterations < maxIterations
        iterations = iterations + 1;
        gradient = zeros(2, 1);
        H = zeros(2, 2);
        alpha=0.1;
        for i = 1:size(DataPoints, 1)
            x = DataPoints(i, 1);
            y = DataPoints(i, 2);
            yPred = a(1) * x + a(2);
            gradient(1) = gradient(1) + (2 / size(DataPoints, 1)) * (yPred - y) * x;
            gradient(2) = gradient(2) + (2 / size(DataPoints, 1)) * (yPred - y);
            H(1,1) = H(1,1) + (2 / size(DataPoints, 1)) * (x * x);
            H(1,2) = H(1,2) + (2 / size(DataPoints, 1)) * x;
            H(2,1) = H(2,1) + (2 / size(DataPoints, 1)) * x;
            H(2,2) = 2;
        end         
        a = a - alpha*inv(H) * gradient;
    end     
    Theta = a;
end
function plotmymodel(DataPoints, Model)
    scatter(DataPoints(:, 1), DataPoints(:, 2), '*r');
    hold on;
    MinXV = min(DataPoints(:, 1)) - 1;
    MaxXV = max(DataPoints(:, 1)) + 1;
    XV = MinXV:0.01:MaxXV;
    YV = Model(1) * XV + Model(2);
    plot(XV, YV, '-b');
    xlabel('X');
    ylabel('Y');
    title('Linear Regression Model');
    legend('Data Points', 'Linear Regression Model');
    hold off;
end
