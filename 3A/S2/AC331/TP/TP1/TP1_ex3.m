clear all,
close all;

Te = 0.1;
Rt = [1, 1e3];
Ct = [0.1];
Lt = [0.1 1];

L1 = cell(4,1);
s = '';
i = 0;

figure; hold on;
for R = Rt
    for L = Lt
        for zC = Ct
            i = i+1;
            A = [[0, 1/zC];[-1/L, -R/L]];
            B = [0; 1/L];
            C = [1, 0];
            D = 0;
            [NUM,DEN] = ss2tf(A,B,C,D);
            sys = tf(NUM,DEN);
            step(sys)
            
            s0 = sprintf('R=%1.2f, L=%1.2f, C=%1.2f',R,L,C);
            L1{i} = strcat(s,s0);
        end
    end
end
legend(L1)
    
i=0;
figure; hold on;
for R = Rt
    for L = Lt
        for zC = Ct
            i=i+1;
            A = [[0, 1/zC];[-1/L, -R/L]];
            B = [0; 1/L];
            C = [1, 0];
            D = 0;

            [NUM,DEN] = ss2tf(A,B,C,D);
            sys = tf(NUM,DEN);
            sys_d = c2d(sys,Te);
            step(sys_d)
              
            s0 = sprintf('R=%1.2f, L=%1.2f, C=%1.2f',R,L,C);
            L1{i} = strcat(s,s0);
            
        end
    end
end
legend(L1)

% i = 0;
% figure; hold on;
% for R = Rt
%     for L = Lt
%         for zC = Ct
%             i=i+1;
%             A = [[0, 1/zC];[-1/L, -R/L]];
%             B = [0; 1/L];
%             C = [1, 0];
%             D = 0;
% 
%             [NUM,DEN] = ss2tf(A,B,C,D);
% 
%             sys = tf(NUM,DEN);       
%             bode(sys)
%   
%             s0 = sprintf('R=%1.2f, L=%1.2f, C=%1.2f',R,L,C);
%             L1{i} = strcat(s,s0);
%         end
%     end
% end
% legend(L1)
% 
% i=0;
% figure; hold on;
% for R = Rt
%     for L = Lt
%         for zC = Ct
%             i=i+1;
%             A = [[0, 1/zC];[-1/L, -R/L]];
%             B = [0; 1/L];
%             C = [1, 0];
%             D = 0;
% 
%             [NUM,DEN] = ss2tf(A,B,C,D);
%             sys = tf(NUM,DEN);
%             sys_d = c2d(sys,Te);
%             bode(sys_d)
%             
%             s0 = sprintf('R=%1.2f, L=%1.2f, C=%1.2f',R,L,C);
%             L1{i} = strcat(s,s0);
%         end
%     end
% end
% legend(L1)

