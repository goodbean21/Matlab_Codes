function master(numero_De_Caracterizacion, pressureHigh, Ts)
    path1 = 'C:\Users\Usuario\Desktop\10mo Semestre\Cardiovascular\Proyecto_MockLoop\Versión_1\Matlab_Codes\';
    tabla = load(strcat(path1, '\Caracterización_v', int2str(numero_De_Caracterizacion), '.mat'));
    
    flow = tabla(2,:);
    time = tabla(1,:);
    pressure = square(0:Ts:max(time)*(2*pi), 50) * pressureHigh;
    
    subSample = length(pressure)/length(flow);
    subsamplePressure = downsample(pressure, subSample);
    
    modelo = get_Plant(subsamplePressure, flow, Ts);
    
    save ('modelo_mockloop.mat', 'modelo');
    
end