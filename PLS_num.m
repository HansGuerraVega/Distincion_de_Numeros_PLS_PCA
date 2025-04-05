close all
% Leemos la base de datos de los numeros
Images = loadMNISTImages('t10k-images.idx3-ubyte');

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
% keyboard
[PC,P,Q,W] = plsnipals(Images',Y,6);
% Obtenemos los indices para el 1 y el 0 de forma logica
indNum1=logical(indNum(:,1+1));
indNum0=logical(indNum(:,0+1));
% Graficamos las variables latentes(VL) o Componentes principales(CP) 1 y 2 del numero 1 y 5
scatter(PC(indNum1,1), PC(indNum1,2), '.r')
hold on
scatter(PC(indNum0,1), PC(indNum0,2), '.b')
hold off
title('Variables Latentes 1 y 2 del número 1 y 5')
xlabel('VL: 1')
xlabel('VL: 2')
legend('Número 1','Número 5')