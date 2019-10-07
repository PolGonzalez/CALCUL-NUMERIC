function [y] = f(x)
    y(1) = 6*x(1) - 2*cos(x(2)*x(3)) - 1;
    y(2) = 9*x(2) + sqrt(x(1)^2 + sin(x(3)) + 1.06) + 0.9;
    y(3) = 60*x(3) + 3*exp(x(1)*x(2)) + 10*pi - 3;
end

