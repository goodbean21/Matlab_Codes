function calcularResistencias(angle1, angle2)
    %   Se reciben dos valores de �ngulo en grados donde el primer
    %   parametro es la resistencia a�rtica y el segundo parametro es
    %   referente a la resistencia sist�mica. Resultante de la
    %   caracterizaci�n. La funci�n despliega el valor de ambas
    %   resistencias dado dos �ngulos.
    %
    %   :param angle1: �ngulo de la perilla que simula la resistencia
    %   a�rtica
    %       :angle double: Es un valor double del �ngulo a evaluar
    %   
    %   :param angle2: �ngulo de la perilla que simula la resistencia
    %   sist�mica
    %       :angle double: Es un valor double del �ngulo a evaluar
    
    res(1) = valor_Resistencia1(angle1);
    res(2) = valor_Resistencia2(angle2);
    
    disp(res);
    
end