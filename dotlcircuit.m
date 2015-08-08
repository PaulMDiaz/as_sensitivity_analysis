function [dVm] = dotlcircuit(xx)
% Author: Paul Diaz 
% Date: 26 May 2015
% gradient function of otlcircuit.m Output is a vector representing the
% partial derivated with respect to the ith input. i = 1,2,...,6
% test functions piston.m and otlecircuit.m . For more information visit 
% http://www.sfu.ca/~ssurjano/
% email: pdiaz@mines.edu 

% Scaling input from [-1,1] hypercube to input value ranges
Rb1  = (xx(1)+1)*0.5*(150-50)+50;
Rb2  = (xx(2)+1)*0.5*(70-25)+25;
Rf   = (xx(3)+1)*0.5*(3-0.5)+0.5;
Rc1  = (xx(4)+1)*0.5*(2.5-1.2)+1.2;
Rc2  = (xx(5)+1)*0.5*(1.2 - 0.25)+0.25;
beta = (xx(6)+1)*0.5*(300-50)+50;
Vb1 = 12*Rb2 / (Rb1+Rb2);


dVm = [ 
        (-12*Rb2*beta*(Rc2+9)*(beta*(Rc2+9)+Rf)^(-1)*(Rb1+Rb2)^(-2)); 
        12*beta*Rb1*(Rc2+9)*((Rb1+Rb2)^2*(beta*(Rc2+9)+Rf))^(-1);  
        beta*(beta*(59.94+(13.32+0.74*Rc2)*Rc2)+Rc1*(95.49+Rc2*(10.61-Vb1)-9*Vb1))*(Rc1*(beta*(Rc2+9)+Rf)^2)^(-1);
        -0.74*beta*(Rc2+9)*Rf*(Rc1^2*(beta*(Rc2+9)+Rf))^(-1); 
        beta*Rf*(-10.61*Rb1*Rc1+1.39*Rb2*Rc1+0.74*Rb1*Rf+0.74*Rb2*Rf)*((Rb1+Rb2)*Rc1*(beta*(Rc2+9)+Rf)^2  )^(-1);
        Rf*((6.66+0.74*Rc2)*Rf+Rc1*(-95.49+9*Vb1+Rc2*(-10.61+Vb1)))*(Rc1*(beta*(Rc2+9)+Rf)^2 )^(-1);
        
        ];

dVm = dVm.*[150-50;70-25;3-.5;2.5-1.2;1.2-.25;300-50]*0.5; %scaling from y \in [-1,1] to x \in [a,b] via chain rule

end