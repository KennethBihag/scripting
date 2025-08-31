Vin=   5;
r1=    1e3;
C1=    1e-6;
Is=    2.74e-13;
Vt=    0.02585;
RC=    C1*r1;
tStop= RC*5*2;
steps= 100;
dt=    tStop/steps;
xPts=  linspace(0, tStop, steps+1);
yPts=  zeros(1, steps+1);

rc=dt/C1;
n=1;
Vc=0;
for t=xPts      
    Vd=0.7;
    dv=1;
    m=0;
    while dv > 0.0001
        m=m+1;
        rd=Vt/(Is * exp(Vd/Vt));
        ID=Is*(exp(Vd/Vt)-1);
        id=ID - Vd/rd;

        A=[
            1, -r1;
            1, rd
        ];
        B=[
            0;
            id*rd + Vin
        ];
        x=A\B;% V1, ir1
        
        vdOld=Vd;
        Vd=Vin-x(1);
        dv=abs(Vd-vdOld);        
    end
    fprintf('\t%d iters for linearization\n', m);
    rp=r1*rc/(r1+rc);
    currS=x(1)/rp;
    ic = Vc/rc;
    irc=(ic+currS)*(1/rc)/(1/r1+1/rc);
    yPts(n)=Vc;
    Vc=irc*rc;

    n=n+1;
end
fprintf('%d iters for integration\n', n-1);