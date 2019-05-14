function resistencia = valor_Resistencia1(angle)
    %   Se recibe un valor de �ngulo en grados y obtiene el valor pr�ctico
    %   de la resistencia f�sica. Resultante de la caracterizaci�n
    %
    %   :param angle: �ngulo de la perilla
    %       :angle double: Es un valor double del �ngulo a evaluar
    %   
    %   :return resistencia: El valor de resistencia dado un �ngulo de
    %       entrada
    %       :resistencia double: Valor de resistencia real de la v�lvula a
    %           cada �ngulo seg�n la caracterizaci�n

    resistencia = 15.5 - angle*4.89 + 0.469*(angle^2)-0.0141*(angle^3)+1.31*(10^-4)*(angle^4);
    
end