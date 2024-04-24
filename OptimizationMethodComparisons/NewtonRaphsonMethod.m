function X = NewtonRaphsonMethod(R,g,e)
N = 0;

% First and second derivatives of f(x)
f = @(x) 2*sin(x) - x^2 / 30;
df = @(x) 2*cos(x) - x / 15;
ddf = @(x) -2*sin(x) - 1/15;

xopt = g;
xopt_prev = 10000000;

while abs(xopt_prev-xopt) > abs(e*xopt_prev)
    N = N + 1;
    xopt_prev = xopt;
    xopt = xopt_prev - df(xopt) / ddf(xopt);
end

X = [xopt, f(xopt) , N];
end