Vin=   5;
R1=    1000;
C1=    1e-6;
Is=    2.74e-13;
Vt=    0.02585;
RC=    R1*C1;
tStop= RC*5*2;
steps= 99;
dt=    tStop/steps;
xPts=  linspace(0, tStop, steps+1);
yPts=  zeros(1, steps+1);

ic=-Vin/R1;
rc=dt/C1;
n=1;
for t=xPts
    yPts(n)=ic*rc;
    dv=100;
    Vd=0.8;
    while abs(dv) > 0.0001
        Id=Is*(exp(Vd/Vt)-1);
        rd=Vt / (Is * exp(Vd/Vt));
        id=Id - Vd/rd;
        A=[
            1, -1, -1;
            R1, rd, 0;
            R1, 0, rc
        ];
        B=[
            ic+id;
            Vin;
            Vin
        ];
        x=A\B; % I1, ird, irc
        vOld=Vd;
        Vd=x(2)*rd;
        dv=Vd-vOld;
    end
    n=n+1;
end
Vd