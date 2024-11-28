% Control Systems II - Lab 03

% Create Arduino Object
if ~exist('a','var')
    a = arduino;
end
%
Vref_arduino = 5.089;
V_7805 = 5.3764;

%
initialPosition = 2;
desiredPosition = 5;

positionData = [];
velocityData = [];
zData = [];
eData = [];
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

% Decide Controller Gains


k1 = 1.1; 
k2 = 3.2;
ki = 6.8;


% p1 = 2;
% p2 = 3;
% p3 = 4;
% 
% k1 = (T_m * (p1 + p2 + p3) - 1)/(k_m);
% k2 = (T_m * (p1 * p2 + p2 * p3 + p3 * p1))/(k_m * k_mi * k_0);
% ki = (T_m * p1 * p2 * p3)/(k_m * k_mi * k_0);


if ki <= 0 || k1 <= -1/k_m || (1 + k1 * k_m) * k2 <= T_m * ki
    disp("System is unstable. Process terminated.");
    return
end


% Start Clock
tic
t = 0;
e = 0;
z = 0;

while t < 7

    position = readVoltage(a, 'A5'); % position
    velocity = readVoltage(a, 'A3'); % velocity

    x2 = 3 * Vref_arduino * position / 5;
    x1 = 2 * (2 * velocity * Vref_arduino / 5 - V_7805);

    e = x2 - desiredPosition;

    z = z + (x2 - desiredPosition) * (toc - t);

    u = - k1 * x1 - k2 * x2 - ki * z;
   
    if u > 0
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', min(abs(u) / 2, 5));
    else
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D6', min(abs(u) / 2, 5));
    end
    timeData = [timeData t];
    positionData = [positionData x2];
    velocityData = [velocityData x1];
    eData = [eData e];
    uData = [uData u];
    zData = [zData z];
    t = toc;

end

% OUTPUT ZERO CONTROL SIGNAL TO STOP MOTOR  %
writePWMVoltage(a, 'D6', 0)
writePWMVoltage(a, 'D9', 0)


disp(['End of control Loop. Press enter to see diagramms']);
pause();


figure
plot(timeData,positionData);
title('position')

figure
plot(timeData,velocityData);
title('velocity')

figure
plot(timeData,eData);
title('error')

figure 
plot(timeData, zData);
title("z Data");

figure
plot(timeData, positionData);
hold on
plot(timeData, 5 * ones(size(timeData)));
title("desired vs real");

figure 
plot(timeData, uData);
title("controller u");

save('lab3.mat', 'timeData', 'positionData', 'velocityData', 'eData', 'uData', 'zData');

disp('Disonnect cable from Arduino to Input Power Amplifier and then press enter to stop controller');
pause();




