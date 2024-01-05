function Regression_gradientdescent()
    n = input('Please enter value for n: ');
    DataPoints = [rand(2, n)];
    Theta = [0; 1];
    Theta(2)
    W = findRegModel(DataPoints, Theta);
    disp('Final regression model:');
    disp(W);
    PlotMyModelAndData(DataPoints, W);
end

function PlotMyModelAndData(DataPoints, Model)
    scatter(DataPoints(1,:), DataPoints(2,:), '*r');
    MinXV = min(DataPoints(1,:)) - 1;
    MaxXV = max(DataPoints(1,:)) + 1;
    XV = MinXV:0.01:MaxXV;
    Model(2)
    YV = Model(1) * XV + Model(2);
    hold on;
    scatter(XV, YV, '.b');
end

function W = findRegModel(DataPoints, Theta)
    Alpha = 0.01;
    [~, N] = size(DataPoints);
    JC = 0;
    JM = 0;
    prev = 0;
    condition = true;
    
    while condition
        JM = 0;
        JC = 0;
        for i = 1:N
            prev = Theta(1) * DataPoints(1, i) + Theta(2);
            JM = JM + (DataPoints(2, i) - prev) * (-DataPoints(1, i));
            JC = JC + (DataPoints(2, i) - prev) * (-1);
        end

        J = [(2 / N) * JM; (2 / N) * JC];
        Theta = Theta - Alpha * J;

        if norm(J) < 0.00001
            condition = false;
        end
    end
    
    W = Theta;
end
