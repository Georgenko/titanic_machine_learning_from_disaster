clear;close all;clc;

data=load('data');
X=data(:,[1,2,3]);
y=data(:,4);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;