function [x, y, z] = rk4(x0, y0, z0, tspan, sigma, rho, beta)
    dt = tspan(2) - tspan(1); % time step
    N = length(tspan);
    x = zeros(1,N); y = x; z = x;
    x(1) = x0; y(1) = y0; z(1) = z0; % initial conditions
    
    for j = 1:N-1
        t = tspan(j);
        k1x = sigma*(y(j)-x(j));
        k1y = x(j)*(rho-z(j))-y(j);
        k1z = x(j)*y(j)-beta*z(j);
        
        k2x = sigma*(y(j)+k1y*dt/2 - x(j)-k1x*dt/2);
        k2y = (x(j)+k1x*dt/2)*(rho-z(j)-k1z*dt/2) - (y(j)+k1y*dt/2);
        k2z = (x(j)+k1x*dt/2)*(y(j)+k1y*dt/2) - beta*(z(j)+k1z*dt/2);
        
        k3x = sigma*(y(j)+k2y*dt/2 - x(j)-k2x*dt/2);
        k3y = (x(j)+k2x*dt/2)*(rho-z(j)-k2z*dt/2) - (y(j)+k2y*dt/2);
        k3z = (x(j)+k2x*dt/2)*(y(j)+k2y*dt/2) - beta*(z(j)+k2z*dt/2);
        
        k4x = sigma*(y(j)+k3y*dt - x(j)-k3x*dt);
        k4y = (x(j)+k3x*dt)*(rho-z(j)-k3z*dt) - (y(j)+k3y*dt);
        k4z = (x(j)+k3x*dt)*(y(j)+k3y*dt) - beta*(z(j)+k3z*dt);
        
        x(j+1) = x(j) + (k1x + 2*k2x + 2*k3x + k4x)*dt/6;
        y(j+1) = y(j) + (k1y + 2*k2y + 2*k3y + k4y)*dt/6;
        z(j+1) = z(j) + (k1z + 2*k2z + 2*k3z + k4z)*dt/6;
    end
end