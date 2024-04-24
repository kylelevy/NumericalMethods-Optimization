function X = bisectionSearch(R,e)
N = 0;
xu = R(1);
xl = R(2);

xopt = (xu+xl)/2;
xopt_prev = inf;

while abs(xopt-xopt_prev) > abs(e*xopt)
    N = N + 1;
    xr = (xu+xl)/2;
    f1 = 2*cos(xu)-(xu/15);
    f2 = 2*cos(xr)-(xr/15);

    if(sign(f1) == sign(f2))
        xu = xr;
    else
        xl = xr;
    end

    xopt_prev = xopt;
    xopt = (xu+xl)/2;
end

fxopt = 2*sin(xopt)-(xopt.^2/30);
X = [xopt fxopt N];
end