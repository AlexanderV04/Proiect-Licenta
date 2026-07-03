luni = 1:12;

indice_lunar = [1.3 1.25 1.1 1.0 0.95 0.9 1.15 1.2 1.0 1.05 1.15 1.3];

consum_baza_lunar = 500; % kWh/luna

consum_lunar = consum_baza_lunar .* indice_lunar;

figure;
bar(luni, consum_lunar);
grid on;

title('Consum lunar estimat pentru bloc inteligent');
xlabel('Luna');
ylabel('Consum energie [kWh]');

cost_kwh = 1.3; % RON/kWh

cost_lunar = consum_lunar * cost_kwh;
consum_anual = sum(consum_lunar);
cost_anual = sum(cost_lunar);

fprintf('Consum anual estimat: %.2f kWh\n', consum_anual);
fprintf('Cost anual estimat: %.2f RON\n', cost_anual);