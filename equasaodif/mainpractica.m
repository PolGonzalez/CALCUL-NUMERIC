% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 
close all;

% Resolucio de la EDO dy/dx = -y/(10x+1) per x en (0,1) 
% amb condicio inicial y(0)=1
R = 0.00132;
g = -9.8;
theta = pi/4;
v0 = 100;
f=@(x,y) [y(3);y(4);-R*norm([y(3),y(4)])*y(3);-R*norm([y(3),y(4)])*y(4) + g];
a=0; b=15;  
y0=[0;0;cos(theta)*v0;sin(theta)*v0];

%Solucio analitica
%yanal = @(x)(cos(x));
%figure(1)
%hold on
%x = linspace(a,b,1000);

%plot(x,yanal(x),'-') 
%legend('sol. analitica')

%Solucio amb funcions intrinseques de Matlab
options = odeset('Events','FuncioEvent');
[x,Y]=ode45(f,[a,b],y0,options);
subplot(1,2,1)
figure(1), hold on,plot(Y(:,1),Y(:,2)), legend('ode45')

%Solucio amb el metode d'Euler
%h=0.01;
%npassos=ceil((b-a)/h); 
npassos = 20;
[x,Y]=Euler(f,[a,b],y0,npassos);
figure(1), hold on,plot(Y(:,1),Y(:,2)), legend('ode45','Euler')


%Error amb m passos
m = 200;
[x,Y1]=Euler(f,[a,b],y0,npassos);
[x,Y2]=Euler(f,[a,b],y0,2*npassos);
ijk = [Y1(end,1) - Y2(end,1),Y1(end,2) - Y2(end,2)];
r = norm(ijk)/norm([Y2(end,1),Y2(end,2)])

E = [];
for i = 1:400
    m = i;
    [x,Y1]=Euler(f,[a,b],y0,m);
    [x,Y2]=Euler(f,[a,b],y0,2*m);
    ijk = [Y1(end,1) - Y2(end,1),Y1(end,2) - Y2(end,2)];
    E = [E,norm(ijk)];
    %E = [E,norm(ijk)/norm([Y2(end,1),Y2(end,2)])];
end
subplot(1,2,2);
figure(1),hold on,plot(log10([1:400]),log10(E));
%Grafic del error

%H = linspace(1,0.01,100);
%E = [];
%for i = 1:length(H)
%    npassos=ceil((b-a)./H(i)); 
%  [x,Y]=Euler(f,[a,b],y0,npassos);
%    E = [E,abs(Y(end,1)-yanal(b))];
%end
%subplot(1,2,2);
%hold on,plot(log10(H),log10(E))


