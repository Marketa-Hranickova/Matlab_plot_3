clear; close all; clc;

t_span = [0 10]; 
y0 = [1; 1; 1; 1]; 
p = parameters_3(); 

% SIMPLE MODEL
[ts, ys] = ode45(@(t,y) simple_plot_3(t,y,p), t_span, y0);

% CASE 1
p1 = p; p1.case_type = 1;
[t1, y1] = ode15s(@(t,y) complex_3(t,y,p1), t_span, y0);

%CASE 2
p2 = p; p2.case_type = 2;
[t2, y2] = ode15s(@(t,y) complex_3(t,y,p2), t_span, y0);

% --- PLOTS CASE 1---
figure('Name', 'Simple vs Case 1', 'Color', 'w');

subplot(2,2,1); 
plot(ts, ys(:,1), 'g', 'LineWidth', 1.5); hold on;
plot(t1, y1(:,1), 'b--', 'LineWidth', 1.2);
title('x_1(t)'); grid on; legend('Simple', 'Case 1');

subplot(2,2,2); 
plot(ts, ys(:,2), 'g', 'LineWidth', 1.5); hold on;
plot(t1, y1(:,2), 'b--', 'LineWidth', 1.2);
title('x_2(t)'); grid on;

subplot(2,2,3); 
plot(ts, ys(:,3), 'g', 'LineWidth', 1.5); hold on;
plot(t1, y1(:,3), 'b--', 'LineWidth', 1.2);
title('v_1(t)'); grid on;

subplot(2,2,4); 
plot(ts, ys(:,4), 'g', 'LineWidth', 1.5); hold on;
plot(t1, y1(:,4), 'b--', 'LineWidth', 1.2);
title('v_2(t)'); grid on;


% --- PLOTS CASE 2 ---
figure('Name', 'Simple vs Case 2', 'Color', 'w');

subplot(2,2,1); 
plot(ts, ys(:,1), 'g', 'LineWidth', 1.5); hold on;
plot(t2, y2(:,1), 'r--', 'LineWidth', 1.2);
title('x_1(t)'); grid on; legend('Simple', 'Case 2');

subplot(2,2,2); 
plot(ts, ys(:,2), 'g', 'LineWidth', 1.5); hold on;
plot(t2, y2(:,2), 'r--', 'LineWidth', 1.2);
title('x_2(t)'); grid on;

subplot(2,2,3); 
plot(ts, ys(:,3), 'g', 'LineWidth', 1.5); hold on;
plot(t2, y2(:,3), 'r--', 'LineWidth', 1.2);
title('v_1(t)'); grid on;

subplot(2,2,4); 
plot(ts, ys(:,4), 'g', 'LineWidth', 1.5); hold on;
plot(t2, y2(:,4), 'r--', 'LineWidth', 1.2);
title('v_2(t)'); grid on;