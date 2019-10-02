function [y] = derivada(f,x)
    h = (sqrt(2.2*10^(-10))*x);
    y = (f(x+h)-f(x-h))/(2*h)
end

