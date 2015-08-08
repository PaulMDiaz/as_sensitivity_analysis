function nu = dgsm_pc(dfun, m, n, power)
% dfun is anonymous function that returns a gradient
% m is number of input parameters
% n number of points per dimension
% power is 1 or 2
% nu is the mean squared partial derivative 
s = [];
for i=1:m
    s = [s; parameter()];
end

order = n*ones(1,m);
[p,w] = gaussian_quadrature(s, order);
N = size(w,1);

nu = zeros(m,1);
for i=1:N
    nu = nu + dfun(p(i,:)).^power*w(i);
end

