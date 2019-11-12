function [y] = pesos(x,a,b)
% CALCULEM ELS PESOS PER A OBTENIR UNA QUADRATURA DE GRAU N O MAJOR
    A = [];
    B = [];
    for i = 0:length(x)-1
        A = [A;x.^i];
        B = [B;(b^(i+1)-a^(i+1))/(i+1)];
    end
    y = A\B;
end

