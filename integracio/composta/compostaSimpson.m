function Iaprox=compostaSimpson(f,a,b,m)

x = linspace(a,b,m+1); h=(b-a)/m;
Iaprox = 0;
for i = 1:m
    Iaprox = Iaprox + (h/6)*(f(x(i)) + 4*f((x(i) + x(i+1))/2) + f(x(i+1)));
end