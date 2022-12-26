% heat_1d_ftcs.m
% Numerical simulation of the heat equation using 
% forward-time central-space scheme.
clearvars;
close all;

% Domain length
L = pi;
% Thermal diffusivity 
kappa = 0.1;
% Number of grid points
nx = 21;
% Time step size
dt = 0.02;
% Number of time steps
nt = 100;

% Grid step
dx = L/(nx-1);
% Grid
x = dx*(0:(nx-1)).';
% Boundary conditions are periodic

% Initial condition
T0 = sin(x).^4;

% Startup
t = 0;
T = T0;
T_new = T;

% Time iterations
for n = 1:nt
    % Update the values in the bulk flow
    T_new(1) = T(1) + dt * kappa *(T(nx-1)-2*T(1)+T(2))/dx^2;
    T_new(2:nx-1) = T(2:nx-1) + ...
        dt * kappa *(T(1:nx-2)-2*T(2:nx-1)+T(3:nx))/dx^2;
    % Last point holds the same value as the first point 
    T_new(nx) = T_new(1);
    
    % Update
    t = n*dt;    
    T = T_new;
    
    % Plot temperature profiles
    figure(1); clf;
    % Unsteady numerical solution
    plot(x,T,'.-'); hold on;
    
    % Plot the exact solution
    T_exact = 3/8 - 1/2*exp(-4*kappa*t)*cos(2*x) + ...
        1/8*exp(-16*kappa*t)*cos(4*x);
    plot(x,T_exact,'x'); hold on;
    
    % Annotations
    xlabel('x');
    ylabel('T');
    axis([0 pi 0 1]);
    pause(0.01);
end
