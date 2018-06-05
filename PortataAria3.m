% Progetto Matlab: Dervishi, Catena, Di Giusto

clc 
clear
close all


% Caricamento dei dati di giri, portata e pressione
load("portata_aria2.mat");

% Normalizzo le variabili
girinorm = giri / norm(giri);
pressionenorm = pressione / norm(pressione);
portatanorm = portata / norm(portata);


% Guardo un primo plot
figure(1)
scatter3(girinorm, pressionenorm, portatanorm)
title("Scatter Plot")
xlabel('giri')
ylabel('pressione')
zlabel('portata')

%divido in trainInd valInd testInd 
[trainInd, valInd, testInd] = dividerand(length(portatanorm),0.7,0.3,0);

pause

X = [girinorm(trainInd), pressionenorm(trainInd)]; %utilizzo gli indici di girinorm selezionati da trainInd

mdl = stepwiselm(X, portatanorm(trainInd))

%vettori di test
X=linspace(min(girinorm),max(girinorm),10);
Y=linspace(min(girinorm),max(girinorm),10);
[X,Y]=meshgrid(X,Y);
Zlin=feval(mdl,X,Y);
surf(X,Y,reshape(Zlin,size(X)))



%ESERCIZIO
%phi
%meshgrid : Serve per vedere la rapp. in 3d e anche lo scatter sulla
%superficie; è utile per verificare COP







