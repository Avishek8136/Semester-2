function ridge()
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
    columnNameToRemove = 'ELEV';
    Y = data.(columnNameToRemove);
    data = removevars(data, columnNameToRemove);
    partition = cvpartition(size(data, 1), 'HoldOut', 0.3);
    trainingIndices = training(partition);
    testingIndices = test(partition);
    data_train = table2array(data(trainingIndices, :));
    data_test = table2array(data(testingIndices, :));
    Y_train = Y(trainingIndices);
    Y_test = Y(testingIndices);
    [B, FitInfo] = ridge(Y_train, data_train, 0:0.1:1);
    lambda = FitInfo.lambda(FitInfo.Index1SE);
    coef = B(:, FitInfo.Index1SE + 1);
    Y_pred = data_test * coef + FitInfo.Intercept(FitInfo.Index1SE + 1);
    Lin = sum(Y_pred == Y_test) / numel(Y_test);
    fprintf('Accuracy of Ridge regression on the test set: %.2f\n', sum(Y_pred == Y_test) / numel(Y_test)); 
end
