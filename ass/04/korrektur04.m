function main
samples = csvread('samples.csv')
% a) Erst mal die Parameter beschreiben
% - mü_n dach, für n = 0 insbesondere. Mittwelwert von der Stichprobe.
% - mü_0 ist der Anfangschätzwert
% - sigma_0 ^2 ist die korrespondierende Varianz (in kombi mit mü _ 0)
% - sigma ^2 Varianz von der ursprünglichen Verteilung 
% grosse n: 
% in der Formel: mü_n ist eine linearkombination von mü_n dach und mü_0
% b) Bei bayes gibt es eine gewisse unsicherheit, wenn wir den mittelwert
% verwenden. Auch der hat dann eine Standardabweichung und eine Varianz.
% Wird n größer, dann wird Mittelwert immer genauer. 

% die e) haben die meisten falsch programmiert. eine approxfunktion und die
% Schätzung gegeben. Bayesche Schätzung: sigma_n geht mit ein in die
% schätzung. Liegt daran: Das sigma passt zu meinem mü. Stichwort
% Paarbildung. 

%d)

mu_0 = -10;
var_0 = 1;
n = 10 * 2.^[0:5]
mu_n = @(n) 1 / (n*var_0 + var) * (var_0 + sum(samples(1:n)) + var*mu_0;
for i = 1:length(n)
    mu_i(i)= mu_n(n(i));
end
mu_i

% mehr wurde nicht gezeigt
end
