function Stot = sobol_indices_pc(fun, m, n)
% fun is anonymous function
% m is number of input parameters
% n number of points per dimension
% Stot is the total sensitivity index
s = [];
for i=1:m
    s = [s; parameter()];
end

order = n*ones(1,m);
X = pseudospectral(fun, s, order);
V = sum(X.coefficients(2:end).^2);

Stot = zeros(m,1);
for i=1:m
    ind = X.index_set(i,:)>0;
    Stot(i) = sum(X.coefficients(ind).^2);    
end
Stot = Stot/V;