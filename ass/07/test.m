%we haven't implemented anything to give names to the hidden states of our
%model, instead all hidden states are numbers starting from 0 (like in the
%example hmm from the exercise sheet), this is due to the fact that the
%name of hidden states and visible states is absolutly meaningless to all
%algorithms we observe in this lecture, only the transition matrices A and B matter. 

%tests for all three methods
forward([1,3,6,7,9],5,createHmm())
backward([1,3,6,7,9],5,createHmm())

%note that in exercise e and f we calculated a(6,10) and b(6,10) because
%our implementation works with arrays which indexing is starting with 1
%exercise e
a = forward_table([1,3,6,7,9],5,createHmm());
b = backward_table([1,3,6,7,9],5,createHmm());
(a(6,10) * b(6,10)) / forward([1,3,6,7,9],5,createHmm())

%exercise f
a = forward_table([2,3,5,7,10],5,createHmm());
b = backward_table([2,3,5,7,10],5,createHmm());
(a(6,10) * b(6,10)) / forward([2,3,5,7,10],5,createHmm())

%exercise g
viterbi([1,3,6,7,9], createHmm())