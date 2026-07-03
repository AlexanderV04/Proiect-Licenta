#include <WiFi.h>
#include <ThingSpeak.h>

HardwareSerial ArduinoSerial(2);

const char* ssid = "TP-Link_1578";
const char* password = "94314397";

WiFiClient client;

unsigned long channelID = 3399477;
const char* writeAPIKey = "I88IPDZB46VAWTO5";

void setup() {

  Serial.begin(115200);

  ArduinoSerial.begin(9600, SERIAL_8N1, 16, 17);

  WiFi.begin(ssid, password);

  Serial.print("Conectare WiFi");

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println();
  Serial.println("WiFi conectat");

  ThingSpeak.begin(client);
}

void loop() {

  if (ArduinoSerial.available()) {

    String data = ArduinoSerial.readStringUntil('\n');
    data.trim();

    if (data.length() > 0) {

      Serial.print("Date primite: ");
      Serial.println(data);

      int p1 = data.indexOf(',');
      int p2 = data.indexOf(',', p1 + 1);
      int p3 = data.indexOf(',', p2 + 1);

      if (p1 > 0 && p2 > p1 && p3 > p2) {

        float voltage = data.substring(0, p1).toFloat();
        float current = data.substring(p1 + 1, p2).toFloat();
        float power   = data.substring(p2 + 1, p3).toFloat();
        float energy  = data.substring(p3 + 1).toFloat();

        ThingSpeak.setField(1, voltage);
        ThingSpeak.setField(2, current);
        ThingSpeak.setField(3, power);
        ThingSpeak.setField(4, energy);

        int status = ThingSpeak.writeFields(channelID, writeAPIKey);

        if (status == 200) {

          Serial.println("Trimis in ThingSpeak");

        } else {

          Serial.print("Eroare ThingSpeak: ");
          Serial.println(status);
        }

        delay(15000);
      }
    }
  }
}