function distorsioMalla = calculaDistorsioMalla(X,T)
%
% distorsioMalla = calculaDistorsioMalla(X,T)

A = [
    1  -sqrt(3)/3
    0   2*sqrt(3)/3
    ];
dist = 0;
    for i = 1 : 26
        vertex = T(i,:);
        F1 = X(vertex(2),:) - X(vertex(1),:);
        F2 = X(vertex(3),:) - X(vertex(1),:);
        M = [F1;F2];
        Dphi = M'*A;
        dist = dist + ((norm(Dphi,'fro')^2)/(2*abs(det(Dphi))))^2;
    end
    distorsioMalla = sqrt(dist);
end