clc;
clear all;

%% plotear sobre una distribución binomial
%la frecuencia ideal será la media

%la función normal estará dada por: 
x= 1:2500
ynorm =normpdf(x ,1500 ,80);

plot(x,ynorm);