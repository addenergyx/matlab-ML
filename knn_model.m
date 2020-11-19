data = readtable('.\credit_processed_data.csv');

% Data Summary
summary(data)

% K Nearest Neighbour Model
model = fitcknn(data, 'Risk');

% Model Properties Summary
model

% Train and Test sets
cv = cvpartition(model.NumObservations, 'HoldOut', 0.2);
cross_validation_model = crossval(model, 'cvpartition', cv);

% Predictions for test data
preds = predict(cross_validation_model.Trained{1}, data(test(cv), 1:end-1));

% Classifier does fairly well, 65% accuracy
matrix = confusionmat(cross_validation_model.Y(test(cv)), preds);





