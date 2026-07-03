# Proiect-Licenta Sistem de monitorizare a consumului electric într-o locuință

Repository-ul conține:

cod_arduinopzem – codul Arduino pentru citirea valorilor de la modulul PZEM-004T;
cod_esp32 – codul ESP32 pentru transmiterea datelor către ThingSpeak;
analiza_date_reale.m – script MATLAB pentru analiza datelor reale;
bloc_inteligent.slx – model Simulink pentru simularea consumului;
analiza_consum_anual.m – script MATLAB pentru estimarea consumului lunar și anual;

Compilare

Codurile pentru Arduino și ESP32 se compilează în Arduino IDE.

Pași:

1.Se deschide fișierul .ino.
2.Se selectează placa folosită
3.Se selectează portul corect
4.Se apasă Verify
5.Se apasă Upload
   
Instalare
1.Se conectează modulul PZEM-004T la Arduino.
2.Se conectează Arduino la ESP32.
3.Se configurează canalul ThingSpeak.
4.Se completează în cod datele WiFi și cheia API.
5.Se alimentează montajul.

Lansare
1.Se pornesc plăcile Arduino și ESP32.
2.Arduino citește valorile electrice.
3.ESP32 trimite datele către ThingSpeak.
4.Valorile se pot urmări în ThingSpeak.
5.Pentru analiza datelor se rulează în MATLAB:

run('analiza_date_reale.m')

6.Pentru estimarea consumului anual se rulează în MATLAB:

run('analiza_consum_anual.m')

7.Pentru simulare se deschide fișierul:

bloc_inteligent.slx

Obs. Numele WiFi, parola WiFi si cheia API din codul esp32 se completeaza ulterior.

