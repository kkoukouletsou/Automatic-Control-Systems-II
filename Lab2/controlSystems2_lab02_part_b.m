% Control Systems II - Lab 02

% Create Arduino Object
if ~exist('a','var')
        a = arduino;
end

%
Vref_arduino = 5.089;
V_7805 = 5.3764;


%
w = 15;
getPos = @(t) 5 + 2 * sin(w * t);

positionData = [];
velocityData = [];
uData = [];
eData = [];
timeData = [];
reference = [];


% OUTPUT ZERO CONTROL SIGNAL TO STOP MOTOR  %
writePWMVoltage(a, 'D6', 0)
writePWMVoltage(a, 'D9', 0)

% Wait a key to proceed
disp(['Connect cable from Arduino to Input Power Amplifier and then press enter to start controller']);
pause()

% DEfine Controller Gains
k_0 = 0.23334;
k_mi = 1/36;
k_m = 210.52;
k_t = 0.0038;
T_m = 0.473;



k1 = 1.5; % k1 > -1/k
k2 = 4;
kr = k2;


% Start Clock
tic

t = 0;
e = 0;


if k1 <= -1/k_m || k2 <= 0
    disp("System is unstable. Process terminated.");
    return
end

while t < 7

    position = readVoltage(a, 'A5'); % position
    velocity = readVoltage(a, 'A3'); % velocity

    x2 = 3 * Vref_arduino * position / 5;
    x1 = 2 * (2 * velocity * Vref_arduino / 5 - V_7805);

    desiredPosition = getPos(t); 
    e = x2 - desiredPosition;

    u = - k1 * x1 - k2 * x2 + kr * desiredPosition;
    
    if u > 0
        writePWMVoltage(a, 'D6', 0);
        writePWMVoltage(a, 'D9', min(abs(u) / 2, 5));
    else
        writePWMVoltage(a, 'D9', 0);
        writePWMVoltage(a, 'D6', min(abs(u) / 2, 5));
    end


t = toc;

    
reference = [reference desiredPosition];
timeData = [timeData t];
uData = [uData u];

positionData = [positionData x2];
velocityData = [velocityData x1];
eData = [eData e];

end

% OUTPUT ZERO CONTROL SIGNAL TO STOP MOTOR  %

writePWMVoltage(a, 'D6', 0)
writePWMVoltage(a, 'D9', 0)

disp(['End of control Loop. Press enter to see diagramms']);
pause();


figure
plot(timeData,positionData);
% hold on 
% plot(timeData, reference);
title('position')

figure
plot(timeData,velocityData);
title('velocity')

figure
plot(timeData,eData);
title('error')

figure
plot(timeData,uData);
title('controller u')

figure
plot(timeData, positionData);
hold on
plot(timeData, reference);
title("desired vs real");

% save('lab2_C3_wmega_1.mat', 'timeData', 'positionData', 'velocityData', 'eData', 'reference', 'uData');
% save('lab2_C3_wmega_5.mat', 'timeData', 'positionData', 'velocityData', 'eData', 'reference', 'uData');
save('lab2_C3_wmega_15.mat', 'timeData', 'positionData', 'velocityData', 'eData', 'reference', 'uData');


disp('Disonnect cable from Arduino to Input Power Amplifier and then press enter to stop controller');
pause();

