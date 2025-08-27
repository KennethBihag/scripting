display('SPICErman Stay at Home');
display('Already linearized');

vDc = 10;
R = [1000 500 200];

% Design 3
%% linearized already
Vf = 0.714592;
A = [
    R(1)+R(3), R(3);
    R(3), R(2)+R(3);
];

B = [
    vDc-Vf;
    vDc;
];

x = A\B; % I1; I2;
Req = Vf/x(1);
fprintf('Vd=%.6f, I1=%.2e, I2=%.2e, r=%.2e\n\n', ...
    Vf, x(1), x(2), Vf/x(1));

%% not yet linearized
display('Linearizing...');
Is = 5.950e-6;
%Is = 1e-15;
Vt = 0.02585;
Vd= 0.9;
n = 0;

while true
n = n+1;
fprintf("Iter%d\n", n);
Id = Is*(exp(Vd/Vt)-1);
r = Vt / (Is * exp(Vd/Vt));
Ieq = Id - Vd/r;
fprintf("\tVd=%.6f, Id=%.2e, r=%.2e, Ieq=%.2e\n", ...
    Vd, Id, r, Ieq);
A = [
    R(1)+R(3)+r, R(3);
    R(3), R(2)+R(3)
];
B = [ % I1 I2
    vDc + Ieq*r;
    vDc;
];
if n > 1
    di = x(1);
end
x = A\B; % I1 I2
Ir = (x(1)-Ieq);
Vd = Ir * r;
r2 = Vd/x(1);
%Vd = vDc - R(1)*x(1) - (x(1)+x(2))*R(3);
fprintf("\tVd=%.6f, I1=%.2e, I2=%.2e, Ir=%.2e, Ir2=%.2e\n", ...
    Vd, x, Ir, r2);
if n > 1
    di = x(1)-di;
    if abs(di) <= 1e-6
        break
    end
end

end