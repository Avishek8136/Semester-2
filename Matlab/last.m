function last()
    DataPoints = + [0 1 2 3 -1 -2 -3 ; 0.25 1.25 3.75 8 1 4 9];
    Theta = findmodel(DataPoints);
    PlotModelAndData(DataPoints,Theta);
end

function Model = findmodel(DataPoints)
    [m,n] = size(DataPoints);
    X = ones(n,3);
    X(:,1) = DataPoints(1,:).^2;
    X(:,2) = DataPoints(1,:);
    Y = DataPoints(2,:).';
    Model = pinv(X) * Y;
end

function PlotModelAndData(DataPoints,Model)
    scatter(DataPoints(1,:),DataPoints(2,:),'*r');
    MinXV = min(DataPoints(1,:)) - 1;
    MaxXV = max(DataPoints(1,:)) + 1;
    XV = MinXV:0.01:MaxXV;
    YV = Model(1)*XV.^2 + Model(2)*XV + Model(3);
    hold on;
    scatter(XV,YV,'.b');
end