function [tabla, Ts] = readArduinoSerial(puerto, Tiempo_Total)
%%  
    close all
    
    path1 = 'C:\Users\Usuario\Desktop\10mo Semestre\Cardiovascular\Proyecto_MockLoop\Versión_1\Matlab_Codes\Caracterización_MockLoop';
    archive = strcat(path1,'\Caracterización_v1.csv');
    
    if ~isempty(instrfind)
         fclose(instrfind);
         delete(instrfind);

    end
    
    cronometro = 0;
    j = 1;
    i = 1;
    data = [];
    ard = serial(puerto, 'BaudRate', 9600); % create serial communication object
    
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
    disp('Comenzando muestra');
    
    while cronometro < Tiempo_Total
       value = fscanf(ard,'%f'); % Se guarda un dato que reciba por terminal
        
       if value == 'e'    
           % Si recibe el token 'e/' por terminal entonces se termina la
           % comuncicación, se sale del bucle para no tomar más datos de
           % información.
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
       
       clear value;
       
    end
    
    fclose(ard);                % Se termina la comunicación con arduino
    
    Ts = (cronometro/(j-1));
    t = (0 : Ts : cronometro);
    
    t = t(1:end-1);
    
    figure,
    plot(t, data);
    xlabel('Tiempo (s)')
    ylabel('Flow (L/min)')
    
    tabla = horzcat(t.', data.');
    
    promedio = mean(data)
    
    while exist(archive)
        i = i + 1;
        archive = strcat(path1, '\Caracterización_v', int2str(i), '.csv');

    end
    
    save(strcat(path1, '\Caracterización_v', int2str(i), '.mat'), 'tabla')
    csvwrite(archive, tabla, 0, 0);
    
end