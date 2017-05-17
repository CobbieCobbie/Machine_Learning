function main

%Aufgabe a)
dataSetosa = csvread('trainingSetosa.csv');
dataVersicolor = csvread('trainingVersicolor.csv');
dataVirginica = csvread('trainingVirginica.csv');
testSetosa = csvread('testSetosa.csv');
testVersicolor = csvread('testVersicolor.csv');
testVirginica = csvread('testVirginica.csv');


% Aufgabe b)
figure 
subplot(1,3,1);
histogram(dataSetosa(:,1));
hold on
histogram(dataSetosa(:,2));
hold on
histogram(dataSetosa(:,3));
hold on
histogram(dataSetosa(:,4));
title('Histogramme für Setosa')
hold off

subplot(1,3,2);
histogram(dataVersicolor(:,1));
hold on
histogram(dataVersicolor(:,2));
hold on
histogram(dataVersicolor(:,3));
hold on
histogram(dataVersicolor(:,4));
title('Histogramme für Versicolor')
hold off


subplot(1,3,3);
histogram(dataVirginica(:,1));
hold on
histogram(dataVirginica(:,2));
hold on
histogram(dataVirginica(:,3));
hold on
histogram(dataVirginica(:,4));
title('Histogramme für Virginica')
hold off


means_setosa = mean(dataSetosa)
means_versicolor = mean(dataVersicolor)
means_virginica = mean(dataVirginica)
var_setosa = var(dataSetosa)
var_versicolor = var(dataVersicolor)
var_virginica = var(dataVirginica)

number_setosa = length(dataSetosa(:,1));
number_virginica = length(dataVirginica(:,1));
number_versicolor = length(dataVersicolor(:,1));
data_length = number_setosa + number_virginica + number_versicolor;

bayes_classification(testSetosa)


function p = likelihood_setosa(x)
p = normpdf(x, repmat(means_setosa, length(x), 1), repmat(var_setosa, length(x), 1));
end


function p = likelihood_virginica(x)
p = normpdf(x, repmat(means_virginica, length(x), 1), repmat(var_virginica, length(x), 1));
end

function p = likelihood_versicolor(x)
p = normpdf(x, repmat(means_versicolor, length(x), 1), repmat(var_versicolor, length(x), 1));
end

function p = evidence(x)
 p = (number_setosa / data_length) .* likelihood_setosa(x) + (number_virginica / data_length) .* likelihood_virginica(x) + (number_versicolor / data_length) .* likelihood_versicolor(x);
end


function p = bayes_classification(x)
    aposteriori_setosa = (likelihood_setosa(x) .* (number_setosa / data_length)) ./ evidence(x)
    aposteriori_virginica = (likelihood_virginica(x) .* (number_virginica / data_length)) ./ evidence(x)
    aposteriori_versicolor = (likelihood_versicolor(x) .* (number_versicolor / data_length)) ./ evidence(x)
    
    
        
end

end


