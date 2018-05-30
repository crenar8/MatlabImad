% Progetto Matlab: Dervishi, Catena, Di Giusto

clc 
clear
close all


% Caricamento dei dati di giri, portata e pressione
load("portata_aria2.mat");

% Normalizzo le variabili
giri = giri / norm(giri);
pressione = pressione / norm(pressione);
portata = portata / norm(portata);


% Guardo un primo plot
scatter3(giri, pressione, portata)
xlabel('giri')
ylabel('pressione')
zlabel('portata')


[trainInd, valInd, testInd] = dividerand(length(portata),0.7,0.3,0);

pause

X = [giri(trainInd), pressione(trainInd)];

LM = stepwiselm(X, portata(trainInd))







