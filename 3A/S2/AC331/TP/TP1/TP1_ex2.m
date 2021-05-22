clear all;
close all;

%2)
Ts = 0.1;
a_tab = [1.2, 1, 0.8, 0.6];
s = '';
L = cell(4,1);
L1 = cell(4,1);
 
i = 0;
i1 = 0;

figure; hold on;
for a = a_tab
    i1 = i1+1;
    syms k ;
    h = exp(-a*k);
    hz = ztrans(h);
    [num,den] = numden(hz);
    s0 = sprintf('a = %1.1f',a);
    L1{i1} = strcat(s,s0);
    H = tf(sym2poly(num),sym2poly(den),Ts);
    pzmap(H)
end
legend(L1)

figure; hold on;
for a = a_tab
    i = i+1;
    syms k ;
    h = exp(-a*k);
    hz = ztrans(h);
    [num,den] = numden(hz);
    s0 = sprintf('a = %1.1f',a);
    L{i} = strcat(s,s0);
    H = tf(sym2poly(num),sym2poly(den),Ts);
    step(H)
end
legend(L)

%3)
% N = [1.2 0.8 0.4 -0.4];
% figure; hold on;
% s = '';
% L = cell(4,1);
% i = 0;
% for n1 = N
%     i = i+1;
%     k = linspace(0,10,100);
%     y = @(k,z1,x)((z1.^(k-1)).*(z1-x));
%     stem(k,y(k,0.8,n1));
%     s0 = sprintf('n1 = %1.1f ',n1);
%     L{i} = strcat(s,s0);
% end
% legend(L)



%4)
% Z1 = [1+0.6*j 0.8+0.6*j 0.6+0.6*j];
% s = '';
% L = cell(3,1);
% L1 = cell(3,1);
% 
% i = 0;
% i1 = 0;
% 
% figure; hold on;
% for z1 = Z1
%     i1 = i1+1;
%     z2 = conj(z1);
%     k = linspace(0,10,100);
%     y = @(k,z1,z2)((z1.^k + z2.^k)/2);
%     stem(k,y(k,z1,z2));
%     s0 = sprintf('z1 = %s z2 = %s ',num2str(z1),num2str(z2));
%     L1{i1} = strcat(s,s0);
% end
% legend(L1)
% 
% figure; hold on;
% for z1 = Z1
%     i = i+1;
%     z2 = conj(z1);
%     NUM = [1 -real(z1) 0];
%     DEN = [1 -(z1+z2) z1*z2];
%     H = tf(NUM,DEN);
%     pzmap(H);
%     s0 = sprintf('z1 = %s z2 = %s ',num2str(z1),num2str(z2));
%     L{i} = strcat(s,s0);
% end
% legend(L)


%5)
% Te = 0.5;
%  
% Hnum = [8];
% Hden = [4 1];
%  
% Hp = tf(Hnum, Hden);
% Hzboz = c2d(Hp, Te, 'zoh')

%6)

% Hnum = [0.1 0.11];
% Hden = [1 -1.5 0.56];
%  
% Hz = tf(Hnum, Hden, -1)
% Gain_statique = dcgain(Hz)
% Poles = pole(Hz)
% Zeros = tzero(Hz)

%7)
% NUM = [1];
% DEN = [1 -1.1 0.3];
% sys = tf(NUM,DEN)
% figure;
% step(sys)
% legend('H')


