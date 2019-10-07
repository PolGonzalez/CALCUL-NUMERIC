function [J] = jacobi(x)
    C1 = [6,x(3)*sin(x(2)*x(3)),x(2)*sin(x(2)*x(3))];
    C2 =  [x(1)/(sqrt(x(1)^2 + sin(x(3)) + 1.06)),9,cos(x(3)/(sqrt(x(1)^2 + sin(x(3)) + 1.06)))];
    C3 = [3*exp(x(1)*x(2))*x(2),3*exp(x(1)*x(2))*x(1),60];
    J = [C1;C2;C3]; 


end

