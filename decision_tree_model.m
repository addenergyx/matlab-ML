data = readtable('.\label_encoded_data.csv');

% Data Summary
summary(data)

% data = data(1:5,:)

% Decision tree Model
model = fitctree(data, 'Risk');

% Model Properties Summary
model

model.Prior
model.ClassNames

% Train and Test sets
cv = cvpartition(model.NumObservations, 'HoldOut', 0.2);

cross_validation_model = crossval(model, 'cvpartition', cv);

% Predictions for test data
preds = predict(cross_validation_model.Trained{1}, data(test(cv), 1:end-1));

% Classifier does fairly well, % accuracy
matrix = confusionmat(cross_validation_model.Y(test(cv)), preds);

% View decision tree rules
view(cross_validation_model.Trained{1});

% Graph of decision tree
view(cross_validation_model.Trained{1}, 'Mode', 'Graph');

matrix

% firstparam = [1, 2, 3.3, 3.7, 8, 21];  %list of places to search for first parameter
% secondparam = linspace(1,20,20);        %list of places to search for second parameter
% [F,S] = ndgrid(firstparam, secondparam);






















