# Lorenz Equations Solver (Butterfly Effect)

## Background
The butterfly effect is the phenomenon in which small changes can lead to drastically different outcomes. This effect can be mathematically demonstrated by the Lorenz Equations, a system of ordinary differential equations with modifyable parameters. The lorenz equations are as follows:

$$
\frac{dx}{dt} = \sigma (y-x) \\

\frac{dy}{dt} = x (\rho - z) - y \\

\frac{dz}{dt} = xy - \beta z \\
$$

The parameters are defined as the constants $\sigma, \rho, \text{and } \beta$.

These equations appear in many areas of science such as laser modelling, chemistry, analog circuits, and so on. Although they are simple, they have no analytical solution and require numerical methods to solve.

## Euler's Method

Euler's Method takes advantage of the numerical approximation for a derivative to predict the next value based on the current slope. For more details click [here](https://en.wikipedia.org/wiki/Euler_method#First-order_example).

$$
f(x,y) = \frac{dy}{dx} \approx  \frac{\Delta y}{\Delta x} = \frac{y_1 - y_0}{x_1 - x_0} \\

y_1 \approx y_0 + f(x,y) * (x_1 - x_0)
$$

## Runge-Kutta (4th Order)

The Runge-Kutta method uses the same starting point as Euler's method in approximating the next value based on the slope and the step size, however, the Runge-Kutta method uses an increment function which is more accurate than the instantaious slope.

$$
y_1 \approx y_0 + \phi(x,y) * (x_1 - x_0) \\
$$

The increment function is derrived using a summation of terms from the Taylor Series of the function, however, the most common application of the Runge-Kutta method is the 4th order approixmation often called RK4. This approximation is defined as follows:

$$
\phi(x,y) = \frac{1}{6}(k_1 + 2k_2 + 2k_3 + k_4) \\

k_1 = f(x_i, y_i) \\
k_2 = f(x_i + \frac{1}{2}h, y_i + \frac{1}{2}k_1h) \\
k_3 = f(x_i + \frac{1}{2}h, y_i + \frac{1}{2}k_2h) \\
k_4 = f(x_i+h, y_i+k_3h) \\

$$

This gives a much more accurate approximation of where the next point will be by factoring in multiple slopes taken between the approximate value and the current value. For more details click [here](https://en.wikipedia.org/wiki/Runge%E2%80%93Kutta_methods).