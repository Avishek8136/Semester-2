function LinearRegression()
    filename = 'weatherHistory.csv';
    data = readtable(filename);
    disp(data.Properties.VariableNames);
    X = data(:, 4);
    y = data(:, 6);
    linearModel = fitlm(X, y);
    disp("Linear Model:")
    disp(linearModel)
end

