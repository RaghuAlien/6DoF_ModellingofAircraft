
% Mass properties
mass = 36100/2.2046; % 36100 lbs
Ixx = 22789*14.59/10.764; % slugs ft2 -> Kg m2                                                         
Iyy = 176809*14.59/10.764;                                                              
Izz = 191744*14.59/10.764;                                                            
Ixz = 2305*14.59/10.764;                                                            
InertiaTensor = [Ixx 0 -Ixz; 0 Iyy 0; -Ixz 0 Izz];                                                           

% Aircraft Data
S = 400.0*0.3048*0.3048; % ft2 -> m2 (Wing planform area)                                                                    
cbar = 11.52*0.3048; % ft -> m; Mean Aerodynamic Chord (MAC)                                                                   
b = 37.4*0.3048; % ft -> m (Wing Span)

% CoG point in meter
x_cg = 0.238*cbar; % CG location referenced from the leading edge of the mean aerodynamic chord                          
y_cg = 0;                                                                   % m (+ is to the right of ref. plane)
z_cg = 0;                                                                % m (+ is below the ref. plane)
CG_position = [x_cg;y_cg;z_cg];             % in meter
g = 9.80665;                                                                % m/s2


% Engine Data
rho_sl = 1.225;
max_thrust = 32000*g/2.2046; % F-18 max. thrust (sea-level) static: 16000 lbs x 2

% Aerodynamic data from Aerodata.m file
run('f18_Aerodata.m')
% Initalializing States to zeros
x0 = zeros(12,1);
init_omega_b = x0(1:3);
init_Vb = x0(4:6);
init_eulers = x0(7:9);
init_inertial = x0(10:12);

% Initalize inputs to zeros
u0=zeros(4,1);

disp('Constants Initialized');