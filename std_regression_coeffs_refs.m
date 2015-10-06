function beta = std_regression_coeffs_refs(fun,m,NN)

s = [];
for i=1:m, s=[s; parameter()]; end
order = NN*ones(1,m);
P = pseudospectral(fun,s,order);
w = fliplr(P.coefficients(2:m+1))';
sigma = norm(P.coefficients(2:end));
beta = w/sigma;

