% Progetto Matlab: Dervishi, Catena, Di Giusto

clc 
clear
close all


% Caricamento dei dati di giri, portata e pressione
load('portata_aria2.mat');

% Normalizzo le variabili
girinorm = giri / norm(giri);
pressionenorm = pressione / norm(pressione);
portatanorm = portata / norm(portata);


% Guardo un primo plot
figure(1)
scatter3(girinorm, pressionenorm, portatanorm)
title('Scatter Plot')
xlabel('giri')
ylabel('pressione')
zlabel('portata')

%divido in trainInd valInd testInd 
[trainInd, valInd, testInd] = dividerand(length(portatanorm),0.7,0.3,0);

pause

X = [girinorm(trainInd), pressionenorm(trainInd)]; %utilizzo gli indici di girinorm selezionati da trainInd

mdl_lin= stepwiselm(X, portatanorm(trainInd),'linear')
mdl_poly=stepwiselm(X,portatanorm(trainInd),'poly55')

%vettori di test
X=linspace(min(girinorm),max(girinorm),10);
Y=linspace(min(girinorm),max(girinorm),10);
[X,Y]=meshgrid(X,Y);
Zlin=feval(mdl_lin,X,Y);
Zpoly=feval(mdl_poly,X,Y);
pause
figure(2)
surf(X,Y,reshape(Zlin,size(X)))
title('Stepwise regression lin')
pause
figure(3)
surf(X,Y,reshape(Zpoly,size(X)))
title('Stepwise regression poly max 5')


% con stepwise regressione e anche i polinomi con phi io stimo il modello. nel secondo 
% caso la struttura del modello ce l ho già, nel primo caso lo trova il procedimento(anche i parametri??)
% con le varie validazione vedo quale è il milgiore.
% NB vedi: http://sisdin.unipv.it/labsisdin/teaching/courses/imadlt/files/IdentificazioneParametrica4.pdf
% http://sisdin.unipv.it/labsisdin/teaching/courses/imadlt/files/IdentificazioneParametrica3.pdf

%ESERCIZIO
%phi
%meshgrid : Serve per vedere la rapp. in 3d e anche lo scatter sulla
%superficie; Ã¨ utile per verificare COP







