%% Analysis of Dynamic Modes

%% Longitudinal Modes
st_ind=num2cell((1:length(linsys.StateName))'); 
%Longitudinal States: x=[q;u;w;theta;Zdist]
ind_long = [st_ind{logical(strcmp('q_dot',linsys.StateName))};
           st_ind{logical(strcmp('u_dot',linsys.StateName))};
           st_ind{logical(strcmp('w_dot',linsys.StateName))};
           st_ind{logical(strcmp('theta_dot',linsys.StateName))};
           st_ind{logical(strcmp('Zi_dot',linsys.StateName))}]';

%Longitudinal Inputs u=[del_ele,del_throt]
indin_long = [st_ind{logical(strcmp('f18_SimulationModel/del_elevator_deg',linsys.InputName))};
           st_ind{logical(strcmp('Throttle',linsys.InputName))}]';

Along = linsys.A(ind_long,ind_long);
Blong = linsys.B(ind_long,indin_long);

LONG_EIG = eig(Along);
LongData = LONG_EIG(1:end,:) ;                                               % Eigen values calculation to determine the relevant longitudinal modes

%% Lateral and Directional Modes
%Lateral States: x=[p;r;v;phi;psi]
ind_lat = [st_ind{logical(strcmp('p_dot',linsys.StateName))};
           st_ind{logical(strcmp('r_dot',linsys.StateName))};
           st_ind{logical(strcmp('v_dot',linsys.StateName))};
           st_ind{logical(strcmp('phi_dot',linsys.StateName))};
           st_ind{logical(strcmp('psi_dot',linsys.StateName))}]';

%Lateral Inputs u=[del_alie,del_rud]
indin_lat = [st_ind{logical(strcmp('f18_SimulationModel/del_alieron_deg',linsys.InputName))};
           st_ind{logical(strcmp('f18_SimulationModel/del_rudder_deg',linsys.InputName))}]';

%Lateral States: x=[p;r;v;phi;psi]

Alat = linsys.A(ind_lat,ind_lat);
Blat = linsys.B(ind_lat,indin_lat);

LAT_EIG = eig(Alat);
% First eigen value is not relevant
LatData = LAT_EIG(2:end,:);                                                  % Eingen values calculation to determine the relevant lat.dir. modes


%% Display Data
Wn=0; Z=0;
[Wn,Z] = damp(LongData);                                                    % Frequency (Wn) and damping (Z) calculation from eigen values.

disp(['Short Period Frequency: ',num2str(Wn(2)),' rad/s'])
disp(['Short Period Damping: ',num2str(Z(2))])
disp(['Phugoid Frequency: ',num2str(Wn(4)),' rad/s'])
disp(['Phugoid Damping: ',num2str(Z(4))])
Wn=0; Z=0;
[Wn,Z] = damp(LatData);                                                     % Frequency (Wn) and damping (Z) calculation from eigen values.
disp(['Dutch Roll Frequency: ',num2str(Wn(2)),' rad/s'])
disp(['Dutch Roll Damping: ',num2str(Z(2))])
if max(LatData(imag(LatData)==0))>0
    disp(['Spiral Stability time to double: ',num2str(log(2)*abs(1/(Wn(max(LatData(imag(LatData)==0))==real(LatData))*Z(max(LatData(imag(LatData)==0))==real(LatData))))),' s'])
else
    disp(['Spiral Stability time to half: ',num2str(log(2)*abs(1/(Wn(max(LatData(imag(LatData)==0))==real(LatData))*Z(max(LatData(imag(LatData)==0))==real(LatData))))),' s'])
end
disp(['Roll Mode time to half: ',num2str(log(2)*abs(1/(Wn(min(real(LatData))==real(LatData))*Z(min(real(LatData))==real(LatData))))),' s'])

%% Saving Matrices
save('Along.mat','Along')
save('Blong.mat','Blong')
save('Alat.mat','Alat')
save('Blat.mat','Blat')

% Define the header line
header = 'state = {q,u,w,theta,Zi}';

% Open a file for writing
fileID = fopen('Along.txt', 'w');

% Write the header line to the file
fprintf(fileID, '%s\n', header);

% Write the matrix to the file with 5 decimal places
for i = 1:size(Along, 1)
    fprintf(fileID, '%.5f\t%.5f\t%.5f\t%.5f\t%.5f\n', Along(i, :));
end

% Close the file
fclose(fileID);


header2 = 'state = {p,r,v,phi,psi}';
fileID = fopen('Alat.txt', 'w');
fprintf(fileID, '%s\n', header2);
for i = 1:size(Alat, 1)
    fprintf(fileID, '%.5f\t%.5f\t%.5f\t%.5f\t%.5f\n', Alat(i, :));
end
fclose(fileID);



header3 = 'input = {del_ele,throttle}';
fileID = fopen('Blong.txt', 'w');
fprintf(fileID, '%s\n', header3);
for i = 1:size(Blong, 1)
    fprintf(fileID, '%.5f\t%.5f\n', Blong(i, :));
end
fclose(fileID);


header4 = 'input = {del_alie,del_rudd}';
fileID = fopen('Blat.txt', 'w');
fprintf(fileID, '%s\n', header4);
for i = 1:size(Blat, 1)
    fprintf(fileID, '%.5f\t%.5f\n', Blat(i, :));
end
fclose(fileID);
