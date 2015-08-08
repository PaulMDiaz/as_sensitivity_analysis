function [dC] = dpiston(xx)
% Author: Paul Diaz 
% Date: 26 May 2015
% gradient function of piston.m Output is a vector representing the
% partial derivated with respect to the ith input. i = 1,2,...,7
% test functions piston.m and otlecircuit.m . For more information visit 
% http://www.sfu.ca/~ssurjano/
% email: pdiaz@mines.edu 
% scaling input parameters from [-1,1] hypercube to input value ranges
M  = (xx(1)+1)*0.5*(60-30)+30;
S  = (xx(2)+1)*0.5*(0.02-0.005)+0.005;
V0 = (xx(3)+1)*0.5*(0.010-0.002)+0.002;
k  = (xx(4)+1)*0.5*(5000-1000)+1000;
P0 = (xx(5)+1)*0.5*(110000-90000)+90000;
Ta = (xx(6)+1)*0.5*(296-290)+290;
T0 = (xx(7)+1)*0.5*(360-340)+340;


 dC = [ 

% 0.314159E1.*k.*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2) ... \
% .*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+( ... \
% 0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)) ... \
% .^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1) ... \
% .*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+ ... \
% P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2).*(1+4.*k.* ... \
% P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+( ... \
% 4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
% V0).^2).^0.5E0).^(-2)+(-0.15696E3).*k.*M.*P0.*S.^2.*T0.^(-1).*Ta.* ... \
% V0.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^( ... \
% -1).*V0).^2).^(-0.5E0).*(0.1962E2.*M.*S+0.1E1.*P0.*S.^2+(-0.1E1).* ... \
% k.*V0+(-0.1E1).*S.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+ ... \
% (-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2));
%dC/dM
0.314159E1.*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+ ... \
(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.* ... \
M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0) ... \
.*(8.*k.^2.*M.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2)+0.1962E2.*( ... \
0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).*(4.*k.*P0.*T0.^(-1).*Ta.* ... \
V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0)).*(( ... \
-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.* ... \
V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3).*(k+ ... \
4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^( ... \
-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.* ... \
S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2)+(k+4.*k.^2.*P0.*T0.^(-1).* ... \
Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.* ... \
T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
.^0.5E0).^(-2)).^(-1));
%dC/dS
% 0.251327E2.*k.*P0.*Ta.*V0.*((-1).*P0+(-1).*k.*S.^(-2).*V0+0.1E1.*( ... \
% P0+k.*S.^(-2).*V0).*(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).*(4.* ... \
% k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0) ... \
% .^2).^(-0.5E0)).*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.* ... \
% k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0) ... \
% .^2).^0.5E0).^(-3).*(T0+4.*k.*P0.*Ta.*V0.*((-0.1962E2).*M+(-1).* ... \
% P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.* ... \
% S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1).*(M.*(k+4.*k.^2.* ... \
% P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+( ... \
% 4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
% V0).^2).^0.5E0).^(-2)).^(-1)).^0.5E0;
% 0.251327E2.*k.^2.*M.*P0.*T0.^(-1).*Ta.*V0.*((-1).*P0+(-1).*k.*S.^( ... \
% -2).*V0+0.1E1.*(P0+k.*S.^(-2).*V0).*(0.1962E2.*M+P0.*S+(-1).*k.* ... \
% S.^(-1).*V0).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
% .*k.*S.^(-1).*V0).^2).^(-0.5E0)).*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
% S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
% k.*S.^(-1).*V0).^2).^0.5E0).^(-3).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).* ... \
% Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.* ... \
% T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
% .^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.* ... \
% V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1) ... \
% .*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^( ... \
% -2)).^(-2); 


% 0.251327E2.*k.^2.*M.*P0.*T0.^(-1).*Ta.*V0.*((-1).*P0+(-1).*k.*S.^( ... \
% -2).*V0+0.1E1.*(P0+k.*S.^(-2).*V0).*(0.1962E2.*M+P0.*S+(-1).*k.* ... \
% S.^(-1).*V0).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
% .*k.*S.^(-1).*V0).^2).^(-0.5E0)).*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
% S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
% k.*S.^(-1).*V0).^2).^0.5E0).^(-3).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).* ... \
% Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.* ... \
% T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
% .^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.* ... \
% V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1) ... \
% .*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^( ... \
% -2)).^(-2); 

0.251327E2.*k.^2.*M.*P0.*T0.^(-1).*Ta.*V0.*((-1).*P0+(-1).*k.*S.^( ... \
-2).*V0+0.1E1.*(P0+k.*S.^(-2).*V0).*(0.1962E2.*M+P0.*S+(-1).*k.* ... \
S.^(-1).*V0).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
.*k.*S.^(-1).*V0).^2).^(-0.5E0)).*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
k.*S.^(-1).*V0).^2).^0.5E0).^(-3).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).* ... \
Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.* ... \
T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
.^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.* ... \
V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1) ... \
.*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^( ... \
-2)).^(-2);


%dC/dV0
(-0.125664E2).*k.*P0.*Ta.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).* ... \
V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1) ... \
.*V0).^2).^0.5E0).^(-3).*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).* ... \
V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1) ... \
.*V0).^2).^0.5E0+(-2).*k.*S.^(-2).*V0.*(S+T0.^(-1).*((-0.1962E2).* ... \
M.*S.*T0+P0.*S.^2.*((-0.1E1).*T0+0.2E1.*Ta)+0.1E1.*k.*T0.*V0).*( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^(-0.5E0))).*(T0+4.*k.*P0.*Ta.*V0.*((-0.1962E2).*M+(-1).* ... \
P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.* ... \
S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1).*(M.*(k+4.*k.^2.* ... \
P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^0.5E0).^(-2)).^(-1)).^0.5E0;

% (-0.314159E1).*M.*((-8).*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-1).*k.*S.^(-1)+0.5E0.*(4.*k.*P0.*T0.^(-1).*Ta+(-2).*k.*S.^(-1).*(0.1962E2.*M+P0.*S+(-1).*k.* ...
% S.^(-1).*V0)).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0)).*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*...
% k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+4.*k.^2.*P0.*T0.^(-1).*Ta.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^( ...
% -1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+( ...
% -1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.* ...
% P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0) ...
% .^(-2)).^(-2);

%dC/dk
(-0.314159E1).*M.^(-1).*(1+(-8).*k.^2.*P0.*S.^(-2).*T0.^(-1).*Ta.* ... \
V0.^2.*(S+T0.^(-1).*((-0.1962E2).*M.*S.*T0+P0.*S.^2.*((-0.1E1).* ... \
T0+0.2E1.*Ta)+0.1E1.*k.*T0.*V0).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+( ... \
0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0)).*(( ... \
-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.* ... \
V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+8.* ... \
k.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).* ... \
V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1) ... \
.*V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(( ... \
-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.* ... \
V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^( ... \
-1)).^0.15E1;

% 
% (-0.314159E1).*M.*((-8).*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-1).*S+0.5E0.*(4.*k.*T0.^(-1).*Ta.*V0+2.*S.*(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0)).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0)).*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+4.*k.^2.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ...
% V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2);
%dC/dP0
% (-0.125664E2).*k.*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).* ... \
% V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1) ... \
% .*V0).^2).^0.5E0).^(-3).*((-0.1962E2).*M+P0.*S+k.*S.^(-1).*V0+P0.* ... \
% T0.^(-1).*((-0.3924E2).*M.*S.*T0+(-0.2E1).*P0.*S.^2.*T0+k.*( ... \
% 0.2E1.*T0+(-0.4E1).*Ta).*V0).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+( ... \
% 0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0)+(4.*k.*P0.* ... \
% T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
% .^0.5E0).*(T0+4.*k.*P0.*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
% S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
% k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1).*(M.*(k+4.*k.^2.*P0.* ... \
% T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.* ... \
% k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0) ... \
% .^2).^0.5E0).^(-2)).^(-1)).^0.5E0; 
(-0.314159E1).*M.*((-8).*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-1).*S+ ... \
0.5E0.*(4.*k.*T0.^(-1).*Ta.*V0+2.*S.*(0.1962E2.*M+P0.*S+(-1).*k.* ... \
S.^(-1).*V0)).*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
.*k.*S.^(-1).*V0).^2).^(-0.5E0)).*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+4.*k.^2.*T0.^(-1).*Ta.*V0.*(( ... \
-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.* ... \
V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*( ... \
M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+ ... \
k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
.*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.* ... \
k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1) ... \
.*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^( ... \
-1).*V0).^2).^0.5E0).^(-2)).^(-2);





% (-0.314159E1).*M.*((-0.16E2).*k.^3.*P0.^2.*T0.^(-2).*Ta.*V0.^2.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0).*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+4.*k.^2.*P0.*T0.^(-1).*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).* ...
% P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2);
%dC/dTa
% (-0.314159E1).*M.*P0.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).* ... \
% V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1) ... \
% .*V0).^2).^0.5E0).^(-3).*(T0+4.*k.*P0.*Ta.*V0.*((-0.1962E2).*M+( ... \
% -1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.* ... \
% M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2).*(M.*(k+4.* ... \
% k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1) ... \
% .*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^( ... \
% -1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*((-0.16E2).*k.*P0.* ... \
% Ta.*V0.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.* ... \
% S.^(-1).*V0).^2).^(-0.5E0)+4.*T0.*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
% S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
% k.*S.^(-1).*V0).^2).^0.5E0));
(-0.314159E1).*M.*((-0.16E2).*k.^3.*P0.^2.*T0.^(-2).*Ta.*V0.^2.*( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^(-0.5E0).*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.* ... \
k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0) ... \
.^2).^0.5E0).^(-3)+4.*k.^2.*P0.*T0.^(-1).*V0.*((-0.1962E2).*M+(-1) ... \
.*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+ ... \
P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.* ... \
P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1) ... \
.*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.* ... \
T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2) ... \
.^0.5E0).^(-2)).^(-2);

% (-0.314159E1).*M.*(0.16E2.*k.^3.*P0.^2.*T0.^(-3).*Ta.^2.*V0.^2.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^(-0.5E0).*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3)+(-4).*k.^2.*P0.*T0.^(-2).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*(M.*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.* ...
% M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*(0.1962E2.*M+(-1).*P0.*S+(-1).*k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-2);
%dC/dT0
% (-0.314159E1).*k.^2.*M.^(-1).*P0.*T0.^(-3).*Ta.*V0.*((-0.1962E2).* ... \
% M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+( ... \
% 0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-3).*(M.*(k+ ... \
% 4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^( ... \
% -1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.* ... \
% S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^0.15E1.*(0.16E2.*k.*P0.* ... \
% Ta.*V0.*(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.* ... \
% S.^(-1).*V0).^2).^(-0.5E0)+(-4).*T0.*((-0.1962E2).*M+(-1).*P0.*S+ ... \
% k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1) ... \
% .*k.*S.^(-1).*V0).^2).^0.5E0)); 

(-0.314159E1).*M.*(0.16E2.*k.^3.*P0.^2.*T0.^(-3).*Ta.^2.*V0.^2.*( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^(-0.5E0).*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.* ... \
k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0) ... \
.^2).^0.5E0).^(-3)+(-4).*k.^2.*P0.*T0.^(-2).*Ta.*V0.*((-0.1962E2) ... \
.*M+(-1).*P0.*S+k.*S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+( ... \
0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).*(M.*( ... \
k+4.*k.^2.*P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.* ... \
S.^(-1).*V0+(4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).* ... \
k.*S.^(-1).*V0).^2).^0.5E0).^(-2)).^(-1)).^(-0.5E0).*(k+4.*k.^2.* ... \
P0.*T0.^(-1).*Ta.*V0.*((-0.1962E2).*M+(-1).*P0.*S+k.*S.^(-1).*V0+( ... \
4.*k.*P0.*T0.^(-1).*Ta.*V0+(0.1962E2.*M+P0.*S+(-1).*k.*S.^(-1).* ... \
V0).^2).^0.5E0).^(-2)).^(-2);

];

dC = dC.*[30;0.02-.005;0.01-0.002;4000;20000;6;20]*0.5;


end