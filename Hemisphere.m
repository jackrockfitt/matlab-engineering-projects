function [t, x, z, dxdt, dzdt] = Hemisphere(R, h, Tf)
% HEMISPHERE – Simulates the motion of a pendulum in a frictionless
% hemispherical basin, solving and plotting its vertical motion over time.
%
% Inputs:
%   R  – Radius of the hemisphere (must be > 0)
%   h  – Initial height of the pendulum (must be > 0 and < R)
%   Tf – Total duration of simulation (must be > 0)
%
% Usage:
%   [t, x, z, dxdt, dzdt] = Hemisphere(5, 3, 10);

    % Validate inputs
    if R <= 0 || h <= 0 || Tf <= 0 || h >= R
        error('Invalid input values. R, h, and Tf must be positive; h must be less than R.')
    end

    % Physical constant
    g = 9.81; % gravitational acceleration (m/s^2)

    % Initial conditions
    z0 = h; % Initial vertical position
    x0 = R * sqrt(1 - (1 - z0 / R)^2); % Initial horizontal position
    dzdt0 = 0; % Initial vertical velocity
    dxdt0 = 0; % Initial horizontal velocity

    % Display initial position
    fprintf('Initial position: (%.2f, %.2f)\n', x0, z0);

    % Define system of differential equations
    odefun = @(t, y) [
        y(3); % dx/dt
        y(4); % dz/dt
        g/R * (3 * sqrt(1 - (y(1)/R)^2) - 2 * (1 - h/R)); % d²x/dt²
        g * (2*h/g - ((4 + 2*(h/R)) * y(2)/R) + 3 * (y(2)/R)^2) % d²z/dt²
    ];

    % Solve the system using ode45
    [t, y] = ode45(odefun, [0 Tf], [x0; z0; dxdt0; dzdt0]);

    % Extract outputs
    x = y(:,1);     % x-position
    z = y(:,2);     % z-position
    dxdt = y(:,3);  % horizontal velocity
    dzdt = y(:,4);  % vertical velocity

    % Calculate small-angle period
    T_small = 2 * pi * sqrt(R / g);

    % Plot vertical motion
    figure(2);
    plot(t, z);
    title('Vertical Motion of the Pendulum');
    xlabel('Time (s)');
    ylabel('Height (m)');
    xlim([0 Tf]);
    ylim([0 R]);

    % Display the small-angle period
    fprintf('Small-angle period (approx.): %.2f seconds\n', T_small);
end
