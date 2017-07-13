function [ hmm ] = createHmm(  )
% T = Anzahl an der Knoten
% A = Übergangswahrscheinlichkeiten der Hidden States entsprechend der Tabellen auf dem Übungsblatt.
% B = Emissionswahrscheinlichkeiten der Visible States entsprechend der Tabellen auf dem Übungsblatt.
% startingState = Ein Array, der an den Indizes eine 1 enthält für die der
% entsprechende Zustand ein Startzustand ist
    hmm.T = 5;
    
    A = [0 0.4 0.6 0 0 0 0 0 0 0 0; 0 0 0 0.3 0.7 0 0 0 0 0 0; 0 0 0 0.7 0.3 0 0 0 0 0 0; 0 0 0 0 0 0.8 0.2 0 0 0 0; 0 0 0 0 0 0.2 0.8 0 0 0 0; 0 0 0 0 0 0 0 0.9 0.1 0 0; 0 0 0 0 0 0 0 0.1 0.9 0 0; 0 0 0 0 0 0 0 0 0 0.6 0.4; 0 0 0 0 0 0 0 0 0 0.4 0.6; 0 0 0 0 0 0 0 0 0 1 0; 0 0 0 0 0 0 0 0 0 0 1];
    
    B = [0 0 0 0 0 0 0 0 0 0; 0.1 0.9 0 0 0 0 0 0 0 0; 0.9 0.1 0 0 0 0 0 0 0 0; 0 0 0.4 0.6 0 0 0 0 0 0; 0 0 0.6 0.4 0 0 0 0 0 0; 0 0 0 0 0.7 0.3 0 0 0 0; 0 0 0 0 0.3 0.7 0 0 0 0; 0 0 0 0 0 0 0.6 0.4 0 0; 0 0 0 0 0 0 0.4 0.6 0 0; 0 0 0 0 0 0 0 0 0.8 0.2 ; 0 0 0 0 0 0 0 0 0.2 0.8];
    
    hmm.A = A;
    hmm.B = B;

    hmm.startingState = [1 0 0 0 0 0 0 0 0 0 0];

end
