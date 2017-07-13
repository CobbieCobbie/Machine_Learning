function p = forward(X, t, model)

numberHiddenStates = size(model.A,1);

% init table for dynmaic programming
% because matlab arrays start with index 1, the hidden states start with 0 and the visible states start with 1, some indices are incremented/decremented by 1 in comparison to the literature version of this algorithm 
a = zeros(t+1,numberHiddenStates);
for i = 1:numberHiddenStates
    a(1,i) = model.startingState(i);
end

%iterate over the timesteps
for t2 = 2:t+1
    %calculate the sum for all hidden states
    for j = 1:numberHiddenStates
        sum = 0;
        %calculate sum
        for i = 1:numberHiddenStates
            sum = sum + (a(t2-1, i) * model.A(i, j) * model.B(j, X(t2-1)));
        end
        a(t2, j) = sum;
    end
end

%calculate output, sum up the prob for every hidden state j that the hmm is
%after t steps in the state j and has printed the sequence of visible
%states
sum = 0;
for j = 1:numberHiddenStates
    sum = sum + a(t+1, j);
end

p = sum;

end