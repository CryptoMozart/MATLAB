close all;
clear all;

%
%Question 13)
%
A = 1;
lambda0 = 12.236e-3;

nTab = [1, sqrt(2.3), 1, sqrt(2.3), 1];
LTab = [0, 13e-6, 48e-6, 13e-6, 0];

Theta_T = linspace(0, pi/2, 1000);

A3_TE_result = [];
B1_TE_result = [];

A3_TM_result = [];
B1_TM_result = [];

for Theta = Theta_T
    
    [A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda0, Theta, nTab, LTab, 'TE');
    
    A3_TE_result = [A3_TE_result abs(A3_TE)];
    B1_TE_result = [B1_TE_result abs(B1_TE)];
    
    [A3_TM, B1_TM] = calcul_onde_reflechie_transmise(A, lambda0, Theta, nTab, LTab, 'TM');
    
    A3_TM_result = [A3_TM_result abs(A3_TM)];
    B1_TM_result = [B1_TM_result abs(B1_TM)];
end

Theta_deg_T = Theta_T.*(180/pi);

figure; hold on;
plot(Theta_deg_T, A3_TE_result);
plot(Theta_deg_T, B1_TE_result);
legend('|A3_{TE}|', '|B1_{TE}|');
ylabel('Amplitudes');
xlabel('Theta(°)');
title('(Q.13)Theta variation (TE)');

figure; hold on;
plot(Theta_deg_T, A3_TM_result);
plot(Theta_deg_T, B1_TM_result);
legend('|A3_{TM}|', '|B1_{TM}|');
ylabel('Amplitudes');
xlabel('Theta(°)');
title('(Q.13)Theta variation (TM)');