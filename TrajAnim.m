% This script will animate two particles' trajectories in the XY plane
% using parametric function and updating their postitions over time

% Establish parametric functions for particle 1's x and y coordinates
x1 = @(t) 1 + sin(3*pi*t).^2 - sin(pi*t); %X-coordinate fucntion for particle 1
y1 = @(t) sin(2*pi*t).^2; %Y-coordinate function for particle 1
r1 = @(t) [x1(t); y1(t)];

% Establish parametric functions for particle 2's x and y coordinates
x2 = @(t) cos(2*pi*t) / 4 + cos(pi*t).^2; %X-coordinate for particle 2
y2 = @(t) sin(2*pi*t) / 4 + sin(pi*t).^2; %Y-coordinate for particle 2
r2 = @(t) [x2(t); y2(t)];

% Establish the combined vector function representing the positions of both particles
dr = @(t) [x1(t), y1(t), x2(t), y2(t)];

% Establish parameters for the time vector (start, finish, and step size)
t = 0:0.01:2; % Time vector from 0 to 2 seconds with step size 0.01 seconds

% Evaluate the trajectories of both particles at each time point
X1 = x1(t); % X-coordiantes of particle 1
Y1 = y1(t); % Y-coordinates of particle 1
X2 = x2(t); % X-coordinates of particle 2
Y2 = y2(t); % Y-coordiantes of particle 2

% Plotting the particles & their trajectories
figure(1) % Create a new figure window
h1 = plot(X1, Y1, 'ro'); % Plot particle 1 as a red circle
axis([-1 4 -1 3]); % Setting axis limits
xlabel('X'); % Label for x-axis
ylabel('Y'); % Label for y-axis
title('Particle Trajectories Animation') % Set title for plot
hold on % Hold the plot for subsequent updates
h2 = plot(X2, Y2, 'go'); % Plot particle 2 as a green circle
hline1 = plot([0, X1], [0, Y1], '--k'); % Dotted line for particle 1's trajectory
hline2 = plot([0, X2], [0, Y2], '--k'); % Dotted line for particle 2's trajectory
hlineconnect = plot([X1, X2], [Y1, Y2], 'b'); % Solid line connecting the particles

% Animation loop
t0 = 0; % Initial time
tf = 10; % Final time for the animation
dt = 0.001; % Time step size (s)
t = 0; % Initialize time variable
while t < tf
    pause(dt) % Pause to control animation frame rate
    t = t + dt; % Increment time by time step
    % Updating the particle positions & trajectory lines
    set(h1, 'XData', x1(t), 'YData', y1(t)); % Update position of particle 1 
    set(h2, 'XData', x2(t), 'YData', y2(t)); % Update position of particle 2
    set(hline1, 'XData', [0, x1(t)], 'YData', [0, y1(t)]); % Update trajectory line for particle 1
    set(hline2, 'XData', [0, x2(t)], 'YData', [0, y2(t)]); % Update trajectory line for particle 2
    set(hlineconnect, 'XData', [x1(t), x2(t)], 'YData', [y1(t), y2(t)]); % Update the line connecting particles
    drawnow % Update the plot
end

