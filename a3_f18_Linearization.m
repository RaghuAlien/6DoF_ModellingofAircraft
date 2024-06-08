% Saving the Linearized matrices

model = 'f18_SimulationModel';
linsys = linearize(model,opreport);


%% ddd
% Decoupled Equations
st_ind=num2cell((1:length(linsys.StateName))'); 

%Longitudinal States: x=[q;u;w;theta;Zi]
ind_long = [st_ind{logical(strcmp('u_dot',linsys.StateName))};
           st_ind{logical(strcmp('w_dot',linsys.StateName))};
           st_ind{logical(strcmp('q_dot',linsys.StateName))};
           st_ind{logical(strcmp('theta_dot',linsys.StateName))};
           st_ind{logical(strcmp('Zi_dot',linsys.StateName))}]';

%Longitudinal Inputs u=[del_ele,del_throt]
indin_long = [st_ind{logical(strcmp('f18_SimulationModel/del_elevator_deg',linsys.InputName))};
           st_ind{logical(strcmp('f18_SimulationModel/Throttle',linsys.InputName))}]';

%Lateral States: x=[p;r;v;phi;psi]
ind_lat = [st_ind{logical(strcmp('v_dot',linsys.StateName))};
           st_ind{logical(strcmp('p_dot',linsys.StateName))};
           st_ind{logical(strcmp('r_dot',linsys.StateName))};
           st_ind{logical(strcmp('phi_dot',linsys.StateName))};
           st_ind{logical(strcmp('psi_dot',linsys.StateName))}]';

%Lateral Inputs u=[del_alie,del_rud]
indin_lat = [st_ind{logical(strcmp('f18_SimulationModel/del_alieron_deg',linsys.InputName))};
           st_ind{logical(strcmp('f18_SimulationModel/del_rudder_deg',linsys.InputName))}]';


Along = linsys.A(ind_long,ind_long);
Blong = linsys.B(ind_long,indin_long);
Clong = [1 0 0 0 0;0 1 0 0 0;0 0 57.3 0 0;0 0 0 57.73 0;0 0 0 0 1];
Dlong = zeros(size(Blong));

Alat = linsys.A(ind_lat,ind_lat);
Blat = linsys.B(ind_lat,indin_lat);
Clat = [1 0 0 0 0;0 57.3 0 0 0;0 0 57.3 0 0;0 0 0 57.73 0;0 0 0 0 57.3];
Dlat = zeros(size(Blat));

disp('Model Linearized and Variables Created in WorkSpace')