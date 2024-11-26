% Control Systems II - Lab 04

% Create Arduino Object
if ~exist('a', 'var')
    a = arduino;
end

%
Vref_arduino = 5.089;
V_7805 = 5.3764;

positionData = [];
velocityData = [];
positionHatData = [];
velocityHatData = [];
timeData = [];
uData = [];

% OUTPUT ZERO CONTROL SIGNAL TO STOP MOTOR  
writePWMVoltage(a, 'D6', 0)
writePWMVoltage(a, 'D9', 0)

% Wait a key to proceed
disp(['Connect cable from Arduino to Input Power Amplifier and then press enter to start controller']);
pause()

% Define Controller Gains
k_0 = 0.23334;
k_mi = 1/36;
k_m = 210.52;
k_t = 0.0038;
T_m = 0.473;

%
initialPosition = 2;
desiredPosition = 5;

% Start Clock
t = 0;
tic

A = [-1/T_m 0; k_mi * k_0 0];
B = [k_m/T_m; 0];
C = [0 1];


P1 = 10;
P2 = 0.000001;

W = [C; C * A];
Winv = inv(W);
Wtilde = [1 0; 1/T_m 1];

L = Winv * Wtilde * [P1 - 1/T_m; P2];

xhat = [0; 0];
u = 0;

k1 = 1 * k_t;
k2 = 4.7; % 4.3 ?
kr = k2;

AHat = A - L * C;

eigenvalues = eig(AHat);
realParts = real(eigenvalues);

stabilityCheck4 = all(realParts < 0);

if stabilityCheck4 == 0
    disp("eigenvalues are negative, process terminated.");
    return
end
 

while t < 5


    position = readVoltage(a, 'A5'); % position
    velocity = readVoltage(a, 'A3'); % velocity
    x2 = 3 * Vref_arduino * position / 5;
    x1 = 2 * (2 * velocity * Vref_arduino / 5 - V_7805);
    x1 = x1/k_t;

    y = x2;
    xhatdot = A * xhat + B * u + L * (y - C * xhat); 
    
    dt = toc - t;
    xhat = xhat + xhatdot * dt;
    
    x1hat = xhat(1);
    x2hat = xhat(2);

    u = - k1 * x1hat - k2 * x2hat + kr * desiredPosition;
    
    if u > 0
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', min(abs(u) / 2, 5));
    else
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D6', min(abs(u) / 2, 5));
    end

    t = toc;

    timeData = [timeData t];
    positionData = [positionData x2];
    velocityData = [velocityData x1];
    positionHatData = [positionHatData xhat(2)];
    velocityHatData = [velocityHatData xhat(1)];
    uData = [uData u];
end

% OUTPUT ZERO CONTROL SIGNAL TO STOP MOTOR  %
writePWMVoltage(a, 'D6', 0)
writePWMVoltage(a, 'D9', 0)


disp(['End of control Loop. Press enter to see diagramms']);
pause();


figure
plot(timeData, positionData);
title('position')

figure
plot(timeData, velocityData);
title('velocity')

figure
plot(timeData, positionData);
hold on
plot(timeData, positionHatData);
legend('real position', 'estimated position');
title('position')

figure
plot(timeData, velocityData);
hold on 
plot(timeData, velocityHatData);
legend('real velocity', 'estimated velocity')
title('velocity')

figure
plot(timeData, uData);
title('controller u')

figure
plot(timeData, positionData);
hold on
plot(timeData, 5 * ones(size(timeData)));
title("desired vs real");

save('lab4b.mat', 'timeData', 'positionData', 'velocityData', 'positionHatData', 'velocityHatData', 'uData');

disp('Disonnect cable from Arduino to Input Power Amplifier and then press enter to stop controller');
pause();

