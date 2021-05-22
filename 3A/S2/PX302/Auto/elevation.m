close all; 
clear all;
clc;
 
Mgl = 0.0383;
a1 = 0.105;
b1 = 0.00936;
psi = deg2rad(-20);
beta_psi = 0.0018;
I_psi = 0.00437;
T1 = 0.6;
Beta_phy = 0.00869;
I_phy= 0.00414;
y1e = psi/pi;
MglTg = 0.0383;
Uld1 = (-b1+sqrt(b1^2+4*a1*Mgl*cos(psi)))/(2*a1);

%Q.1.C

A = [0 1 0; (Mgl*sin(psi))/I_psi -beta_psi/I_psi (2*a1*Uld1+b1)/I_psi ; 0 0 -1/T1];
B = [0;0;1/T1];
C = [1/pi 0 0];
D = [0];

%Q.1.d

%stability
poles = eig(A);

%controlabiliy
Control = rank(ctrb(A,B));

%le système est stable car la partie réelle est strictement négative

%on a bien control = rang(X) = 3 -> le système est totalement controlable

%observability
Obser = rank(obsv(A,C));

%on a bien Obser = 3 -> le système est totalement observable

%Q.1.e
Ts = 0.1;
[NUM DEN] = ss2tf(A,B,C,D);
T = tf(NUM,DEN);
Td_BOZ = c2d(T,Ts,'zoh');
Td_Tustin = c2d(T,Ts,'Tustin');

%Q.1.f

%  figure;
%  bode(T,'b',Td_BOZ,'r--',Td_Tustin,'g--')
%  title("Transfert function of linear system (continuous-time and the discretized time)");
%  legend("T continus","T discret with BOZ","T discret with Tustin");

M_continue = allmargin(T);
M_boz = allmargin(Td_BOZ);
M_tustin = allmargin(Td_Tustin);


S = 1/(1+T);
Mmod = norm(1/S,'inf');


%Q.1.g
%voir simulink

%%%
%%%Partie 2
%%%

%Q.2.b
%on fait le pid en discret
option = pidtuneOptions('DesignFocus', 'disturbance-rejection', 'PhaseMargin', 60);
[C,Info] = pidtune(Td_BOZ,'PID',option);

TBF_PID = C*Td_BOZ/(1+C*Td_BOZ);
TBO_PID = C*Td_BOZ;
S = 1/1+TBO_PID;

%bode du Correcteur
figure;
bode(C);
title("Bode du Correcteur PID");
legend("C");

%bode du PID en boucle ouverte 
figure;
bode(TBO_PID,'g')
title("TBO_PID en discret avec BOZ en boucle ouverte");
legend("TBO_pid");

allmargin(TBO_PID)
Mmodule = norm(1/S,'inf')

%bode du PID en boucle fermée
figure;
bode(TBF_PID,'y')
title("TBF_PID en discret avec BOZ en boucle fermée");
legend("TBF_pid");

%bode de la fonction de sensibilité
figure;
bode(S,'r')
title("Fonction de sensibilité S du PID en discret");
legend("TBF_pid");


