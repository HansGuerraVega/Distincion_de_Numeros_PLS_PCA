close all
% Leemos la base de datos de los numeros
Images = loadMNISTImages('t10k-images.idx3-ubyte');
%Images = reshape(Images, 28, 28, []);

% Leemos las etiquetas de la base de datos
Y = loadMNISTLabels('t10k-labels.idx1-ubyte');
% Generamos una matriz con los indices para cada numero
indNum=[];
% Obtenemos una matriz con los indices de todas las personas
for k=0:9      %person
    indNumk=Y==k;
    indNum=[indNum, indNumk];   % Cada columna pertenece al indice del digito k-1
end
% Obtenemos el pca de los datos
[signals, PC, V] = pca2(Images');
% Obtenemos los indices para el 1 y el 0 de forma logica
indNum1=logical(indNum(:,1+1));
indNum0=logical(indNum(:,0+1));
% Graficamos el pca 1 y 2 del numero 1 y 5
scatter(PC(indNum1,1), PC(indNum1,2), '.r')
hold on
scatter(PC(indNum0,1), PC(indNum0,2), '.b')
hold off
title('Componentes principales 1 y 2 del número 1 y 5')
xlabel('CP: 1')
xlabel('CP: 2')
legend('Número 1','Número 5')