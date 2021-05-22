close all;
clear all;

%
%Question 10)
%
% A = 1;
% lambda = 1;
% Theta = 0;
% 
% Nb_stack = 50;
% 
% B1_result = [];
% 
% for Nb = 1:Nb_stack
%     
%     nTab = nTAB_2_materials_stack(Nb,1.46,1.7);
%     LTab = LTAB_2_materials_stack(Nb,lambda/4,1.46,1.7);
%     
%     [A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
%     
%     B1_result = [B1_result abs(B1_TE)];
% end
% 
% figure; hold on;
% plot(1:Nb_stack, B1_result);
% legend('|B1_{TE}|');
% ylabel('Amplitudes');
% xlabel('Nombre d empillement');
% title('(Q.10)Reflection en fonction du nombre d empilement');

%
%Question 11)
%
A = 1;
lambda0 = 0.5e-6;
Theta = 0;
Nb_stack = 7;

nTab = nTAB_2_materials_stack(Nb_stack,1.46,1.7);
LTab = LTAB_2_materials_stack(Nb_stack,lambda0/4,1.46,1.7);

B1_result = [];

Tlambda = linspace(0.3e-6, 0.7e-6, 1000);

for lambda = Tlambda
    
    [A3_TE, B1_TE] = calcul_onde_reflechie_transmise(A, lambda, Theta, nTab, LTab, 'TE');
    
    B1_result = [B1_result abs(B1_TE)];
end

figure; hold on;
plot(Tlambda, B1_result);
legend('|B1_{TE}|');
ylabel('Amplitudes');
xlabel('Longueur d onde du signal incident (en m)');
title('(Q.11)Reflection en fonction de la longueur d onde incidente');

%
%Question 12)
%
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
title('(Q.12)Theta variation (TE)');

figure; hold on;
plot(Theta_deg_T, A3_TM_result);
plot(Theta_deg_T, B1_TM_result);
legend('|A3_{TM}|', '|B1_{TM}|');
ylabel('Amplitudes');
xlabel('Theta(°)');
title('(Q.12)Theta variation (TM)');

%
% Functions
%
function nTAB = nTAB_2_materials_stack(nb_couche,n1,n2)
    nTAB = [1];
    for i = 1:nb_couche
        nTAB = [nTAB n1 n2];
    end
    nTAB = [nTAB 1];
end

function LTAB = LTAB_2_materials_stack(nb_couche,L0,n1,n2)
    LTAB = [0];
    for i = 1:nb_couche*2
        if(mod(i, 2) == 0)
            LTAB = [LTAB L0/n2];
        else
            LTAB = [LTAB L0/n1];
        end
    end
    LTAB = [LTAB 0];
end
