function linareg()
    DataPoints = [-1 -2 -1 -2 1 1 2 2; -1 -1 -2 -2 1 2 1 2];
    thetha = findModel(DataPoints);
    plotMyModelAndData(DataPoints, thetha);
end

function model = findModel(DataPoints)
    [m, n] = size(DataPoints);
    x = ones(n ,m);
    x(:,1)=DataPoints(1,:)';
    y = DataPoints(2,:)';
    model = pinv(x)*y;
end

function plotMyModelAndData(dp, model);
    scatter(dp(1,:), dp(2,:), '*r');
    minXV = min(dp(1,:))-1;
    maxXV = max(dp(1,:))+1;
    xv = minXV:0.01:maxXV;
    yv = model(1)*xv + model(2);
    hold on;
    scatter(xv, yv, '.b');
end