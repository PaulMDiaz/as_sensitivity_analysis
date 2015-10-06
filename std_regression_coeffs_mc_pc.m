% Test script for computation of sigma normalized derivatives for a given function
% and a number of monte carlo samples 
% Each of the m input variables is assumed to be within the interval
% [-1,1], sampled uniformly and independently.
function [beta_hat, se] = std_regression_coeffs_mc_pc(fun, m, M)
    
    

    
    data = 2*rand(M,m)-1; %generates a random data matrix of M samples 
    Y = zeros(M,1);

    for i=1:M
        Y(i) = fun(data(i,:)); %generates M model outputs corresponding to the M rows of the data matrix
    end
    
    
    %compute regression coefficients
    A = [ones(M,1) data];
    omega = A\Y; %simple linear regression to solve for the 
    beta_hat = omega(2:m+1)/(sqrt(3)*std(Y));
    
    % bootstrap
    Nboot = 100;
    bstarz = zeros(m,Nboot);
    for i=1:Nboot    
        indz = randi(M,1,M);
        Astar = A(indz,:); Ystar = Y(indz); 
        if rank(Astar)==m+1
            omega = Astar\Ystar;
            bstarz(:,i) = omega(2:m+1)/(sqrt(3)*std(Ystar));
        end
    end
    
    ind = sum(abs(bstarz),1)==0;
    bstarz(:,ind) = [];
    fprintf('%d of %d good least-squares\n',size(bstarz,2),Nboot);
    
    se = std(bstarz,0,2);
    
end 