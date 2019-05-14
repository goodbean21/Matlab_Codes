function resistencia = valor_Resistencia1(angle)
    %   Se recibe un valor de ángulo en grados y obtiene el valor práctico
    %   de la resistencia física. Resultante de la caracterización
    %
    %   :param angle: Ángulo de la perilla
    %       :angle double: Es un valor double del Ángulo a evaluar
    %   
    %   :return resistencia: El valor de resistencia dado un ángulo de
    %       entrada
    %       :resistencia double: Valor de resistencia real de la válvula a
    %           cada ángulo según la caracterización

    resistencia = 15.5 - angle*4.89 + 0.469*(angle^2)-0.0141*(angle^3)+1.31*(10^-4)*(angle^4);
    
end