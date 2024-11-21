%% LAB 3 

clear 
clc
close all

load("lab3.mat");

figure
plot(timeData, positionData, 'LineWidth', 1);
grid on 
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');

figure
plot(timeData, velocityData, 'LineWidth', 1, 'Color', [0.8500 0.3250 0.0980]);
grid on
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');

figure
plot(timeData, eData, 'LineWidth', 1);
grid on
ylabel('Error', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');

figure 
plot(timeData, zData, 'LineWidth', 1, 'Color', [0.6350 0.0780 0.1840]);
grid on
ylabel('z Data', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, 5 * ones(size(timeData)), 'LineWidth', 1, 'Color', [0.4660 0.6740 0.1880]);
grid on
legend('Real Position', 'Desired Position', 'Interpreter','latex');
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');

figure 
plot(timeData, uData, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Controller Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 3', 'Interpreter','latex');


