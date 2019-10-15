function d2S = calculaCurvaturesSplineNatural(x,y)
    i = 2:length(x)-1;
    heo = [x(2) - x(1),x(i + 1) - x(i)];
    tieo = [y(2) - y(1),y(i + 1) - y(i)];
    i = 2:length(x)-2;
    lambdeo = [heo(2)./(heo(2) + heo(1)),heo(i + 1)./(heo(i + 1) + heo(i))];
    mueo = [tieo(2)./(tieo(2) + tieo(1)),tieo(i + 1)./(tieo(i + 1) + tieo(i))];
    deeo = [(6./(heo(2) + heo(1))*(tieo(2)./heo(2) - tieo(1)./heo(1))
    ,(6./(heo(i + 1) + heo(i))*(tieo(i + 1)./heo(i + 1) - tieo(i)./heo(i))];
end

