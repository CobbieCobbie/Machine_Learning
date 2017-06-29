%the state is impemented as an instance of containers.Map, whether there is
%a specific variable set or not can be checked by isKey, the values
%specified vor the variables are the numbers as specified in exercise 2

function p = bayes_net(state)

%probabilities from exercise 2
as = [0.25 0.25 0.25 0.25];
bs = [0.6 0.4];
xab = [0.5 0.5; 0.7 0.3; 0.6 0.4; 0.8 0.2; 0.4 0.6; 0.1 0.9; 0.2 0.8;0.3 0.7];
cx = [0.6 0.2 0.2; 0.2 0.3 0.5];
dx = [0.3 0.7; 0.6 0.4];

a_start = 1;
a_end = 4;

% if A is set to a value, only iterate over this value in the for loop (same for B, C, D and X)
if isKey(state, 'A')
    a_start = state('A');
    a_end = state('A');
end

b_start = 1;
b_end = 2;

if isKey(state, 'B')
    b_start = state('B');
    b_end = state('B');
end

c_start = 1;
c_end = 3;

if isKey(state, 'C');
    c_start = state('C');
    c_end = state('C');
end

x_start = 1;
x_end = 2;

if isKey(state, 'X')
    x_start = state('X');
    x_end = state('X');
end

d_start = 1;
d_end = 2;

if isKey(state, 'D')
    d_start = state('D');
    d_end = state('D');
end

%iterate over all 5 indices and sum up the terms derived from the bayes net
sum = 0;
for a=a_start:a_end
    for b=b_start:b_end
        for c=c_start:c_end
            for d=d_start:d_end
                for x=x_start:x_end
                    sum = sum + (as(a)*bs(b)*xab((2*a-1) + (b-1), x)*cx(x, c)*dx(x, d));
                end
            end
        end
    end
end

p = sum;

end