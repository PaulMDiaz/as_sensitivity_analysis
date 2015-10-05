function w1 = first_evec(dfun, m, n)
% dfun is anonymous function that returns a gradient
% m is number of input parameters
% n number of points per dimension
% dim is dimension of active subspace
% alpha is the activitiy score 

s = [];
for i=1:m
    s = [s; parameter()];
end

order = n*ones(1,m);
[p,w] = gaussian_quadrature(s, order);
N = size(w,1);
C = zeros(m,m);
for i=1:N
    g = dfun(p(i,:));
    C = C + (g*g')*w(i);
end

% eigenvalues and eigenvectors
[W,Lambda] = eig(C);
[~, ind] = sort(diag(Lambda), 'descend');
W = W(:,ind);

% compute the first eigenvector
w1 = W(:,1);
