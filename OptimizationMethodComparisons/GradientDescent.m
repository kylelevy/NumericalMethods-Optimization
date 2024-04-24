function [SOL, N] = GradientDescent(guess, S)
x_val = guess;
x_prev = [10000000, 10000000];

G = @(x,y) [(-2*x^2 + 1)*(y*exp(-(x^2 + y^2))), (-2*y^2 + 1)*(x*exp(-(x^2 + y^2)))];

e = 0.0001;
N = 0;
MAX_ITER = 10^6;

while abs(norm(G(x_val(1), x_val(2)))) > e
    N = N + 1;
    x_prev = x_val;
    x_val = x_prev - S*G(x_prev(1), x_prev(2));

    if N > MAX_ITER
        disp("The maximum number of iterations has been reached.");
        break % Max iterations to prevent infinite loop
    end
    
end

SOL = [x_val, N];
end