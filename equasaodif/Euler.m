function [x,Y] = Euler(f,int,y0,npassos)
b = int(2); a = int(1);
h = (b-a)/npassos;
x = [a:h:b];
prova = f(0,y0);
Y = zeros(length(x),length(prova));
Y (1,:) = y0;
for i = 1:npassos
    Y(i + 1,:) = Y(i,:) + h.*f(x(i),Y(i,:)')';
end
end