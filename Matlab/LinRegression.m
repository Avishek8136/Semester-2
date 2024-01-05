function LinRegression()
    Datapoints = [-1 -1;-2 -2;-2 -1;-1 2;1 2;2 1; 1 1;2 2];
    Datapoints = Datapoints';
    Datapoints =[ones(1, size(Datapoints, 2)); Datapoints];
    RegMdl = [0;-1]; %y=-X
    W = findRegModel(Datapoints, RegMdl);
    disp(W)
    
    % Calculate MSE
    Data = Datapoints(1:end-1, :);
    predY = Datapoints(end, :);
    n = size(Data, 2);
    y_predicted = W(1) + W(2) * Data(2, :);
    mse = (1/n) * sum((predY - y_predicted).^2);
    disp("MSE: " + mse)
end

function W = findRegModel(DataPts,W)
    xmin = min(DataPts(2, :)) -1;
    xmax =max(DataPts(2, :))+1;
    xrange = xmin:0.01:xmax; alpha = 0.05;
    Data=DataPts(1:end-1, :); predY =DataPts(end, :);
    for i = 1:30
        y=(W(1)+W(2)*xrange);
        clf; plot (DataPts(2, : ) , DataPts(3, : ) ,  'bo'); hold on;
        plot (xrange, y,'-.r'); pause(1);
        hThetax =W'*Data;
        gradJ = mean(repmat((hThetax - predY), size(Data, 1), 1).*Data, 2);
        W = W - alpha*gradJ ; %apply gradient descent
        
        if (max(abs(alpha*gradJ))< 0.01)
            %if gradient is almost zero
            return;
        end
    end
end