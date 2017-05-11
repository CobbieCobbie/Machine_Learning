function main
    
data = csvread('fische.csv');
hist(data)
mittel=mean(data);
mu1=1;
sigma1=0.2;
mu2=1.6;
sigma2=0.3;


%Plot für 3d (Lachs)
x = 0.4:0.01:2.0;
y = a_posteriori_lachs(x)
figure
plot(x,y)

y = a_posteriori_barsch(x)
figure
plot(x,y)
%% Erste Schätzung der Mittelwerte: Fisch 1 ca: 
%% Mittelwert über alle Fische: 1.2321
%% Mittelwert über die Erwartungswerte= 2.6/2=1.3
%% ist also relativ ähnlich zum Gesamterwartungswert, die Mittelwerte scheinen verlässlich zu sein.

end
%% c)1.
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

