clear all;
close all;

%Exercice 1
w0 = 0.5;
m = 0.5;

Te = 0.1; % ou Te = 0.1s

Hnum = [1];
Hden = [1/(w0^2) 2*m/w0 1];

Hp = tf(Hnum, Hden)

%a)
Hzboz = c2d(Hp, Te, 'zoh')

Hztustin = c2d(Hp, Te, 'tustin')
% 
% Pole_Hp = pole(Hp)
% Pole_Hzboz = pole(Hzboz)
% Zero_Hzboz = zero(Hzboz)
% Pole_tustin = pole(Hztustin)
% Zero_tustin = zero(Hztustin)

%b)

% figure;
% pzmap(Hp)
% legend('Hp')
% figure;
% pzmap(Hzboz,'-r',Hztustin,'-g')
% legend('Hzboz','Hztustin')

%c)
figure;
step(Hp);
figure; hold on;
step(Hzboz,'-b',Hztustin,'-r')

Te2 = 1
Hzboz = c2d(Hp, Te2, 'zoh')

Hztustin = c2d(Hp, Te2, 'tustin')

step(Hzboz,'-g',Hztustin,'-y')
legend('Hzboz Te = 0.1','Hztustin Te = 0.1','Hzboz Te = 1','Hztustin Te = 1')



%d)
% figure;
% bode(Hp,Hzboz,'-r',Hztustin,'-g');
% legend('Hp','Hzboz','Hztustin')
%  
% figure;
% nyquist(Hp,Hzboz,'-r',Hztustin,'-g');
% legend('Hp','Hzboz','Hztustin')

%e)
% fsin = 0.47;
% t = linspace(0, 10, 10000);
% e = sin(2*pi*fsin*t);
% 
% figure;
% lsim(Hp,e,t);
% legend('Hp')
% 
% d = 0:Te:10 ;
% ed = sin(2*pi*fsin.*d);
% 
% figure;
% lsim(Hzboz,'-b',Hztustin,'-r',ed,d);
% legend('Hzboz','Hztustin')


