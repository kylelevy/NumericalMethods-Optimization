function X = goldenSectionSearch(R,maxOrMin,e)
N = 0;
xl = R(1);
xu = R(2);

GR = (sqrt(5)-1)/2;

xopt = (xl+xu)/2;

while abs(xl-xu) > e*abs(xu)
    N = N + 1;
    d = GR*(xu-xl);
    x1 = xl+d;
    x2 = xu-d;
    f1 = maxOrMin*(2*sin(x1)-(x1^2/30));
    f2 = maxOrMin*(2*sin(x2)-(x2^2/30));

    if(f1 < f2)
        xl = x2;
    elseif(f1 > f2)
        xu = x1;
    end

    xopt = (xl+xu)/2;
end

fxopt = 2*sin(xopt)-(xopt^2/30);
X = [xopt fxopt N];
end