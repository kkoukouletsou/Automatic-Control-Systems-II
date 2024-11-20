%% LAB 2 - PART A
clear 
clc
close all

load("lab2_A.mat");

figure
plot(timeData,positionData, 'LineWidth', 1);
grid on
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part A', 'Interpreter','latex');

figure
plot(timeData,velocityData, 'LineWidth', 1, 'Color', [0.8500 0.3250 0.0980]);
grid on
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part A', 'Interpreter','latex');

figure
plot(timeData,eData, 'LineWidth', 1);
grid on
ylabel('Error', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part A', 'Interpreter','latex');

figure
plot(timeData,uData, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Controller Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part A', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, 5 * ones(size(timeData)), 'LineWidth', 1, 'Color', [0.4660 0.6740 0.1880]);
grid on
legend('Real Position', 'Desired Position', 'Interpreter','latex');
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part A', 'Interpreter','latex');
ylim([1.05 5.05]);

%% LAB 2 - PART B
clear 
clc

load("lab2_B.mat")

figure
plot(timeData,positionData, 'LineWidth',1);
grid on
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part B', 'Interpreter','latex');

figure
plot(timeData,velocityData, 'LineWidth', 1,'Color', [0.8500 0.3250 0.0980]);
grid on
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part B', 'Interpreter','latex');

figure
plot(timeData,eData, 'LineWidth',1);
grid on
ylabel('Error', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part B', 'Interpreter','latex');

figure
plot(timeData,uData, 'LineWidth', 1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Controller Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part B', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth',1);
hold on
plot(timeData, 5* ones(size(timeData)), 'LineWidth',1, 'Color', [0.4660 0.6740 0.1880]);
grid on
legend('Real Position', 'Desired Position', 'Interpreter','latex');
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part B', 'Interpreter','latex');
ylim([1.05 5.05])

%% LAB 2 - PART C

clear 
clc

% load("lab2_C3_wmega_1.mat"); % ω = 1 rad/s
% load("lab2_C3_wmega_5.mat"); % ω = 5 rad/s
load("lab2_C3_wmega_15.mat"); % ω = 15 rad/s

figure
plot(timeData, positionData, 'LineWidth', 1);
grid on
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part C', 'Interpreter','latex');

figure
plot(timeData,velocityData, 'LineWidth', 1, 'Color', [0.8500 0.3250 0.0980]);
grid on
ylabel('Velocity', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part C', 'Interpreter','latex');

figure
plot(timeData,eData, 'LineWidth',1);
grid on 
ylabel('Error', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part C', 'Interpreter','latex');

figure
plot(timeData,uData, 'LineWidth',1, 'Color', [0.4940 0.1840 0.5560]);
grid on
ylabel('Controller Input u', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part C', 'Interpreter','latex');

figure
plot(timeData, positionData, 'LineWidth', 1);
hold on
plot(timeData, reference, 'LineWidth', 1, 'Color', [0.4660 0.6740 0.1880]);
grid on 
legend('Real Position', 'Desired Position', 'Interpreter', 'latex');
ylabel('Position', 'Interpreter','latex');
xlabel('Time', 'Interpreter','latex');
title('Lab 2 - Part C', 'Interpreter','latex');
