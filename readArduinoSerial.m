function [tabla, Ts] = readArduinoSerial(Tiempo_Total)
%%  
    path1 = 'C:\Users\Usuario\Desktop\10mo Semestre\Cardiovascular\Proyecto_MockLoop\Versi�n_1\Matlab_Codes\Caracterizaci�n_MockLoop';
    archive = strcat(path1,'\Caracterizaci�n_v1.csv');
    
    if ~isempty(instrfind)
         fclose(instrfind);
         delete(instrfind);

    end
    
    cronometro = 0;
    j = 1;
    i = 1;
    data = [];
    ard = serial('COM9', 'BaudRate', 9600); % create serial communication object
    fopen(ard);                           % initiate arduino communication
    pause(3);                             % Importante esperar a la conexion! 
    
    fprintf(ard, '%c', 'm');
    pause(1);
    
    while ard.BytesAvailable == 0 % Esperar respuesta
        pause(1);

    end
    
    value = fgetl(ard);             % Se obtiene el primer dato que reciba 
                                    % del a tarjeta
    if value ~= 's'
        error('First value read was not start token "s"');

    end
    
    tic;
    while cronometro < Tiempo_Total
       value = fscanf(ard,'%f'); % Se guarda un dato que reciba por terminal
        
       if value == 'e'    
           % Si recibe el token 'e/' por terminal entonces se termina la
           % comuncicaci�n, se sale del bucle para no tomar m�s datos de
           % informaci�n.
           break

       end

       try
           data(j) = value;     % Se stackea el valor actual al arreglo

       catch
           % En el caso que no se reciba un digitl flotante se sale del
           % ciclo
           break

       end

       j = j + 1;               % Contador del valor actual
       cronometro = toc;
       
    end
    
    fclose(ard);                % Se termina la comunicaci�n con arduino
    
    Ts = (cronometro/(j-1));
    t = (0 : Ts : cronometro).';
    data = data.';
    
    tabla = horzcat(t(1:end-1), data);
    
    while exist(archive)
        i = i + 1;
        archive = strcat(path1, '\Caracterizaci�n_v', int2str(i), '.csv');

    end

    csvwrite(archive, table, 0, 0);

    
end