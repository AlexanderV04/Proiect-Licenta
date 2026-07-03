clc;
clear;
close all;

channelID = 3399477;
readAPIKey = "RXDL7S7TV2OIG6UT";

data = thingSpeakRead(channelID, ...
    "Fields", [1 2 3 4], ...
    "NumPoints", 30, ...
    "ReadKey", readAPIKey);

V = data(:,1);
I = data(:,2);
P = data(:,3);
E = data(:,4);

% Eliminare valori eronate
V(V > 300 | V < 180) = NaN;
I(I > 100 | I < 0) = NaN;
P(P > 10000 | P < 0) = NaN;
E(E > 1000 | E < 0) = NaN;

figure;
plot(V,'-o');
grid on;
title('Tensiunea masurata');
xlabel('Numar de citiri');
ylabel('Tensiune [V]');

figure;
plot(I,'-o');
grid on;
title('Curentul masurat');
xlabel('Numar de citiri');
ylabel('Curent [A]');

figure;
plot(P,'-o');
grid on;
title('Puterea consumata');
xlabel('Numar de citiri');
ylabel('Putere [W]');

figure;
plot(E,'-o');
grid on;
title('Energia consumata');
xlabel('Numar de citiri');
ylabel('Energie [kWh]');

P_medie = mean(P,'omitnan');
P_max = max(P);
P_min = min(P);
E_total = max(E);

V_medie = mean(V,'omitnan');
I_max = max(I);

fprintf('Tensiune medie: %.2f V\n', V_medie);
fprintf('Curent maxim: %.2f A\n', I_max);

fprintf('Putere medie: %.2f W\n', P_medie);
fprintf('Putere maxima: %.2f W\n', P_max);
fprintf('Putere minima: %.2f W\n', P_min);

fprintf('Energie totala: %.5f kWh\n', E_total);

% Detectare consum anormal

prag_putere = P_medie * 1.5;

if P_max > prag_putere

    fprintf('\nATENTIE: Consum ridicat detectat!\n');

else

    fprintf('\nConsum normal.\n');

end

% Estimare cost energie

cost_kwh = 1.3;

cost_total = E_total * cost_kwh;

fprintf('Cost estimat consum: %.4f RON\n', cost_total);