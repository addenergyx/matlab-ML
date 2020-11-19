
% Covariance and Decision Trees

load hospital

% a. Calculate the covariance between Weight and Blood pressure 

hospital.SysPressure = hospital.BloodPressure(:,1);

hospital.DiaPressure = hospital.BloodPressure(:,2);

data=[hospital.Weight, hospital.SysPressure, hospital.DiaPressure];

cov(data)

%Method 2:

data=[hospital.Weight, hospital.BloodPressure];

cov(data)

% b. Calculate the correlation coefficient between Age and Blood pressure

data = [hospital.Age, hospital.BloodPressure];

corrcoef(data)

% Task 2: Apply the Matlab functions fitctree and predict to the fisheriris.mat dataset.

load fisheriris

ctree = fitctree(meas,species); % create classification tree

view(ctree); % text description

view(ctree,'mode','graph'); % graphic description

Ynew = predict(ctree, mean(meas)); % find the predicted classification of a point at the mean of the iris data.

cvmodel = crossval(ctree); % Cross validate

L = kfoldLoss(cvmodel); % Loss


% Cross validation Decision tree

% c = cvpartition(n,'KFold',k) returns a cvpartition object c that defines a random nonstratified partition for k-fold cross-validation on n observations. 
% The partition randomly divides the observations into k disjoint subsamples, or folds, each of which has approximately the same number of observations.

% c = cvpartition(n,'Holdout',p) creates a random nonstratified partition for holdout validation on n observations. 
% This partition divides the observations into a training set and a test, or holdout, set.

% load fisheriris
% 
% rng('default') % For reproducibility
% c = cvpartition(species,'KFold',10);
% treeCVModel = fitctree(meas,species,'CVPartition',c); % Partitioned classification tree model by using c
% % view(treeCVModel,'mode','graph') % graphic description
% treeRate = kfoldLoss(treeCVModel) % Compute the misclassification rate of model
% 
% species = categorical(species);
% C = categories(species); % Class names
% numClasses = size(C,1);
% n = countcats(species); % Number of observations in each class
% 
% % hpartition = cvpartition(species,'Holdout',0.3);
% % treeCVModel = fitctree(meas,species,'CVPartition',hpartition);






