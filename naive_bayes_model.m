data = readtable('.\credit_processed_data.csv');

% Summary
summary(data)



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















