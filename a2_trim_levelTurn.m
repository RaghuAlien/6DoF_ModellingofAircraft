%% Input
CAS_mps = 200;
altitude_m = 10000;
roll_angle_deg = 60;

%% Specify the model name
model = 'f18_SimulationModel';

%% Create the operating point specification object.
opspec = operspec(model);

%% Set the constraints on the states in the model.
% - The defaults for all states are Known = false, SteadyState = true,
%   Min = -Inf, Max = Inf, dxMin = -Inf, and dxMax = Inf.

% State (1) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Rotational_EoM/p_dot
% - Default model initial conditions are used to initialize optimization.

% State (2) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Rotational_EoM/q_dot
% - Default model initial conditions are used to initialize optimization.

% State (3) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Rotational_EoM/r_dot
% - Default model initial conditions are used to initialize optimization.

% State (4) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Translational_EoM/u_dot
opspec.States(4).x = 100;

% State (5) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Translational_EoM/v_dot
% - Default model initial conditions are used to initialize optimization.

% State (6) - f18_SimulationModel/f18 Model/6DoF_Model/6DoF_EoM/Translational_EoM/w_dot
% - Default model initial conditions are used to initialize optimization.

% State (7) - f18_SimulationModel/f18 Model/6DoF_Model/Euler_Angles/phi_dot
% - Default model initial conditions are used to initialize optimization.

% State (8) - f18_SimulationModel/f18 Model/6DoF_Model/Euler_Angles/psi_dot
% - Default model initial conditions are used to initialize optimization.
opspec.States(8).SteadyState = false;

% State (9) - f18_SimulationModel/f18 Model/6DoF_Model/Euler_Angles/theta_dot
% - Default model initial conditions are used to initialize optimization.

% State (10) - f18_SimulationModel/f18 Model/6DoF_Model/Inertial_Frame/Xi_dot
% - Default model initial conditions are used to initialize optimization.
opspec.States(10).SteadyState = false;

% State (11) - f18_SimulationModel/f18 Model/6DoF_Model/Inertial_Frame/Yi_dot
% - Default model initial conditions are used to initialize optimization.
opspec.States(11).SteadyState = false;

% State (12) - f18_SimulationModel/f18 Model/6DoF_Model/Inertial_Frame/Zi_dot
% - Default model initial conditions are used to initialize optimization.
opspec.States(12).SteadyState = false;

%% Set the constraints on the inputs in the model.
% - The defaults for all inputs are Known = false, Min = -Inf, and
% Max = Inf.

% Input (1) - f18_SimulationModel/del_elevator_deg
% - Default model initial conditions are used to initialize optimization.
opspec.Inputs(1).Min = -90;
opspec.Inputs(1).Max = 90;

% Input (2) - f18_SimulationModel/del_alieron_deg
% - Default model initial conditions are used to initialize optimization.
opspec.Inputs(2).Min = -90;
opspec.Inputs(2).Max = 90;

% Input (3) - f18_SimulationModel/del_rudder_deg
% - Default model initial conditions are used to initialize optimization.
opspec.Inputs(3).Min = -90;
opspec.Inputs(3).Max = 90;

% Input (4) - f18_SimulationModel/Throttle
% - Default model initial conditions are used to initialize optimization.
opspec.Inputs(4).Min = 0;
opspec.Inputs(4).Max = 1;

%% Set the constraints on the outputs in the model.
% - The defaults for all outputs are Known = false, Min = -Inf, and
% Max = Inf.

% Output (1) - f18_SimulationModel/CAS_mps
opspec.Outputs(1).y = CAS_mps;
opspec.Outputs(1).Known = true;

% Output (2) - f18_SimulationModel/Mach
% - Default model initial conditions are used to initialize optimization.

% Output (3) - f18_SimulationModel/TAS_mps
% - Default model initial conditions are used to initialize optimization.

% Output (4) - f18_SimulationModel/alpha_deg
% - Default model initial conditions are used to initialize optimization.

% Output (5) - f18_SimulationModel/beta_deg
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(5).Known = true;

% Output (6) - f18_SimulationModel/alphaDot_radps
% - Default model initial conditions are used to initialize optimization.

% Output (7) - f18_SimulationModel/u_mps
% - Default model initial conditions are used to initialize optimization.

% Output (8) - f18_SimulationModel/v_mps
% - Default model initial conditions are used to initialize optimization.

% Output (9) - f18_SimulationModel/w_mps
% - Default model initial conditions are used to initialize optimization.

% Output (10) - f18_SimulationModel/p_degps
% - Default model initial conditions are used to initialize optimization.

% Output (11) - f18_SimulationModel/q_degps
% - Default model initial conditions are used to initialize optimization.

% Output (12) - f18_SimulationModel/r_degps
% - Default model initial conditions are used to initialize optimization.

% Output (13) - f18_SimulationModel/phi_deg
opspec.Outputs(13).y = roll_angle_deg;
opspec.Outputs(13).Known = true;

% Output (14) - f18_SimulationModel/theta_deg
% - Default model initial conditions are used to initialize optimization.

% Output (15) - f18_SimulationModel/psi_deg
% - Default model initial conditions are used to initialize optimization.

% Output (16) - f18_SimulationModel/X_i
% - Default model initial conditions are used to initialize optimization.

% Output (17) - f18_SimulationModel/Y_i
% - Default model initial conditions are used to initialize optimization.

% Output (18) - f18_SimulationModel/Pressure_Altitude_m (Z_i)
opspec.Outputs(18).y = altitude_m;
opspec.Outputs(18).Known = true;

% Output (19) - f18_SimulationModel/GroundSpeed_mps
% - Default model initial conditions are used to initialize optimization.

% Output (20) - f18_SimulationModel/ClimbAnlge_gamma_deg
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(20).Known = true;

% Output (21) - f18_SimulationModel/TrackAnlge_psi_deg
% - Default model initial conditions are used to initialize optimization.

% Output (22) - f18_SimulationModel/nx
% - Default model initial conditions are used to initialize optimization.

% Output (23) - f18_SimulationModel/ny
% - Default model initial conditions are used to initialize optimization.

% Output (24) - f18_SimulationModel/nz
% - Default model initial conditions are used to initialize optimization.

% Output (25) - f18_SimulationModel/Thrust
% - Default model initial conditions are used to initialize optimization.


%% Create the options
opt = findopOptions('DisplayReport','iter');

%% Perform the operating point search.
[op,opreport] = findop(model,opspec,opt);
