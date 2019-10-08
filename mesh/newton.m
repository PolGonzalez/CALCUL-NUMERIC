function [vect_x,vect_r] = newton(Ini,niter,F)
    vect_x = zeros(length(Ini),niter); 
    vect_r = zeros(1,niter);
    vect_x(:,1) = Ini;
    vect_r(1) = 1;
    for i = 1 : niter - 1
        delta = -(numericalHessian(F,(vect_x(:,i)))\numericalDerivative(F,(vect_x(:,i))));
        vect_x(:,i+1) = vect_x(:,i) + delta;
        vect_r(i + 1) = norm(vect_x(:,i + 1) - vect_x(:,i))/norm(vect_x(:,i));
    end
end