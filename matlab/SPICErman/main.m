display('SPICErman Stay at Home');
display('Already linearized');

In.V.AC = 0;
In.V.DC = 10;
R = [1000; 500; 250; 1000;];

% Design 3
%% linearized already
Vf = 0.714592;
A = [
R(1)   0  R(3)    0;
   0 R(2)    0 R(4);
   0 R(2) R(3)    0;
   1    1   -1   -1;
];

B = [
In.V.DC-Vf;
In.V.DC;
In.V.DC;
      0;
];

% x: I1 I2 I3 I4
% x = inv(A)*B
x = A\B;
V = x .* R
Req = Vf/x(1)

%% not yet linearized
display('Linearizing...');
clear Vf A B x V;
Is = 5.950e-6;
Vt = 0.02585;
Vd0= 1;
vPrev = Vd0;
for n=1:1:5
r = ((Is/Vt)*exp(Vd0/Vt))^-1
A = [
R(1), 0, R(3), 0, r-R(1);
R(1), 0, 0, R(4), r-R(1);
0, R(2), R(3), 0, 0;
0, R(2), 0, R(4), 0;
1, 1, -1, -1, 0;
]
B = [
In.V.DC;
In.V.DC;
In.V.DC;
In.V.DC;
      0;
];
x = A\B % I1 I2 I3 I4 Ieq
Vd0 = x(5)
dV = Vd0 - vPrev
end