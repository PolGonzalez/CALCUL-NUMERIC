% 
clear all; close all; clc

%Solution of the 1D parabolic equation in (a,b)x(0,T)
a = 0; b = 1; %end points
T = 0.2;      %final time
v = 1;
m = input('Number of spatial intervals (default m=10) = ');
if(isempty(m)), m=10; end

Ax = (b-a)/m;   %discretization size
x = a:Ax:b;     %nodes
nOfSteps=input('Number of time steps =');
if(isempty(nOfSteps)), nOfSteps=ceil(T/(0.5*Ax^2)), end
At = T/nOfSteps; %Time step 

%initial condition (column vector)
f = 1-2*abs(x-0.5)';
%f = (sin(pi*x) + x.^2)'; 
% boundary conditions 
t = 0:At:T; 
ua = zeros(size(t)); ub=ua; %ub=t;
%ub = ones(size(t));
nOfStepsPlot = ceil(nOfSteps/10); %about 10 plots

%Solution computation
%
%U_ex = parabolicEuler(x,Ax,At,nOfSteps,nOfStepsPlot,ua,ub,f,v);
U_ex = backwardEuler(x,Ax,At,v,nOfSteps,nOfStepsPlot,ua,ub,f);
%Postprocess
figure(1); plot(x,U_ex); title('Explicit')







