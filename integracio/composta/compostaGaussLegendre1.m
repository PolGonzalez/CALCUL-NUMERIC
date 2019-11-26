function Iaprox=compostaGaussLegendre1(f,a,b,m)
[z,w] = QuadraturaGauss(2);
x = linspace(a,b,m+1); h=(b-a)/m;
Iaprox = 0;
for i = 1:m
    for j = 1:2
       Iaprox = Iaprox + (h/2)*w(j)*f((h/2)*z(j) + (x(i)+x(i+1))/2);  
    end
end