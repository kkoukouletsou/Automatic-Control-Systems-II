%% LAB 4 - Part A

clear 
clc
close all 

load("lab4a.mat");

figure
plot(timeData, positionData, 'LineWidth', 1);
grid on
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part A', 'Interpreter','latex');

figure
plot(timeData, velocityData, 'LineWidth', 1, 'Color', [0.8500 0.3250 0.0980]);
grid on
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part A', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, positionHatData, 'LineWidth', 1, 'Color',[0.6350 0.0780 0.1840]);
grid on
legend('Real Position', 'Estimated Position', 'Interpreter','latex');
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part A', 'Interpreter','latex');

figure
plot(timeData, velocityData, 'LineWidth', 1);
hold on 
plot(timeData, velocityHatData, 'LineWidth', 1, 'Color',[0.6350 0.0780 0.1840]);
grid on
legend('Real velocity', 'Estimated velocity', 'Interpreter','latex')
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part A', 'Interpreter','latex');


figure
plot(timeData, uData, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Control Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part A', 'Interpreter','latex');

%% LAB 4 - Part B
clear 
clc

load("lab4b.mat");

figure
plot(timeData, positionData, 'LineWidth', 1);
grid on
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');

figure
plot(timeData, velocityData, 'LineWidth', 1, 'Color', [0.8500 0.3250 0.0980]);
grid on
title('velocity')
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, positionHatData, 'LineWidth', 1, 'Color',[0.6350 0.0780 0.1840]);
grid on
legend('Real Position', 'Estimated Position', 'Interpreter','latex')
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');

figure
plot(timeData, velocityData, 'LineWidth', 1);
hold on 
plot(timeData, velocityHatData, 'LineWidth', 1, 'Color',[0.6350 0.0780 0.1840]);
grid on
legend('Real Velocity', 'Estimated Velocity', 'Interpreter','latex')
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');

figure
plot(timeData, uData, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Controller Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, 5 * ones(size(timeData)), 'LineWidth', 1, 'Color', [0.4660 0.6740 0.1880]);
grid on
legend('Real Position', 'Desired Position', 'Interpreter','latex')
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 4 - Part B', 'Interpreter','latex');
ylim([1.5 5.05])

