clear; close all; clc

load malla.mat
plotMesh(X,T)

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);
y0 = y0';
tol = 1e-8; maxIter = 50; 
[vect_x,vect_r] = newton(y0,maxIter,F);
% Completar el codi per determinar la posicio dels nodes interiors que
% minimitza la distorsio de la malla. 
% Abans de fer servir el metode de Newton, cal completar la funcio
% calculaDistorsioMalla
% ...
% ...
% ...
plotMesh([reshape(vect_x(:,50),Nint,2);X(Nint+1:end,:)],T)