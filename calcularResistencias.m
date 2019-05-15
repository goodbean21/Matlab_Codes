function calcularResistencias(angle1, angle2)
    %   Se reciben dos valores de ángulo en grados donde el primer
    %   parametro es la resistencia aórtica y el segundo parametro es
    %   referente a la resistencia sistémica. Resultante de la
    %   caracterización. La función despliega el valor de ambas
    %   resistencias dado dos ángulos.
    %
    %   :param angle1: Ángulo de la perilla que simula la resistencia
    %   aórtica
    %       :angle double: Es un valor double del Ángulo a evaluar
    %   
    %   :param angle2: Ángulo de la perilla que simula la resistencia
    %   sistémica
    %       :angle double: Es un valor double del Ángulo a evaluar
    
    res(1) = valor_Resistencia1(angle1);
    res(2) = valor_Resistencia2(angle2);
    
    disp(res);
    
end