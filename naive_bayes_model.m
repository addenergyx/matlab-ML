data = readtable('.\label_encoded_data.csv');

% Data Summary
summary(data)

% Naive Bayes Model
model = fitcnb(data, 'Risk');

% Model Properties Summary
model

model.DistributionParameters
model.Prior
model.ClassNames

% mean and std of sex in bad category
model.DistributionParameters{1,2}

% Train and Test sets
cv = cvpartition(model.NumObservations, 'HoldOut', 0.2);

cross_validation_model = crossval(model, 'cvpartition', cv);

% Predictions for test data
preds = predict(cross_validation_model.Trained{1}, data(test(cv), 1:end-1));

% Classifier does fairly well, % accuracy
matrix = confusionmat(cross_validation_model.Y(test(cv)), preds);

% Calculating error metrics
NB_cv_TN = matrix(1,1);
NB_cv_FN = matrix(2,1);
NB_cv_FP = matrix(1,2);
NB_cv_TP = matrix(2,2);

NB_cv_TPR_new = NB_cv_TP./(NB_cv_TP+NB_cv_FN);
NB_cv_TNR_new = NB_cv_TN./(NB_cv_TN+NB_cv_FP);
NB_cv_PPV_new = NB_cv_TP./(NB_cv_TP+NB_cv_FP);
NB_cv_NPV_new = NB_cv_TN./(NB_cv_TN+NB_cv_FN);
NB_cv_F1_new = (2*NB_cv_TP)./(2*NB_cv_TP + NB_cv_FP + NB_cv_FN);






































% % Replace missing data with mode
% data.SavingAccounts = categorical(data.SavingAccounts);
% Freq_SavingAccounts = mode(data.SavingAccounts);
% 
% SavingAccounts = fillmissing(data.SavingAccounts,'constant',cellstr(Freq_SavingAccounts));
% data.SavingAccounts = SavingAccounts;
% 
% data.CheckingAccount = categorical(data.CheckingAccount);
% Freq_CheckingAccount = mode(data.CheckingAccount);
% 
% CheckingAccount = fillmissing(data.CheckingAccount,'constant',cellstr(Freq_CheckingAccount));
% data.CheckingAccount = CheckingAccount; 
% 
% % Removing Outliers
% % outliers = isoutlier(data.CreditAmount);
% % data = data(~outliers,:);
% 
% % Feature scalling
% % Chose standardization over normalization as the data contains alot of
% % outliers and some noise
% stand_age = (data.Age - mean(data.Age)) / std(data.Age);
% data.Age = stand_age;
% 
% stand_CreditAmount = (data.CreditAmount - mean(data.CreditAmount)) / std(data.CreditAmount);
% data.CreditAmount = stand_CreditAmount;
% 
% stand_Duration = (data.Duration - mean(data.Duration)) / std(data.Duration);
% data.Duration = stand_Duration;
% 
% % Categorical Data
% Colors = {'own';'free';'rent'};
% Colors = categorical(Colors);
% 
% dummy = dummyvar(Colors);
% 
% array2table(dummy)















