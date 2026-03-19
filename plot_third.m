clear; close all; clc;

p = parameters_3(); 
t_span = [0 10]; 
y0 = [1; 1; 1; 1]; % Initial contitions


[t, y] = ode45(@(t,y) simple_plot_3(t,y,p), t_span, y0);
[t2, y2] = ode45(@(t,y) simple_plot_3(t,y,p), t_span, y0);


x1 = y(:,1); x2 = y(:,2);
v1 = y(:,3); v2 = y(:,4);
abs_x = sqrt(x1.^2 + x2.^2);
abs_v = sqrt(v1.^2 + v2.^2);
J = arrayfun(@(i) p.J(x1(i), x2(i), p.a, p.b), 1:length(t));

% --- PLOTS ---

% 1. Graf: Jednotlivé stavy x a v
figure('Name', 'Systems', 'Color', 'w');
subplot(2,2,1); plot(t, x1, 'b', 'LineWidth', 1.5); title('x_1(t)'); grid on;
subplot(2,2,2); plot(t, x2, 'r', 'LineWidth', 1.5); title('x_2(t)'); grid on;
subplot(2,2,3); plot(t, v1, 'g', 'LineWidth', 1.5); title('v_1(t)'); grid on;
subplot(2,2,4); plot(t, v2, 'm', 'LineWidth', 1.5); title('v_2(t)'); grid on;

% 2. Graf: Absolutní hodnoty (Normy)
figure('Name', 'Norms', 'Color', 'w');
subplot(2,1,1); plot(t, abs_x, 'r', 'LineWidth', 2); title('||x(t)||_2'); grid on;
subplot(2,1,2); plot(t, abs_v, 'color', [0.5 0.5 0.5], 'LineWidth', 2); title('||v(t)||_2'); grid on;

% 3. Graf: Účelová funkce J
figure('Name', 'Function J', 'Color', 'w');
plot(t, J, 'LineWidth', 2, 'Color', [0 .5 0]);
title('J(t)');
xlabel('t [s]'); ylabel('J'); grid on;