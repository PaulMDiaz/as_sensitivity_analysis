%%
close all; clear all;
% %
checking derivatives with first-order finite differences
h = 1e-6;

piston
m = 7;
for k = 1:20
    x0 = 2*rand(1,m)-1;
    f0 = piston(x0);
    df = dpiston(x0);
    df_fd = zeros(m,1);
    for i=1:m
        e = zeros(1,m); e(i) = 1;
        df_fd(i) = (piston(x0+h*e) - f0)/h;
    end
    fprintf('PISTON: Norm of fd error: %8.6e\n',norm(df-df_fd));
end

circuit
m = 6;
for k = 1:20
    x0 = 2*rand(1,m)-1;
    f0 = otlcircuit(x0);
    df = dotlcircuit(x0);
    df_fd = zeros(m,1);
    for i=1:m
        e = zeros(1,m); e(i) = 1;
        df_fd(i) = (otlcircuit(x0+h*e) - f0)/h;
    end
    fprintf('CIRCUIT: Norm of fd error: %8.6e\n',norm(df-df_fd));
end

%%
% MC average derivative
close all; 

m = 7;
load('piston_MC_rand_data');
M = 1000;
X = xstar;
G = zeros(m,M);
F = zeros(1,M);
for i=1:M
    G(:,i) = dpiston(X(i,:));
    F(i) = piston(X(i,:));
end
[W,Sig,~] = svd(G,'econ');
evals = (1/M)*diag(Sig).^2;

% elementary effects
fun = @(x) piston(x);
levels = 3:30; nlevels = length(levels);
mu = zeros(m,nlevels);
mu_star = zeros(m,nlevels);
sigma = zeros(m,nlevels);
for i = 1:nlevels
    
    [mu(:,i), mu_star(:,i), sigma(:,i)] = ...
        elementary_effects(fun,m,M,levels(i));
    
end
save('piston_EE_AS_output');

%%
load('piston_AS_output');
plot(M,W1,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','7','Location','BestOutside');
h = ylabel('$\mathbf{w}_1$');
f = xlabel(sprintf('M = %0.3g,%0.3g,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/as_evecs_piston','-dpdf','-r300');
close;


%%
load('piston_EE_AS_output');
figure;
plot(X*W(:,1),F,'bo','MarkerFaceColor','r');
axis square; grid on;
xlabel('active var'); ylabel('piston');
print('figs/active_var_piston','-dpdf','-r300');
close;

%%
load('piston_EE_AS_output');
figure;
plot(levels,mu,'o-','linewidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','7','location','bestoutside');
xlim([3,30]);
h = ylabel('$\mu_i$'); f = xlabel('level $p=3,4,\ldots,30$');
set(h,'interpreter','latex', 'fontsize', 14);
set(f,'interpreter','latex', 'fontsize', 14);
print('figs/mu_piston','-dpdf','-r300');
close;
%%
load('piston_DGSM_output')
figure;
plot(M,avg_partial,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','7','Location','BestOutside');
h = ylabel('$\bar{M}_i$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/avg_partial_piston','-dpdf','-r300');
close;
%%
load('piston_EE_AS_output');
figure;
plot(levels,mu_star,'o-','LineWidth',2);
axis square; grid on;
xlabel('level'); 
legend('1','2','3','4','5','6','7','Location','BestOutside');
xlim([3,30]);
h = ylabel('$\mu_i^*$'); f = xlabel('level $p=3,4,\ldots,30$');
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
print('figs/mustar_piston','-dpdf','-r300');
close;

%%
close all; clear all; clear; clc;
load('piston_AS_output')
out = zeros(m,length(M));
for i = 1:length(M)
    out(:,i) = W1(:,i).^2*evals(1,i);
end
plot(M,out,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','7','Location','BestOutside');
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
h = ylabel('$\mathbf{\xi}$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
print('figs/act_score_piston','-dpdf','-r300');
close;
%%
close all; clear all; clear; clc;
load('piston_AS_output')
plot(M,evals,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','7','Location','BestOutside');
h = ylabel('$\lambda_i$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/as_evals_piston','-dpdf','-r300');
close;
%%
% MC average derivative
close all; clear all;

m = 6;
M = 1000;
load('otl_MC_rand_data')
X = xstar;
G = zeros(m,M);
F = zeros(1,M);
for i=1:M
    G(:,i) = dotlcircuit(X(i,:));
    F(i) = otlcircuit(X(i,:));
end
[W,Sig,~] = svd(G,'econ');
evals = (1/M)*diag(Sig).^2;

% elementary effects
fun = @(x) otlcircuit(x);
levels = 3:30; nlevels = length(levels);
mu = zeros(m,nlevels);
mu_star = zeros(m,nlevels);
sigma = zeros(m,nlevels);
for i = 1:nlevels
    
    [mu(:,i), mu_star(:,i), sigma(:,i)] = ...
        elementary_effects(fun,m,M,levels(i));
    
end
save('otl_EE_AS_output');

%%
load('otl_EE_AS_output');
figure;
plot(X*W(:,1),F,'bo','MarkerFaceColor','r');
axis square; grid on;
xlabel('active var'); ylabel('circuit');
print('figs/active_var_otl','-dpdf','-r300');
close;

%%
load('otl_EE_AS_output')
figure;
plot(levels,mu,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','Location','BestOutside');
xlim([3,30]);
h = ylabel('$\mu_i$'); f = xlabel('level $p=3,4,\ldots,30$');
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
print('figs/mu_otl','-dpdf','-r300');
close;
%%
load('otl_EE_AS_output')
figure;
plot(levels,mu_star,'o-','LineWidth',2);
axis square; grid on;
xlabel('level'); ylabel('\mu');
legend('1','2','3','4','5','6','Location','BestOutside');
xlim([3,30]);
h = ylabel('$\mu_i^*$'); f = xlabel('level $p=3,4,\ldots,30$');
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
print('figs/mustar_otl','-dpdf','-r300');
close;

%%
load('otl_AS_output');
plot(M,W1,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','Location','BestOutside');
h = ylabel('$\mathbf{w}_1$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/as_evecs_otl','-dpdf','-r300');
close;
%%
clear;clc;close all;clear all;
load('otl_AS_output')
out = zeros(m,length(M));
for i = 1:length(M)
    out(:,i) = W1(:,i).^2*evals(1,i);
end
plot(M,out,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','Location','BestOutside');
h = ylabel('$\mathbf{\xi}$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/act_score_otl','-dpdf','-r300');
close;
%%
load('otl_AS_output')
plot(M,evals,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','Location','BestOutside');
h = ylabel('$\lambda_i$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/as_evals_otl','-dpdf','-r300');
close;
%%
load('otl_DGSM_output')
figure;
plot(M,avg_partial,'o-','LineWidth',2);
axis square; grid on;
legend('1','2','3','4','5','6','Location','BestOutside');
h = ylabel('$\bar{M}_i$');
f = xlabel(sprintf('M = %.f,%.f,...,%.f',M0,2*Mstep,Mmax));
set(h,'Interpreter','latex', 'FontSize', 14);
set(f,'Interpreter','latex', 'FontSize', 14);
t = title(sprintf('Average CPU Time = %0.3g (s), Average memory used = %0.2f (mb)',avg_cpu_time,avg_memory_used*10^-6));
set(t,'Interpreter','latex', 'FontSize', 10);
print('figs/avg_partial_otl','-dpdf','-r300');
close;


