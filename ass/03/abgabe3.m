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
histogram(dataSetosa(:,1), 'FaceColor', 'yellow');
hold on
histogram(dataSetosa(:,2), 'FaceColor', 'green');
hold on
histogram(dataSetosa(:,3), 'FaceColor', 'red');
hold on
histogram(dataSetosa(:,4), 'FaceColor', 'blue');
title('Histogramme für Setosa')
hold off

legend('sepal length','sepal width','petal length','petal width')

subplot(1,3,2);
histogram(dataVersicolor(:,1), 'FaceColor', 'yellow');
hold on
histogram(dataVersicolor(:,2), 'FaceColor', 'green');
hold on
histogram(dataVersicolor(:,3), 'FaceColor', 'red');
hold on
histogram(dataVersicolor(:,4), 'FaceColor', 'blue');
title('Histogramme für Versicolor')
hold off


subplot(1,3,3);
histogram(dataVirginica(:,1), 'FaceColor', 'yellow');
hold on
histogram(dataVirginica(:,2), 'FaceColor', 'green');
hold on
histogram(dataVirginica(:,3), 'FaceColor', 'red');
hold on
histogram(dataVirginica(:,4), 'FaceColor', 'blue');
title('Histogramme für Virginica')
hold off

% 1. sepale Länge (Länge des Kelchblattes),
% 2. sepale Breite (Breite des Kelchblattes),
% 3. petale Länge (Länge des Kronblattes),
% 4. petale Breite (Breite des Kronblattes).

%In den Histogrammen kann man sehen, dass Setosa die meisten kurzen
%Kronblätter haben und auch ansonsten eher kleiner als Versicolor und
%Virginica ist. 
%Die Größen der Blätter der Virginicapflanzen sind weiter 
%verteilt als die der anderen beiden, Virinica hat auch die Pflanzen mit 
%den größten Kelchblättern.
%Setosa-Pflanzen sind vor allem bei der petalen Breite sehr wenig verteilt,
%sind aber bei der sepalen Breite doch eher normalveteilt. Ihre sepale
%länge ist deutlich kürzer als die der anderen Pflanzen.


%c)
means_setosa = mean(dataSetosa);
means_versicolor = mean(dataVersicolor);
means_virginica = mean(dataVirginica);
var_setosa = var(dataSetosa);
var_versicolor = var(dataVersicolor);
var_virginica = var(dataVirginica);

number_setosa = length(dataSetosa(:,1));
number_virginica = length(dataVirginica(:,1));
number_versicolor = length(dataVersicolor(:,1));
data_length = number_setosa + number_virginica + number_versicolor;

%d)
%Klassifikation, funktionen weiter unten
classSetosa = bayes_classification(testSetosa);
classVirginica = bayes_classification(testVirginica);
classVersicolor = bayes_classification(testVersicolor);
classS=classSetosa(:,1);
classVi=classVirginica(:,1);
classVe=classVersicolor(:,1);

%e),
truePosS=0;
trueNegS=0;
falsePosS=0;
falseNegS=0;

truePosVi=0;
trueNegVi=0;
falsePosVi=0;
falseNegVi=0;

truePosVe=0;
trueNegVe=0;
falsePosVe=0;
falseNegVe=0;

%klasse 1=set, 2=vi, 3=ver

%welche Pflanzen in TestSetosa wurden richtig eingeordnet?
for i = 1:length(classS)
    if(classS(i)==1)
        truePosS=truePosS+1;
        trueNegVe=trueNegVe+1;
        trueNegVi=trueNegVi+1;
    elseif(classS(i)==2)
        falseNegS=falseNegS+1;
        falsePosVi=falsePosVi+1;
        trueNegVe=trueNegVe+1;
    else
        falseNegS=falseNegS+1;
        falsePosVe=falsePosVe+1;
        trueNegVi=trueNegVi+1;
    end    
    
end  

%welche Pflanzen in TestVirginica wurden richtig eingeordnet?
for i = 1:length(classVi)
    if(classVi(i)==2)
        truePosVi=truePosVi+1;
        trueNegVe=trueNegVe+1;
        trueNegS=trueNegS+1;
    elseif(classVi(i)==1)
        falseNegVi=falseNegVi+1;
        falsePosS=falsePosS+1;
        trueNegVe=trueNegVe+1;
    elseif(classVi(i)==3)
        falseNegVi=falseNegVi+1;
        falsePosVe=falsePosVe+1;
        trueNegS=trueNegS+1;
    end    
    
end  

%Welche Pflanzen in TestVersicolor wurden richtig eingeordnet?
for i = 1:length(classVe)
    if(classVe(i)==3)
        truePosVe=truePosVe+1;
        trueNegS=trueNegS+1;
        trueNegVi=trueNegVi+1;
    elseif(classVe(i)==1)
        falseNegVe=falseNegVe+1;
        falsePosS=falsePosS+1;
        trueNegVi=trueNegVi+1
    elseif(classVi(i)==2)
        falseNegVe=falseNegVe+1;
        falsePosVi=falsePosVi+1;
        trueNegS=trueNegS+1;
    end    
    
end  

%ausgabe
fprintf('Anzahl der true positiven Setosa: %f\n', truePosS)
fprintf('Anzahl der false positiven Setosa: %f\n', falsePosS)
fprintf('Anzahl der true negative Setosa: %f\n', trueNegS)
fprintf('Anzahl der false negativen Setosa: %f\n', falsePosS)

fprintf('Anzahl der true positiven Virginica: %f\n', truePosVi)
fprintf('Anzahl der false positiven Virginica: %f\n', falsePosVi)
fprintf('Anzahl der true negative Virginica: %f\n', trueNegVi)
fprintf('Anzahl der false negativen Virginica: %f\n', falsePosVi)

fprintf('Anzahl der true positiven Versicolor: %f\n', truePosVe)
fprintf('Anzahl der false positiven Versicolor: %f\n', falsePosVe)
fprintf('Anzahl der true negative Versicolor: %f\n', trueNegVe)
fprintf('Anzahl der false negativen Versicolor: %f\n', falsePosVe)

%f) plots
figure
%petale vs sepale breite
subplot(1,4,1);
plot(dataVirginica(:,4),dataVirginica(:,2),'o')
title('Petal length vs sepal length')
hold on
plot(dataSetosa(:,4),dataSetosa(:,2),'o')
hold on
plot(dataVersicolor(:,4),dataVersicolor(:,2),'o')

legend('Virginica','Setosa','Versicolor')
hold off

%petale länge gegen sepale breite
subplot(1,4,2);
plot(dataVirginica(:,3),dataVirginica(:,2),'o')
title('Petal length vs sepal length')
hold on
plot(dataSetosa(:,3),dataSetosa(:,2),'o')
hold on
plot(dataVersicolor(:,3),dataVersicolor(:,2),'o')
hold off

%petale länge gegen petale breite
subplot(1,4,3);
plot(dataVirginica(:,3),dataVirginica(:,4),'o')
title('Petal length vs sepal length')
hold on
plot(dataSetosa(:,3),dataSetosa(:,4),'o')
hold on
plot(dataVersicolor(:,3),dataVersicolor(:,4),'o')
hold off

%sepale länge gegen sepale breite
subplot(1,4,4);
plot(dataVirginica(:,1),dataVirginica(:,2),'o')
title('Petal length vs sepal length')
hold on
plot(dataSetosa(:,1),dataSetosa(:,2),'o')
hold on
plot(dataVersicolor(:,1),dataVersicolor(:,2),'o')
hold off

%Man kann sehen, dass sich in den Plots "Streifen" bilden, was für eine
%abhängigkeit der Werte spricht, vor allem innerhalb einer Sorte. 



%funktionen
%d)
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

%d) Klasse 1= setosa, 2= virginica, 3= versicolor
function p = bayes_classification(x)
    aposteriori_setosa = (likelihood_setosa(x) .* (number_setosa / data_length)) ./ evidence(x);
    aposteriori_virginica = (likelihood_virginica(x) .* (number_virginica / data_length)) ./ evidence(x);
    aposteriori_versicolor = (likelihood_versicolor(x) .* (number_versicolor / data_length)) ./ evidence(x);
    p_setosa = mean(aposteriori_setosa,2);
    p_virginica = mean(aposteriori_virginica,2);
    p_versicolor = mean(aposteriori_versicolor,2);
    p = zeros(length(p_setosa));
    for i = 1:length(p_setosa)
        if(p_setosa(i)>p_versicolor(i) && p_setosa(i)>p_virginica(i))
            p(i)=1;
        elseif(p_virginica(i)>p_versicolor(i))
            p(i)=2;
        else
            p(i)=3;
        end    
    
        
    end

end

end
