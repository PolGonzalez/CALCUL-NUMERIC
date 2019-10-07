format long
niter = 7;
Ini = [0,0,0]'
[vect_x,vect_r] = newton(Ini,niter,@f,@jacobi)