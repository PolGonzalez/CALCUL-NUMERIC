function [vect_x,vect_r] = newton_iter(Ini,niter,f,derivada)
    vect_x = zeros(1,niter); 
    vect_r = zeros(1,niter); 
    vect_x(1) = Ini;
    vect_r(1) = 1;
    for i = 1:niter-1
       vect_x(i+1) = vect_x(i) - (f(vect_x(i)))/(derivada(f,vect_x(i)));
       vect_r(i+1) = abs((vect_x(i+1)-vect_x(i))/vect_x(i+1));
    end
end

