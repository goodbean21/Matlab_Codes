function planta = get_Plant(pressure, flow, Ts)
% Esta funci�n tiene como fin obtener la funci�n de transferancia del
% sistema
% :param pressure: 
%    :double array: Recibe la pressi�n como un arreglo de datos 
% :param flow: 
%    :double array: Recibe el flujoe como un arreglo de datos
% :param Ts: 
%    :double: El valor de tiempo de sampleo
% :return planta:
%   :tf: Regresa una funci�n de transferencia

%%  
    zeros = 1;
    polos = 1;

    [~, n1] = size(pressure);
    if n1 > 1 
        % Esta sentencia es para revisar que la dimensi�n del arreglo sea
        % M x 1 en lugar de 1 x N. En el caso que la dimensi�n sea 1 X N se
        % transpone el arreglo
        pressure = pressure.'; 
        
    end
    
    [~, n2] = size(flow);
    if n2 > 1 
        % Esta sentencia es para revisar que la dimensi�n del arreglo sea
        % M x 1 en lugar de 1 x N. En el caso que la dimensi�n sea 1 X N se
        % transpone el arreglo
        flow = flow.'; 
        
    end

    dataSet = iddata(flow, pressure, Ts); % Se genera el objeto de datos que recibe
                                          % la funci�n tfest (nativa de
                                          % System identification toolbox).
    
  % opt = tfestOptions()   % Para darle parametros opcionales 
                            % Por default est� en zero y auto
    
    planta = tfest(dataSet, polos, zeros); % Dados un n�mero de polos y zeros
                                           % se obtiene una funci�n de
                                           % transferencia estimada por el
                                           % toolbox de System
                                           % Identification
    
end
