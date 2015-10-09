% Plots the relative error and standard deviation error figures for three 
% different sensitivity analysis methods. Note this script first requires the .mat
% output files from SA_numerical_tests_pc.m ; uncomment the print statements to save 
% each figure to the working file directory as a .pdf file.
% Author: Paul Diaz
% Date: August 16 2015
close all;clear all; clear; clc;
load('piston_sobol_err')
figure();
loglog(Nsamples, mean(sobol_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h = xlabel('M');
f = ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-3 1e6]);
%print('err_tsi_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_sobol_err')
figure();
loglog(Nsamples, mean(sobol_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-11 1e+1]);
%print('std_err_tsi_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_sobol_err')
figure();
loglog(Nsamples, mean(sobol_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-3 1e8]);
%print('err_tsi_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_sobol_err')
figure();
loglog(Nsamples, mean(sobol_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-11 1e2]);
%print('std_err_tsi_otl','-dpdf','-r300');
%close;

%%
close all;clear all; clear; clc;
load('piston_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-3 1e6]);
%print('err_dbsm_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-11 1e+1]);
%print('std_err_dbsm_piston','-dpdf','-r300');
%close;
%% 
close all;clear all; clear; clc;
load('piston_bs_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-10 1e-1]);
%print('bs_std_err_dbsm_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_reg_err')
figure();
loglog(Nsamples, mean(reg_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-3 1e6]);
%print('err_reg_piston','-dpdf','-r300');
%close;

%%
close all;clear all; clear; clc;
load('piston_reg_err')
figure();
loglog(Nsamples, mean(reg_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-11 1e+1]);
%print('std_err_reg_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_w1_err')
figure();
loglog(Nsamples, mean(w1_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-3 1e6]);
%print('err_w1_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_w1_err')
figure();
loglog(Nsamples, mean(w1_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-11 1e+1]);
%print('std_err_w1_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-3 1e8]);
%print('err_dbsm_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-11 1e2]);
%print('std_err_dbsm_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_bs_dgsm_err')
figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','NorthEast');
ylim([1e-11 1e4]);
%print('bs_std_err_dbsm_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_AS_err')
figure();
loglog(Nsamples, mean(as_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-3 1e6]);
%print('err_as_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('piston_AS_err')
figure();
loglog(Nsamples, mean(as_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','EastOutside');
ylim([1e-11 1e+1]);
%print('std_err_as_piston','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_AS_err')
figure();
loglog(Nsamples, mean(as_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-3 1e8]);
%print('err_as_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_AS_err')
figure();
loglog(Nsamples, mean(as_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-11 1e2]);
%print('std_err_as_otl','-dpdf','-r300');
%close;

%%
close all;clear all; clear; clc;
load('otl_reg_err')
figure();
loglog(Nsamples, mean(reg_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-3 1e8]);
%print('err_reg_otl','-dpdf','-r300');
%close;

%%
close all;clear all; clear; clc;
load('otl_reg_err')
figure();
loglog(Nsamples, mean(reg_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-11 1e2]);
%print('std_err_reg_otl','-dpdf','-r300');
%close;
%%
close all;clear all; clear; clc;
load('otl_w1_err')
figure();
loglog(Nsamples, mean(w1_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-3 1e8]);
%print('err_w1_otl','-dpdf','-r300');
%close;
%%
%close all;clear all; clear; clc;
load('otl_w1_err')
figure();
loglog(Nsamples, mean(w1_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','EastOutside');
ylim([1e-11 1e2]);
%print('std_err_w1_otl','-dpdf','-r300');
%close;
