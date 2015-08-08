%Plots the relative error and standard deviation error figures for three 
%different sensitivity analysis methods. Note this script first requires the .mat
%output files from SA_numerical_tests_pc.m ; each figure is saved to the
%working file directory as a .pdf file.
close all;clear all; clear; clc;
load('piston_sobol_err')
figure();
loglog(Nsamples, mean(sobol_rel_err,3),'o-','LineWidth',2);
axis square; grid on;
h = xlabel('M');
f = ylabel('Relative Error');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-4 1e6]);

print('err_tsi_piston','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(sobol_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-10 1e-1]);
print('std_err_tsi_piston','-dpdf','-r300');
close;
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
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-4 1e8]);
print('err_tsi_otl','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(sobol_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-11 1e1]);
print('std_err_tsi_otl','-dpdf','-r300');
close;

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
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-4 1e6]);
print('err_dbsm_piston','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-10 1e-1]);
print('std_err_dbsm_piston','-dpdf','-r300');
close;
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
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-4 1e8]);
print('err_dbsm_otl','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(dgsm_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-11 1e1]);
print('figs/std_err_dbsm_otl','-dpdf','-r300');
close;
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
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-4 1e6]);
print('err_as_piston','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(as_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','7','Location','BestOutside');
ylim([1e-10 1e-1]);
print('std_err_as_piston','-dpdf','-r300');
close;
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
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-4 1e8]);
print('err_as_otl','-dpdf','-r300');
close;

figure();
loglog(Nsamples, mean(as_std_err,3),'o-','LineWidth',2);
axis square; grid on;
h=xlabel('M');
f=ylabel('Standard Deviation');
set(h,'Interpreter','latex', 'FontSize', 12);
set(f,'Interpreter','latex', 'FontSize', 12);
legend('1','2','3','4','5','6','Location','BestOutside');
ylim([1e-11 1e1]);
print('std_err_as_otl','-dpdf','-r300');
close;
