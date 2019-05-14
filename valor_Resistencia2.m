function resistencia = valor_Resistencia2(angle)
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
    
    resistencia = 9.07- 0.601*angle + 0.0795*(angle^2)-2.7*(10^-3)*(angle^3)+3.06*(10^-5)*(angle^4);

end