function [t, x, z, dxdt, dzdt] = Hemisphere(R, h, Tf)

% This function simulates the motion of a pendulum in a frictionless
% hemispherical basin, plotting vertical motion over time, considering
% gravitational effects and initial conditions
% Inputs:
%   - R: Radius of the hemisphere.
%   - h: Initial height of the pendulum.
%   - Tf: Desired duration of the simulation.
% Please note: Users need to input the values using Hemisphere(R,h,Tf); syntax.

    % Checking the input values are valid
    if R <= 0 || h <= 0 || Tf <= 0 || h >= R
        error('Invalid input values. R, h, and Tf must be positive; h must be less than R.')
    end

    % Defining the gravitational constant
    g = 9.81; % (m/s^2)

    % Setting the initial conditions
    z0 = h; % Initial veritcal position (height) of the pendulum
    x0 = R * sqrt(1 - (1 - z0 / R)^2); % Initial horizontal position (along the surface of the hemisphere)
    dzdt0 = 0; % Initial vertical velocity of the pendulum
    dxdt0 = 0; % Initial horizontal velocity of the pendulum

    % Displaying the initial position
    fprintf('Initial position: (%0.2f, %0.2f).\n', x0, z0);

    % Define the differential equations of motion for the pendulum
    odefun = @(t, y) [y(3); y(4); g/R*(3*sqrt(1-(y(1)/R)^2)-2*(1-h/R)); ...
                      g*(2*h/g-(4+2*(h/R))*y(2)/R+3*(y(2)/R)^2)];

    % Solving the differential equations
    [t, y] = ode45(odefun, [0 Tf], [x0; z0; dxdt0; dzdt0]);

    % Extracting the position and velocity vectors
    x = y(:,1); % x-coordinate over time
    z = y(:,2); % z-coordinate over time
    dxdt = y(:,3); % dx/dt (velocity) over time
    dzdt = y(:,4); % dz/dt (velocity) over time

    % Calculating the small oscillation period (assuming small angle
    % approximation)
    T_small = 2 * pi * sqrt(R / g);

    % Plotting the vertical motion
    figure(2); % Create new figure for plotting
    plot(t, z); % Plot height (z) over time (t)
    title('Vertical Motion of the Pendulum'); % Set plot title
    xlabel('Time (s)'); % Label x-axis
    ylabel('Height (m)'); % Label y-axis
    xlim([0 Tf]); % Set x-axis limits
    ylim([0 h]); % Set y-axis limits

    % Display the Period, T, for small-angle approximation
    fprintf('Period, T, for small-angle approximation: %0.2f seconds.\n', T_small);
end
