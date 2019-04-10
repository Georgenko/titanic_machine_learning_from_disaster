%prepare working plot
clear;close all;clc;

%loading data
data_train=load('data_train');
data_test=load('data_test');

%initializing
X_train=data_train(:,[1,2,3]);
X_test=data_test(:,[1,2,3]);
y_train=data_train(:,4);
%
[m_train,n]=size(X_train);
[m_test]=size(X_test,1);
%
X_train=[ones(m_train,1) X_train];
X_test=[ones(m_test,1) X_test];
%
initial_theta=zeros(n+1,1);
[initial_cost]=costFunction(initial_theta,X_train,y_train);

%training
options=optimset('GradObj','on','MaxIter',400);
[theta,cost]=fminunc(@(t)(costFunction(t,X_train,y_train)),initial_theta,options);

%testing
y_test=predict(theta,X_test);
passenger_id=data_test(:,4);
submit_predictions=[passenger_id y_test];

%export results
save('submit_predictions.csv','submit_predictions');