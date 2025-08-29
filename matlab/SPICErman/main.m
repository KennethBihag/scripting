display('SPICErman Stay at Home');
Vf = 0.71278;
vDc =10;
R = [100 10^4];

%% linearized already
display('Already linearized... voltage source');
I1 = (vDc-Vf)/(R(1)+R(2));
Req = Vf/I1;
fprintf('Vd=%.6f, I1=%.2e, Req=%.2e\n\n', ...
    Vf, I1, Req);

display('Already linearized... current source');
iDc = 0.1;
A = [
    1 1 0;
    0 -1 1/R(2);
    1 0 -1/R(1)
];
B = [
  iDc;
  Vf/R(2);
  0
];
x = A\B; % I1 I2 V1
fprintf('Vd=%.6f, V1=%.6f, I1=%.2e, I2=%.2e, Req=%.2e\n\n', ...
    Vf, x(3), x(1), x(2), Req);

%% not yet linearized
display('Linearizing...');
Vt = 0.02585;
Is = 1e-15;
n=0;
Vd = 1;

while true
    n = n+1;
    fprintf("Iter%d\n", n);
    Id = Is*(exp(Vd/Vt)-1);
    r = Vt / (Is * exp(Vd/Vt));
    Ir = Vd/r;
    Ieq = Id - Vd/r;
    fprintf("\tVd=%.6f, Id=%.2e, r=%.2e, Ieq=%.2e, Ir=%.2e\n", ...
        Vd, Id, r, Ieq, Ir);
    A = [
        1/R(1)+1/R(2), -1/R(2);
        1/R(2), -(1/R(2)+1/r)
    ];
    B = [
        iDc;
        Ieq
    ];
    x = A\B; % I1 I2 V1
    dv = Vd;
    Vd = x(2);
    dv = Vd-dv;
    Ir = Vd / r;
    r2 = Ir+Ieq;
    
    fprintf("\tVd=%.6f, I1=%.2e, I2=%.2e, Ir=%.2e, r2=%.2e\n", ...
        Vd, x(1), x(2), Ir, r2);
    if abs(dv) < 0.001
        break
    end
end