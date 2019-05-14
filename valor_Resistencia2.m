function resistencia = valor_Resistencia2(angle)
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
    
    resistencia = 9.07- 0.601*angle + 0.0795*(angle^2)-2.7*(10^-3)*(angle^3)+3.06*(10^-5)*(angle^4);

end