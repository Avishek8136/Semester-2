function Reg()
    data = readtable('Weather_Station_Locations.csv');
    Lin = LinReg(data);
    disp(Lin);
end

function Lin = LinReg(data)
    columns_to_encode = {'NAME', 'STATE_COUNTRYID', 'LAT', 'LON'};

    for i = 1:numel(columns_to_encode)
        column = columns_to_encode{i};
        [encoded_values, ~] = grp2idx(data.(column));
        data.(column) = encoded_values;
    end

    columnNameToRemove = 'LAT';
    Y = data.(columnNameToRemove);
    data = removevars(data, columnNameToRemove);

    partition = cvpartition(size(data, 1), 'HoldOut', 0.3);
    trainingIndices = training(partition);
    testingIndices = test(partition);
    data_train = table2array(data(trainingIndices, :));
    data_test = table2array(data(testingIndices, :));
    Y_train = Y(trainingIndices);
    Y_test = Y(testingIndices);

    [B, FitInfo] = lasso(data_train, Y_train, 'CV', 5);
    lambda = FitInfo.Index1SE;
    coef = B(:, lambda);

    Y_pred = data_test * coef + FitInfo.Intercept(lambda);

    % Lin = sum(Y_pred == Y_test) / numel(Y_test);
    % fprintf('Accuracy of LASSO regression on the test set: %.2f\n', sum(Y_pred == Y_test) / numel(Y_test));
    % Accuracy
    mean_y = mean(Y_test);
    ss_total = sum((Y_test - mean_y).^2);
    ss_residual = sum((Y_test - Y_pred).^2);
    r_squared = 1 - (ss_residual / ss_total);
    
    Lin = r_squared*100;
end