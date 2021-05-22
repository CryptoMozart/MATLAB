close all;
clear all;

%
%Question 14)
%
A = 1;
lambda0 = 633e-9;

nTab = [1, 1.46, 3.9];
LTab = [0, 50e-9,  0];

Theta = 60*(pi/180);

[A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda0, Theta, nTab, LTab, 'TE');
    
[A3_TM, B1_TM] = calcul_onde_reflechie_transmise(A, lambda0, Theta, nTab, LTab, 'TM');
    
Amplitude_reflexion_TE = abs(B1_TE)
Amplitude_reflexion_TM = abs(B1_TM)

phi_TE = angle(B1_TE)
phi_TM = angle(B1_TM)

difference_phi = phi_TM - phi_TE
