#define BAUDRATE 9600

const int sensorPin = 2;          // Se utiliza el pin digital 2
const int measureInterval = 1000; // Intervalo de medición en milisegundos
volatile int pulseConter;         // Contador de pulsos
bool sent = false;
// YF-S201
const float factorK = 7.5;        // Factor intrinseco de revoluciones del sensor de flujo

void ISRCountPulse() {
  /*
     Handler de la interrupción generada por el pin digital 2
     Es un contandor de pulsos en rising edge.
  */

  pulseConter++;

}

float GetFrequency() {
  /*
      Método utilizado para obtener la frecuencia generada por los pulsos del caudolimetro
      :return: Regresa el valor de frecuencia obtenido en una ventana de medición
  */
  pulseConter = 0;

  interrupts();               // Habilitador de interrupciones
  delay(measureInterval);     // La ventana de muestreo recibe un valor entero y representa el tiempo en milisegundos
  noInterrupts();             // Se deshabilitan las interrupciones

  return (float) pulseConter * 1000 / measureInterval;
}

void setup() {
  Serial.begin(BAUDRATE);
  attachInterrupt(digitalPinToInterrupt(sensorPin), ISRCountPulse, RISING); // Se agrega la interrupción al pin digital 2. Se hace el callback al handler en cada rising edge

}

void loop() {
  if (!sent){
    Serial.println("s/");  // Start Token
    sent = true;
  }
  // obtener frecuencia en Hz
  float frequency = GetFrequency();

  // calcular caudal mL/s dado que la ecuación es Flujo = frecuencia / factor
  float flow_Lmin = (frequency / factorK);

  Serial.println(flow_Lmin, 3);

  delay(10);
  
}
