#include <PZEM004Tv30.h>
#include <SoftwareSerial.h>

SoftwareSerial pzemSWSerial(10,11);
PZEM004Tv30 pzem(pzemSWSerial);

void setup() {
  Serial.begin(9600);
  pzemSWSerial.begin(9600);
}

void loop() {
  float voltage = pzem.voltage();
  float current = pzem.current();
  float power = pzem.power();
  float energy = pzem.energy();

  if(!isnan(voltage)){
    Serial.print(voltage);
    Serial.print(",");
    Serial.print(current);
    Serial.print(",");
    Serial.print(power);
    Serial.print(",");
    Serial.println(energy,5);
  }

  delay(2000);
}