function main
    
data = csvread('fische.csv')
hist(data)
mittel=mean(data);
mu1=1;
sigma1=0.2;
mu2=1.6;
sigma2=0.3;


%% Erste Schätzung der Mittelwerte: Fisch 1 ca: 
%% Mittelwert über alle Fische: 1.2321
%% Mittelwert über die Erwartungswerte= 2.6/2=1.3
%% ist also relativ ähnlich zum Gesamterwartungswert, die Mittelwerte scheinen verlässlich zu sein.




end
%% c)1.
function p = likelihood(x, mu, sigma)
p = normpdf(x, mu, sigma)
end

function e =evidence(data, x)

end




