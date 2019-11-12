clear;
a = 0;
b = 5;
R = exp(-a) - exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4));
err = [];
for n = 1:14
    x = linspace(a,b,n + 1);
    y = pesos(x,a,b);
    I = 0;
    for i = 1:n + 1
        I = I + y(i)*f(x(i));
    end
    err = [err,(I-R)/R];
end
plot([1:14],log10(err));