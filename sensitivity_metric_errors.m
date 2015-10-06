function [rel_err, std_err,ref] = sensitivity_metric_errors(fun, dfun, m, Nsamples, metric_case)
% fun is the function
% dfun is the gradient function
% m is number of parameters
% Nsamples is number of samples for each MC estimate
% metric_case tells which metric to study
% Edited by Paul Diaz August 16 2015

NN = 7; % number of quadrature points per dimension for computing reference values

rel_err = zeros(m, length(Nsamples));
std_err = zeros(m, length(Nsamples));

switch metric_case
    case 1 % sobol indices
        Stot_ref = sobol_indices_pc(fun, m, NN);
        ref = Stot_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            [Stot, se] = sobol_indices_mc_pc(fun, m, M);
            
            % error versus quadrature
            rel_err(:,i) = abs(Stot-Stot_ref)./abs(Stot_ref);
            
            % standard error
            std_err(:,i) = se;
            
        end
        
        
    case 2 % dgsm
        nu_ref = dgsm_pc(dfun, m, NN, 2);
        ref = nu_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            
            % compute the dgsm
            X = 2*rand(M,m)-1;
            G2 = zeros(m,M);
            for j=1:M
                G2(:,j) = dfun(X(j,:)).^2;
            end
            nu = mean(G2,2);
            
            % error versus quadrature reference
            rel_err(:,i) = abs(nu-nu_ref)./abs(nu_ref);
            
            % standard error.
            std_err(:,i) = std(G2,0,2)/sqrt(M);
            
        end
        
    case 3 % activity metric
        as_dim = 1;
        as_ref = activity_score_pc(dfun, m, NN, as_dim);
        ref = as_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            
            % compute the activity score
            X = 2*rand(M,m)-1;
            G = zeros(m,M);
            for j=1:M
                G(:,j) = dfun(X(j,:));
            end
            %spectral decomposition
            [W,Sig,~] = svd(G,'econ');
            lambda = (1/M)*diag(Sig).^2;
            as = W(:,1:as_dim).^2*lambda(1:as_dim);
            
            % error versus the quadrature reference
            rel_err(:,i) = abs(as-as_ref)./abs(as_ref);
            
            % bootstrap to estimate standard error
            as_star = zeros(m,100);
            for j=1:100
                ind = randi(M,1,M);
                [Wstar,Sigstar,~] = svd(G(:,ind),'econ');
                lambdastar = (1/M)*diag(Sigstar).^2;
                as_star(:,j) = Wstar(:,1:as_dim).^2*lambdastar(1:as_dim);
            end
            
            % estimate the standard error
            std_err(:,i) = std(as_star,0,2)/sqrt(M);
            
        end 
        
     case 4 % dgsm with bootstrap
        nu_ref = dgsm_pc(dfun, m, NN, 2);
        ref = nu_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            
            % compute the dgsm
            X = 2*rand(M,m)-1;
            G2 = zeros(m,M);
            for j=1:M
                G2(:,j) = dfun(X(j,:)).^2;
            end
            nu = mean(G2,2);
            
            % error versus quadrature reference
            rel_err(:,i) = abs(nu-nu_ref)./abs(nu_ref);
            
            % bootstrap to estimate standard error.
            nu_star = zeros(m,100);
            for j=1:100
                ind = randi(M,1,M);
                nu_star(:,j) = mean(G2(:,ind),2);
            end
            std_err(:,i) = std(nu_star,0,2)/sqrt(M);
        end   
        
     case 5 % Regression Coefficients
  %      bhat_ref = dgsm_pc(dfun, m, NN, 1)*m^(-1/2);
         %omega = dgsm_pc(dfun, m, NN, 1);
  %       bhat_ref = omega*sqrt(sum(omega.^2));       
         bhat_ref = std_regression_coeffs_refs(fun,m,NN);
         ref = bhat_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            
            % compute the regression coefficients
            [beta_hat,se] = std_regression_coeffs_mc(fun,m,M);
            
            % error versus quadrature reference
            rel_err(:,i) = abs(beta_hat-bhat_ref)./abs(bhat_ref);
            
            % standard error.
            std_err(:,i) = se;
            
        end
        
     case 6 % first eigenvector of the 
        w1_ref = first_evec(dfun, m, NN);
        ref = w1_ref;
        for i=1:length(Nsamples)
            M = Nsamples(i);
            
            % compute the activity score
            X = 2*rand(M,m)-1;
            G = zeros(m,M);
            for j=1:M
                G(:,j) = dfun(X(j,:));
            end
            %spectral decomposition
            [W,~,~] = svd(G,'econ');
            if sign(W(1,1)) ~= sign(w1_ref(1))
                w1 = -1*W(:,1);
            else
                w1 = W(:,1);
            end
            % error versus the quadrature reference
            rel_err(:,i) = abs(w1- w1_ref)./abs(w1_ref);
            
            % bootstrap to estimate standard error
            w1_star = zeros(m,100);
            for j=1:100
                ind = randi(M,1,M);
                [Wstar,~,~] = svd(G(:,ind),'econ');
                   
                w1_star(:,j) = Wstar(:,1);
            end
            
            % estimate the standard error
            std_err(:,i) = std(w1_star,0,2)/sqrt(M);
            
        end 
        
        
        
    otherwise 
        error('Unrecognized case.')
end
