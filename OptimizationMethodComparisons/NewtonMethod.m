function [SOL, N] = NewtonMethod(guess, S)

x_val = guess;
x_prev = [100000000, 100000000];

% Partial derivatives of f(x,y)
fx = @(x,y) (-2*x^2 + 1)*(y*exp(-(x^2 + y^2)));
fy = @(x,y) (-2*y^2 + 1)*(x*exp(-(x^2 + y^2)));
fxx = @(x,y) (4*x^3 - 6*x)*(y*exp(-(x^2 + y^2)));
fyy = @(x,y) (4*y^3 - 6*y)*(x*exp(-(x^2 + y^2)));
fxy = @(x,y) (-2*y^2 + 1 +4*x^2*y^2 - 2*x^2)*(exp(-(x^2 + y^2)));

e = 0.0001;
N = 0;

while abs((x_prev(1) - x_val(1))) > abs(e*x_prev(1)) && abs((x_prev(2) - x_val(2))) > abs(e*x_prev(2))
    N = N + 1;
    x_prev = x_val;
    
    fx_val = fx(x_val(1), x_val(2));
    fy_val = fy(x_val(1), x_val(2));
    fxx_val = fxx(x_val(1), x_val(2));
    fyy_val = fyy(x_val(1), x_val(2));
    fxy_val = fxy(x_val(1), x_val(2));

    H = [fxx_val, fxy_val;...
         fxy_val,fyy_val];

    G = [fx_val;  fy_val];

    D = S .* inv(H) * G;

    x_val = x_val - D.';
end

SOL = [x_val, N];
end