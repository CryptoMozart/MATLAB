function [An, B1] = calcul_onde_reflechie_transmise(A1, lambda, Theta1, nTab, Ltab, type)
        
    reflex_tot_interne = reflexion_total_interne(Theta1, nTab(1), nTab(2));
    
    if(~reflex_tot_interne)
        
        n = 1;
        theta_n = Theta1;
        theta_nplus1 = calcul_theta_2(nTab(1), nTab(2), theta_n);
        Matrice_M = [0 0; 0 0];
          
        while(~reflex_tot_interne && n < size(nTab,2))
            
            theta_n = theta_nplus1;
            
            if(n == 1)
                
                Matrice_M = matrice_amplitude(nTab(1), nTab(2), Theta1, theta_nplus1, type);
            else
                theta_nplus1 = calcul_theta_2(nTab(n), nTab(n+1), theta_n);
   
                Matrice_M = Matrice_M*calcul_matrice_dephasage(nTab(n), lambda, Ltab(n), theta_n);
                Matrice_M = Matrice_M*matrice_amplitude(nTab(n), nTab(n+1), theta_n, theta_nplus1, type);
            end
            
            n = n+1;
            if(n < size(nTab,2))
                reflex_tot_interne = 0;%reflex_tot_interne = reflexion_total_interne(theta_n, nTab(n), nTab(n+1));
            end
        end
    
        if(~reflex_tot_interne)
            An = A1/Matrice_M(1, 1);
            B1 = Matrice_M(2, 1)*An;
        else
            sprintf('Total reflection on interface between %d and %d', n, n+1)
            Matrice_M = Matrice_M*calcul_matrice_dephasage(nTab(n), lambda, Ltab(n), theta_nplus1);
            An = A1/(Matrice_M(1, 1)+Matrice_M(1, 2));%ici calcul de A' à l'interface avec reflex total interne
            B1 = An*(Matrice_M(2, 1)+Matrice_M(2, 2));
            
            An=0;
        end
    else
        An = 0;
        B1 = A1;
    end
end

function result = reflexion_total_interne(theta, n1, n2)
    if(n1>n2)
        result = (theta>=asin(n2/n1));
    else
        result = 0;
    end
end
    
function mat_phi = calcul_matrice_dephasage(n, lambda, L, theta)
    phi = (2*pi*n*L)/(lambda*cos(theta));
    mat_phi = [exp(-1i*phi) 0 ; 0 exp(1i*phi)];
end

function teta2 = calcul_theta_2(n1, n2, teta1) 
	teta2 = asin(sin(teta1)*n1/n2);
end

function Mat = matrice_amplitude(n1, n2, teta1, teta2, type)

    if(isequal(type,'TE'))
       Mat = matrice_TE(n1, n2, teta1, teta2);
    else
       Mat = matrice_TM(n1, n2, teta1, teta2);
    end
end

function Mat_TM = matrice_TM(n1,n2,teta1,teta2)
t_TM = (2*n1*cos(teta1))/(n2*cos(teta1)+n1*cos(teta2));
r_TM = (n2*cos(teta1)-n1*cos(teta2))/(n2*cos(teta1)+n1*cos(teta2));

Mat_TM = [1/t_TM r_TM/t_TM ; r_TM/t_TM 1/t_TM];

end

function Mat_TE = matrice_TE(n1,n2,teta1,teta2)
t_TE = (2*n1*cos(teta1))/(n1*cos(teta1)+n2*cos(teta2));
r_TE = (n1*cos(teta1)-n2*cos(teta2))/(n1*cos(teta1)+n2*cos(teta2));

Mat_TE = [1/t_TE r_TE/t_TE ; r_TE/t_TE 1/t_TE];
end

