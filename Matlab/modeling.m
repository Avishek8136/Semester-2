% Load Fisher Iris Data
load fisheriris;
X = meas;           % Feature matrix
Y = species;        % Target classes

% Divide into training (70%) and test (30%) sets
rng('default');     % Set random seed for reproducibility
trainPercentage = 0.7;
numSamples = size(X, 1);
numTrainSamples = round(trainPercentage * numSamples);

indices = randperm(numSamples);
trainIndices = indices(1:numTrainSamples);
testIndices = indices(numTrainSamples+1:end);

X_train = X(trainIndices, :);
Y_train = Y(trainIndices);
X_test = X(testIndices, :);
Y_test = Y(testIndices);

% Unique classes in the target
unique_classes = unique(Y_train);

% Convert cell array to numerical array
Y_train_numerical = zeros(size(Y_train));
for i = 1:numel(unique_classes)
    Y_train_numerical(strcmp(Y_train, unique_classes{i})) = i;
end

% Convert test data target classes as well
Y_test_numerical = zeros(size(Y_test));
for i = 1:numel(unique_classes)
    Y_test_numerical(strcmp(Y_test, unique_classes{i})) = i;
end

% List of all features
all_features = 1:size(X_train, 2);

% Exclude features that were already selected (feature 1 and feature 3)
selected_features = [1, 3];
remaining_features = setdiff(all_features, selected_features);

% Initialize variables to store best accuracy and feature pairs
best_accuracy_bayes = 0;
best_accuracy_naive = 0;
best_feature_pair_bayes = [];
best_feature_pair_naive = [];

for i = 1:numel(remaining_features)-1
    for j = i+1:numel(remaining_features)
        % Select two features for modeling with Gaussian distribution
        selected_features_current = [selected_features, remaining_features(i), remaining_features(j)];
        X_train_gaussian = X_train(:, selected_features_current);
        X_test_gaussian = X_test(:, selected_features_current);
        
        % Compute mean and standard deviation for each class and feature
        num_classes = numel(unique(Y_train_numerical));
        num_features = numel(selected_features_current);
        class_means = zeros(num_classes, num_features);
        class_stds = zeros(num_classes, num_features);
        
        for c = 1:num_classes
            class_indices = Y_train_numerical == c;
            class_means(c, :) = mean(X_train_gaussian(class_indices, :));
            class_stds(c, :) = std(X_train_gaussian(class_indices, :));
        end
        
        % Bayes classifier using Gaussian distribution
        predicted_labels_bayes = zeros(size(X_test_gaussian, 1), 1);
        for k = 1:size(X_test_gaussian, 1)
            % Calculate likelihoods for each class using Gaussian PDF
            likelihoods = normpdf(X_test_gaussian(k, :), class_means, class_stds);
            
            % Compute posterior probabilities
            posteriors = prod(likelihoods, 2);
            
            % Assign the class with the highest posterior probability
            [~, predicted_labels_bayes(k)] = max(posteriors);
        end
        
        % Compute accuracy for Bayes classifier
        accuracy_bayes = sum(predicted_labels_bayes == Y_test_numerical) / numel(Y_test_numerical);
        
        % Naïve Bayes classifier
        predicted_labels_naive = zeros(size(X_test_gaussian, 1), 1);
        for k = 1:size(X_test_gaussian, 1)
            % Calculate likelihoods for each class using Gaussian PDF with independence assumption
            likelihoods_naive = normpdf(X_test_gaussian(k, :), class_means, class_stds);
            
            % Compute posterior probabilities
            posteriors_naive = prod(likelihoods_naive, 2);
            
            % Assign the class with the highest posterior probability
            [~, predicted_labels_naive(k)] = max(posteriors_naive);
        end
        
        % Compute accuracy for Naïve Bayes classifier
        accuracy_naive = sum(predicted_labels_naive == Y_test_numerical) / numel(Y_test_numerical);
        
        % Check if this combination gives better accuracy for either classifier
        if accuracy_bayes > best_accuracy_bayes
            best_accuracy_bayes = accuracy_bayes;
            best_feature_pair_bayes = selected_features_current;
        end
        
        if accuracy_naive > best_accuracy_naive
            best_accuracy_naive = accuracy_naive;
            best_feature_pair_naive = selected_features_current;
        end
    end
end

fprintf('Best feature pair for Bayes classifier: Features %d and %d\n', best_feature_pair_bayes);
fprintf('Bayes classifier accuracy: %.2f%%\n', best_accuracy_bayes * 100);

fprintf('Best feature pair for Naïve Bayes classifier: Features %d and %d\n', best_feature_pair_naive);
fprintf('Naïve Bayes classifier accuracy: %.2f%%\n', best_accuracy_naive * 100);
