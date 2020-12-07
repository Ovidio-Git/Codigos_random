% Realice un Programa que evalué las pérdidas de propagación para los modelos de propagaciónpropuestos.
% 
% Exteriores: 
% 
% •	Okumura-Hata
% •	Ikegami
% •	Walfisch-Bertoni
% •	Hata COST 231
% •	Walfisch-Ikegami
% 
% 
% Interior:
% 
% •	Modelo de Múltiples Paredes
% •	COST 231 Multiparedes
% •	Modelo UIT-R 8/1 


tipo_propagacion=input("¿Qué tipo de modelos de propagacion desea?\n1->Exteriores 2->Interiores \n-> ");

switch tipo_propagacion
    case 1
     Modelo=input("¿Qué modelo desea implementar?\n1->Okumura-Hata     2->Ikegami\n3->Walfisch-Bertoni 4->Hata COST 231\n5->Walfisch-Ikegami\n->");
     switch Modelo 
         case 1  % Método de Okumura-Hata % 
             fprintf("---------------------Método de Okumura-Hata-------\n");
             frecuencia=input("Ingrese el valor de la frecuencia (MHz): ");
             altura_tx=input("Ingrese el valor de la altura de la antena tx (m): ");
             altura_rx=input("Ingrese el valor de la altura de la antena rx (m): ");
             distancia=input("Ingrese el valor de la Distancia entre las dos antenas (Km): ");
             a=(1.1*log10(frecuencia)-0.7)*altura_rx-(1.56*log10(frecuencia)-0.8);
             lb=69.55+26.26*log10(frecuencia)-13.82*log10(altura_tx)-a+ (44.9-6.55*log10(altura_tx))*log10(distancia);
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("-------------------------------------------------");
             
             
         case 2  % Método de Ikegami % 
             fprintf("-------------------Método de Ikegami------------------\n");
             frecuencia=input("Ingrese el valor de la frecuencia (MHz): ");
             altura_disfraccion=input("Ingrese altura del edificio donde se produce la difracción (m): ");
             altura_antena=input("Ingrese altura antena receptora (m): ");
             ancho_calle=input("Ingrese ancho de la calle(m): ");
             distancia_receptor=input("Ingrese distancia del receptor al  trasmisor (Km): ");
             angulo_incidencia=input("Ingrese ángulo de incidencia: ");
             parametro_dependiente=input("Ingrese el valor del parámetro dependiente : ");
             lb=26.65+(30*log10(frecuencia))+(20*log10(distancia_receptor))-(10*log10(1+(3/parametro_dependiente)))-10*log10(ancho_calle)+(20*log10(altura_disfraccion-altura_antena))+(10*log10(sin(angulo_incidencia*pi/180)));
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
             
         case 3  % Método de Walfisch-Bertoni %
             fprintf("-----------------Método de Walfisch-Bertoni-------\n");
             altura_edificios=input("Ingrese altura Tx de edificios (m): ");
             altura_media=input("Ingrese altura media de edificios (m): ");
             separacio_edificios=input("Ingrese separacion entre edificios (m): ");
             altura_antena=input("Ingrese altura antena movil (m): ");
             distancia=input("Ingrese distancia entre Tx y Rx (Km): ");
             frecuencia=input("Ingrese el valor de la frecuencia (MHz): ");
             op=(separacio_edificios/2)^2 + (altura_media-altura_antena)^2;
             op2=atan(2*(altura_media-altura_antena))/separacio_edificios;
             op3=1-((distancia^2)/(17*altura_edificios));
             a=5*log10(op)-9*log10(separacio_edificios)+20*log10(1.36540093);
             lb=89.55+a+(21*log10(frecuencia))+(38*log10(distancia)) - (18*log10(altura_edificios))-18*log10(op3);
             
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
             
         
         case 4    % Método Hata COST 231 %
             fprintf("----------------Método Hata COST 231---------------\n");
             frecuencia=input("Ingrese el valor de la frecuencia (MHz): ");
             altura_tx=input("Ingrese el valor de la altura de la antena tx (m): ");
             altura_rx=input("Ingrese el valor de la altura de la antena rx (m): ");
             distancia=input("Ingrese el valor de la distancia (Km): ");
             cm=input("ingrese el valor en db segun tipo el ciudad\n0 ciudad tipo medio // 3 grandes metropolis: ");
             a=(3.2*(log10(11.75*altura_rx)^2)) - 4.97;
             lb=46.3+(33.9*log10(frecuencia))-(13.82*log10(altura_tx))- a + (44.9-6.55*log10(altura_tx))*log10(distancia)+cm;
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
             
         case 5   % Método Walfisch-Ikegami %
             fprintf("----------------------Método Walfisch-Ikegami----------------\n");
             w=input("Ingrese el ancho de la calle del receptor (m):");
             frecuencia=input("Ingrese el valor de la frecuencia (MHz):");
             hr=input("ingrese la altura media de edificios (m):");
             hm=input("ingrese la altura antena móvil (m):");
             b=input("Separación entre edificios (m): ");
             hb=input("ingrese la altura del transmisor (m): ");
             distancia=input("Ingrese el valor de la distancia (Km): ");
             angulo_incidencia=input("Ingrese ángulo de incidencia con la dirección de la calle (°): ");
             
             difh=hr-hm;
             difhB=hb-hr;
             lori=4 - (0.114*(angulo_incidencia-55));
             lrts=-16.9-10*log10(w)+10*log10(frecuencia)+20*log10(difh)+lori;
             lbs=-18*log10(1+difhB);
             kf=-4 + 1.5*(frecuencia/925 - 1);  
             lmsd=lbs+18*log10(distancia)+kf*log10(frecuencia)-9*log10(b);
             
             lb=37+lrts+lmsd;        
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
         

             
     end


    case 2 
     Modelo=input("¿Qué modelo desea implementar?\n1->Modelo de Múltiples Paredes 2->COST 231 Multiparedes\n3->Modelo UIT-R 8/1\n->");
     switch Modelo 
         case 1  % MODELO DE MÚLTIPLES PAREDES%
             fprintf("----------------MODELO DE MÚLTIPLES PAREDES----------------\n");
             variacion_potencia=input("Ingrese el indicador de la variación de la potencia con la distancia: ");
             distancia=input("Ingrese el valor de la distancia : ");
             tipos_pisos=input("Ingrese el número pisos: ");
             tipos_paredes=input("Ingrese el número paredes: ");
             lf =input("Ingrese factor de pérdidas del piso : ");
             lw=input("Ingrese factor de pérdidas por  pared : "); 
             numero_pisos=input("Ingrese el número de pisos tipo i atravesados: ");
             numero_paredes=input("Ingrese el número de paredes tipo j atravesadas: ");
             resultad0=0;resultad1=0;
             for i=0:tipos_pisos
                 cnt=1;
                 resultad0=resultad0+(numero_pisos*lf(cnt));
                 cnt=cnt+1;
             end
             for j=0:tipos_paredes
                 cnt=1;
                 resultad1=resultad1+(numero_paredes*lw(cnt));
                 cnt=cnt+1;            
             end
             lb=37+(10*variacion_potencia*log10(distancia)) + resultad0 +resultad1;
             
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
             
         
         case 2  % MODELO COST 231 MULTIPAREDES 
             fprintf("---------------MODELO COST 231 MULTIPAREDES---------------\n");
             Lc=input("Ingrese el factor constante LC: ");
             b=input("Ingrese el factor empírico: ");
             frecuencia=input("Ingrese el valor de la frecuencia: ");
             Distancia=input("ingrse el valor de la distancia entre tx y rx: ");
             tipos_paredes=input("Ingrese el número paredes: ");
             Lw=input("Ingrese factor de pérdidas por pared: ");
             numero_paredes=input("Ingrese el número de paredes tipo j atravesadas: ");
             numero_pisos=input("Ingrese el número de pisos tipo i atravesados: ");
             lf =input("Ingrese factor de pérdidas del piso : ");
             resultad1=0;
             lo = 32.45+(20*log10(frecuencia))+ (20*log10(distancia));
             for j=0:tipos_paredes
                 cnt=1;
                 resultad1=resultad1+(numero_paredes*lw(cnt));
                 cnt+1;
             end
             lb=lo+Lc+resultad1+lf*(numero_pisos^((numero_pisos+2)*b/(numero_pisos+1)));
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
             
         case 3  % MODELO UIT-R 8/1 %
             fprintf("-----------------MODELO UIT-R 8/1----------------\n");
             numero_plantas=input("Ingrese el numero de plantas entre el trasmisor y el receptor: ");
             distancia=input("Ingrese el valor de la distancia entre tansmisor u receptor (m): ");
             Lf=15+4*(numero_plantas-1)
             lb=38+(30*log10(distancia)) + Lf;
             fprintf("--------------------Perdidas----------------------\n\n                  ");
             disp(lb);
             fprintf("\n-------------------------------------------------");
    
     end
end