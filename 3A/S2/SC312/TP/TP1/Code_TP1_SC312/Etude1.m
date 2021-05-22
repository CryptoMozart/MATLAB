close all;
clear all;

A = 1;
lambda = 1;

%Tableau contenant l'indice de refraction pour chaque milieu, 
%(on aura n-1interface, n etant la longueur du tableau) 
nTab = [1 3 2];

%Theta : l'angle d'incidence de l'onde sur la premiere interface
Theta = 0;

%
%Question 6)
%
L2_T = linspace(lambda/20, lambda*2, 1000);

A3_result = [];
B1_result = [];

for L2 = L2_T
    
    LTab = [0 L2 0];
    
    [A3, B1] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
    
    A3_result = [A3_result abs(A3)];
    B1_result = [B1_result abs(B1)];
end

figure; hold on;
plot(L2_T, A3_result);
plot(L2_T, B1_result);
legend('|A3|', '|B1|');
ylabel('Amplitudes');
xlabel('Thickness of the 2nd medium (lambda relative)');
title('(Q.6)Test with 3 medium and thickness evolution on the second medium (TE)');

%
%Question 7)
%
L2 = lambda/4;
LTab = [0 L2 0];

Theta_T = linspace(0, pi/2, 1000);

A3_TE_result = [];
B1_TE_result = [];

A3_TM_result = [];
B1_TM_result = [];

for Theta = Theta_T
    
    [A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
    
    A3_TE_result = [A3_TE_result abs(A3_TE)];
    B1_TE_result = [B1_TE_result abs(B1_TE)];
    
    [A3_TM, B1_TM] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TM');
    
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
title('(Q.7)Test with 3 medium and theta evolution (TE)');

figure; hold on;
plot(Theta_deg_T, A3_TM_result);
plot(Theta_deg_T, B1_TM_result);
legend('|A3_{TM}|', '|B1_{TM}|');
ylabel('Amplitudes');
xlabel('Theta(°)');
title('(Q.7)Test with 3 medium and theta evolution (TM)');

%
%Question 8)
%
A = 1;
lambda = 1;

%Tableau contenant l'indice de refration pour chaque milieu, 
%(on aura n-1interface, n etant la longueur du tableau) 
nTab = [1 sqrt(2) 2];

%Theta : l'angle d'incidence de l'onde sur la premiere interface
Theta = 0;

L2_T = linspace(lambda/20, lambda*2, 1000);

A3_result = [];
B1_result = [];

for L2 = L2_T
    
    LTab = [0 L2 0];
    
    [A3, B1] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
    
    A3_result = [A3_result abs(A3)];
    B1_result = [B1_result abs(B1)];
end

figure; hold on;
plot(L2_T, A3_result);
plot(L2_T, B1_result);
legend('|A3|', '|B1|');
ylabel('Amplitudes');
xlabel('Thickness of the 2nd medium (lambda relative)');
title('(Q.8)Test with 3 medium with thickness evolution on the second medium (n2 = sqrt(n1*n3))(TE)');


%
%Question 9)
%
clear all;
A = 1;
lambda = 1;

%Tableau contenant l'indice de refraction pour chaque milieu, 
%(on aura n-1 interface, n etant la longueur du tableau) 
nTab = [1 sqrt(2) 2];

L2 = 3*lambda/(nTab(2)*8);
LTab = [0 L2 0];

Theta_T = linspace(0, pi/2, 1000);

A3_TE_result = [];
B1_TE_result = [];

A3_TM_result = [];
B1_TM_result = [];

for Theta = Theta_T
    
    [A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
    
    A3_TE_result = [A3_TE_result abs(A3_TE)];
    B1_TE_result = [B1_TE_result abs(B1_TE)];
   
    [A3_TM, B1_TM] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TM');
    
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
title('(Q.9)Test with 3 medium, 2d medium thickness of 3*lambda/8, theta evolution (TE)');

figure; hold on;
plot(Theta_deg_T, A3_TM_result);
plot(Theta_deg_T, B1_TM_result);
legend('|A3_{TM}|', '|B1_{TM}|');
ylabel('Amplitudes');
xlabel('Theta(°)');
title('(Q.9)Test with 3 medium, 2d medium thickness of 3*lambda/8, theta evolution (TM)');

