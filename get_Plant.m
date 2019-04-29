function planta = get_Plant(pressure, flow, Ts)
% Esta función tiene como fin obtener la función de transferancia del
% sistema
% :param pressure: 
%    :double array: Recibe la pressión como un arreglo de datos 
% :param flow: 
%    :double array: Recibe el flujoe como un arreglo de datos
% :param Ts: 
%    :double: El valor de tiempo de sampleo
% :return planta:
%   :tf: Regresa una función de transferencia

%%  
    zeros = 1;
    polos = 1;

    [~, n1] = size(pressure);
    if n1 > 1 
        % Esta sentencia es para revisar que la dimensión del arreglo sea
        % M x 1 en lugar de 1 x N. En el caso que la dimensión sea 1 X N se
        % transpone el arreglo
        pressure = pressure.'; 
        
    end
    
    [~, n2] = size(flow);
    if n2 > 1 
        % Esta sentencia es para revisar que la dimensión del arreglo sea
        % M x 1 en lugar de 1 x N. En el caso que la dimensión sea 1 X N se
        % transpone el arreglo
        flow = flow.'; 
        
    end

    dataSet = iddata(flow, pressure, Ts); % Se genera el objeto de datos que recibe
                                          % la función tfest (nativa de
                                          % System identification toolbox).
    
  % opt = tfestOptions()   % Para darle parametros opcionales 
                            % Por default está en zero y auto
    
    planta = tfest(dataSet, polos, zeros); % Dados un número de polos y zeros
                                           % se obtiene una función de
                                           % transferencia estimada por el
                                           % toolbox de System
                                           % Identification
    
end
