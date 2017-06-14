function main

%Aufgabe a)
dataSetosa = csvread('trainingSetosa.csv');
dataVersicolor = csvread('trainingVersicolor.csv');
dataVirginica = csvread('trainingVirginica.csv');


data = [dataSetosa; dataVersicolor; dataVirginica];

[pc ws s] = pca( data ); %3b

(s(1) + s(2)) / sum(s) %3c, mehr als 95% der Streuung befinden sich in den ersten beiden PCs, abgesehen von davon gibts es keine Kombination mit mehr als 95%

data * pc(:, 1:2) %projeziere die Daten mit mehr als 95% der Streuung in einen 2-Dimmensionalen Raum 

scatter(data(:,1), data(:, 2))
end 