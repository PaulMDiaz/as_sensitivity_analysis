function [Stot, se] = sobol_indices_mc_pc(fun, m, M)
% fun is anonymous function
% m is number of input parameters
% M number of monte carlo points
% Stot is the total sensitivity index
% Se is the standard deviation error 
% following Saltelli's implementation in Global Sensitivity Analysis the
% primer, ISBN: 978-0-470-05997-5

A = 2*rand(M,m)-1;
B = 2*rand(M,m)-1;

yA = zeros(M,1);
yB = zeros(M,1);
for i=1:M
    yA(i) = fun(A(i,:));
    yB(i) = fun(B(i,:));
end

yC = zeros(M,m);
for i=1:m
    Ci = B; Ci(:,i) = A(:,i);
    for j=1:M
        yC(j,i) = fun(Ci(j,:));
    end
end

f0 = mean([yA; yB]);
V = var([yA; yB]);

Stot = zeros(m,1);
se = zeros(m,1);
for i=1:m
    Stot(i) = 1 - (yB'*yC(:,i)/M - f0^2)/V;
    se(i) = std(yA.^2 - yB.*yC(:,i),0)/sqrt(M);
end


