clear
Ini = -1;
niter = 20;
Int = [-1,1]
[vect_x,vect_r] = newton_iter(Ini,niter,@polinomi,@derivada);
[vectb_x,vectb_r] = biseccio_iter(Int,niter,@polinomi);
vect_x(niter)
vect_r(niter)
X = 1:20;
plot(X,log(vect_r),X,log(vectb_r));
