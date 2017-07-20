function table = backward_table(X, t, model)

numberHiddenStates = size(model.A,1);

% init table for dynmaic programming
% because matlab arrays start with index 1, the hidden states start with 0 and the visible states start with 1, some indices are incremented/decremented by 1 in comparison to the literature version of this algorithm 
b = zeros(t+1,numberHiddenStates);
for i = 1:numberHiddenStates
    b(t+1,i) = 1;
end

%iterate over the timesteps
for t2 = t:-1:1
    %calculate the sum for all hidden states
    for j = 1:numberHiddenStates
        sum = 0;
        %calculate sum
        for i = 1:numberHiddenStates
            sum = sum + (b(t2+1, i) * model.A(j, i) * model.B(j, X(t2)));
        end
        b(t2, j) = sum;
    end
end

table = b;

end