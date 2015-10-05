%% Performance Tests FOR DGSM(DBSM) AND AS (PISTON AND OTL CIRCUIT FUNCTION) 
% DGSM and ASSA Performance tests for PISTON AND OTL CIRCUIT FUNCTIONS
% Authors: Paul Diaz, Paul Constantine
% Date: August 16 2015
% This script is designed to compute the relative error and standard
% deviation error of three sensitivity metrics for the piston and otlcircuit
% function. For more information on the functions visit:
% http://www.sfu.ca/~ssurjano/
% The three metrics are the activity score (n=1), the derivative based
% sensitivity metric, and the total sensitivity index.
% Here we take M = [10,50,100,500,1000,5000,10000].
% email: pdiaz@mines.edu 
close all; clear all; clear; clc;

%% PISTON Total Sensitivity Index
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
sobol_rel_err = zeros(m,length(Nsamples),Ntrials);
sobol_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [sobol_rel_err(:,:,i), sobol_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 1);
    fprintf('Piston, Sobol: %6.4f min\n',toc/60);
end
save('piston_sobol_err'); %Saves the numerical output in a .mat file for figure printing
%% Piston Derivative Based Sensitivity metric
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
dgsm_rel_err = zeros(m,length(Nsamples),Ntrials);
dgsm_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [dgsm_rel_err(:,:,i), dgsm_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 2);
    fprintf('Piston, DGSM: %6.4f min\n',toc/60);
end
save('piston_dgsm_err');
%% Piston Derivative Based Sensitivity metric (Bootstrap)
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
dgsm_rel_err = zeros(m,length(Nsamples),Ntrials);
dgsm_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [dgsm_rel_err(:,:,i), dgsm_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 4);
    fprintf('Piston, DGSM: %6.4f min\n',toc/60);
end
save('piston_bs_dgsm_err');

%% Piston Activity Score (n=1)
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
as_rel_err = zeros(m,length(Nsamples),Ntrials);
as_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [as_rel_err(:,:,i), as_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 3);
    fprintf('Piston, AS: %6.4f min\n',toc/60);
end
save('piston_AS_err');
%% PISTON Regression Coefficients
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
reg_rel_err = zeros(m,length(Nsamples),Ntrials);
reg_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [reg_rel_err(:,:,i), reg_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 5);
    fprintf('Piston, Regression: %6.4f min\n',toc/60);
end
save('piston_reg_err'); %Saves the numerical output in a .mat file for figure printing
%% Piston First Eigenvector
close all; clear all; clear; clc;
fun = @piston;
dfun = @dpiston;
m = 7; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
w1_rel_err = zeros(m,length(Nsamples),Ntrials);
w1_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [w1_rel_err(:,:,i), w1_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 6);
    fprintf('Piston circuit, First Eigenvector: %6.4f min\n',toc/60);
end
save('piston_w1_err'); %Saves the numerical output in a .mat file for figure printing


%% OTL CIRCUIT Total Sensitivity Index
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000];
Ntrials = 10;
rand('twister',76599);
sobol_rel_err = zeros(m,length(Nsamples),Ntrials);
sobol_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [sobol_rel_err(:,:,i), sobol_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 1);
    fprintf('OTL, Sobol: %6.4f min\n',toc/60);
end
save('otl_sobol_err');
%% OTL CIRCUIT Derivative Based Sensitivity Metric
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000];
Ntrials = 10;
rand('twister',76599);
dgsm_rel_err = zeros(m,length(Nsamples),Ntrials);
dgsm_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [dgsm_rel_err(:,:,i), dgsm_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 2);
    fprintf('OTL, DGSM: %6.4f min\n',toc/60);
end
save('otl_dgsm_err');
%% OTL CIRCUIT Derivative Based Sensitivity Metric (Bootstrap)
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000];
Ntrials = 10;
rand('twister',76599);
dgsm_rel_err = zeros(m,length(Nsamples),Ntrials);
dgsm_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [dgsm_rel_err(:,:,i), dgsm_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 4);
    fprintf('OTL, DGSM: %6.4f min\n',toc/60);
end
save('otl_bs_dgsm_err');


%% OTL CIRCUIT Activity Score (n=1)
close all; clear all; clear; clc;
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
as_rel_err = zeros(m,length(Nsamples),Ntrials);
as_std_err = zeros(m,length(Nsamples),Ntrials);
for i =1:Ntrials
    tic
    [as_rel_err(:,:,i), as_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 3);
    fprintf('OTL, AS: %6.4f min\n',toc/60);
end
save('otl_AS_err');
%% OTL Regression Coefficients
close all; clear all; clear; clc;
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
reg_rel_err = zeros(m,length(Nsamples),Ntrials);
reg_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [reg_rel_err(:,:,i), reg_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 5);
    fprintf('OTL circuit, Regression: %6.4f min\n',toc/60);
end
save('otl_reg_err'); %Saves the numerical output in a .mat file for figure printing

%% OTL First Eigenvector
close all; clear all; clear; clc;
fun = @otlcircuit;
dfun = @dotlcircuit;
m = 6; %Number of input variables 
Nsamples = [10, 50, 100, 500, 1000,2500,5000,10000]; % # of Monte Carlo sampling points
Ntrials = 10; % Number of trials for averaging
rand('twister',76599); % seed the random number generator
w1_rel_err = zeros(m,length(Nsamples),Ntrials);
w1_std_err = zeros(m,length(Nsamples),Ntrials);
for i=1:Ntrials
    tic
    [w1_rel_err(:,:,i), w1_std_err(:,:,i)] = sensitivity_metric_errors(fun, dfun, m, Nsamples, 6);
    fprintf('OTL circuit, First Eigenvector: %6.4f min\n',toc/60);
end
save('otl_w1_err'); %Saves the numerical output in a .mat file for figure printing
