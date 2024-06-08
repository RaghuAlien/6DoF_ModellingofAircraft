%% Generating tf from ss model

A = linsys2.A(1:4,1:4);
B = linsys2.B(1:4,:);
C = linsys2.C(1:4,1:4);
D = linsys2.D(1:4,:);

[num11,den11] = ss2tf(A,B(:,2),C(3,:),D(3,2));
sys_eq = minreal(tf(num11,den11))
[z,p,k] = tf2zp(num11,den11)