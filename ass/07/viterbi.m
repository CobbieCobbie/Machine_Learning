function path = viterbi(X, model)

numberHiddenStates = size(model.A,1);
T = length(X);

%two tables for dynmaic programming, T2 saves the most likely predecessor
T1 = zeros(numberHiddenStates, T);
T2 = zeros(numberHiddenStates, T);

%init the probs that we go from a starting state in state i and output the
%first visible state in the sequence
for j = 1:numberHiddenStates
    sum = 0;
    for i = 1:numberHiddenStates
        if model.startingState(i) == 1
            sum = sum + (model.A(i, j) * model.B(j, X(1)));
            if T2(j, 1) == 0
                T2(j, 1) = i;
            elseif model.A(i, T2(j,1)) < model.A(i,j);
                T2(j, 1) = i;
            end
        end
    end
    T1(j,1) = sum;
end

for j = 2:T
    for i = 1:numberHiddenStates
        possible = zeros(1,numberHiddenStates);
        for k = 1:numberHiddenStates
            possible(k) = T1(k, j-1) * model.A(k,i);
        end
        [m, am] = max(possible); %argmax gives the best possible predecessor state, because states are just numbers in out implementation and the prob for state k is at the k-th position
        T1(i, j) = m * model.B(i, X(j));
        T2(i, j) = am;
    end
end

%most probable final state
possible = zeros(1, numberHiddenStates);
for k = 1:numberHiddenStates
    possible(k) = T1(k, T);
end
[m, am] = max(possible);

%backtracking
s = zeros(1,T);
s(T) = am;
for i = T:-1:2
    s(i-1) = T2(s(i), i);
end

%just for technical reasons, because the states are 0 indexed in the
%exercise
for i = 1:T
    s(i) = s(i) - 1;
end

path = [T2(s(1), 1)-1 s];

end