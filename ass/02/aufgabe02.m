function main

data = csvread('fische.csv'); %2)a)
hist(data)  %2)b)
mittel=mean(data);

% Erste Schätzung der Mittelwerte: Fisch 1 ca: 
% Mittelwert über alle Fische: 1.2321
% Mittelwert über die Erwartungswerte= 2.6/2=1.3
% ist also relativ ähnlich zum Gesamterwartungswert, die Mittelwerte scheinen verlässlich zu sein.



%Plot für 2)d) (Lachs)
x = 0.4:0.01:2.0;
y = a_posteriori_lachs(x);
figure
plot(x,y)

%Plot für 2)d) (Barsch)
y = a_posteriori_barsch(x);
figure
plot(x,y)

%Plot für 3)b) (Risiko Barsche)
y = 1.2 .* a_posteriori_barsch(x);
figure
plot(x,y)

%Plot für 3)b) (Risiko Lachse)
y = 0.5 .* a_posteriori_lachs(x);
figure
plot(x,y)

%klassifiziere alle Testdaten und gebe sie aus 2)e) und 3)a)
lachs = 0;
barsch = 0;
for i = 1:length(data)
    if a_posteriori_lachs(data(i)) > a_posteriori_barsch(data(i))
        fprintf('%f: Lachs, Risiko: %f\n', data(i), 0.5 * a_posteriori_lachs(data(i)))
        lachs = lachs + 1;
    else
        fprintf('%f: Barsch, Risiko: %f\n', data(i), 1.2 * a_posteriori_barsch(data(i)))
        barsch = barsch + 1;
    end
end

%2)f) Anteil Lachse: 37,8%, Anteil Barsche: 62,2%
fprintf('Anteil der Lachse: %f\n', lachs / (barsch + lachs))
fprintf('Anteil der Barsch: %f\n', barsch / (barsch + lachs))



%3)c)
lachs = 0;
barsch = 0;
for i = 1:length(data)
    if 1.2 * a_posteriori_lachs(data(i)) > 0.5 * a_posteriori_barsch(data(i))
        fprintf('%f: Lachs (mit Risikoabschätzung)\n', data(i))
        lachs = lachs + 1;
    else
        fprintf('%f: Barsch (mit Risikoabschätzung)\n', data(i))
        barsch = barsch + 1;
    end
end

fprintf('Anteil der Lachse (mit Risikoabschätzung): %f\n', lachs / (barsch + lachs))
fprintf('Anteil der Barsch (mit Risikoabschätzung): %f\n', barsch / (barsch + lachs))

%3)d) Wird zum Beispiel lambda(Barsch|Lachs) erhöht werden weniger Lachse
%fälschlicherweise als Barsch klassifiziert, aber dafür werden auch mehr
%Barsche fälschlicherweise als Lachs klassifiziert. 

end




% 2)c)
function p = likelihood_lachs(x)
p = normpdf(x, 1.6, 0.3);
end

function p = likelihood_barsch(x)
p = normpdf(x, 1, 0.2);
end

function e = evidence(x)
 e = 0.5 .* likelihood_lachs(x) + 0.5 .* likelihood_barsch(x);
end

function p = a_posteriori_lachs(x)
  p = (likelihood_lachs(x) .* 0.5) ./ evidence(x);
end

function p = a_posteriori_barsch(x)
  p = (likelihood_barsch(x) .* 0.5) ./ evidence(x);
end

