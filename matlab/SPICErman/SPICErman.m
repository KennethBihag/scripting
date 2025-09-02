Vin=   5;
R1=100;
Is=    1e-12;
N=     1;
Vt=    0.02585;
C1=    1e-6;
RC=    C1*R1;
tStop= RC*5*1.5;
steps= 1000;
dt=    tStop/steps;
xPts=  linspace(0, tStop, steps+1);
yPts=  zeros(3, steps+1);

rc=dt/C1;
Vc=0;
Vds=zeros(1,numel(xPts));
for n=1:1:numel(xPts)
    Vd=0.7;
    dv=1;
    m=0;
    while dv > 0.0001
        m=m+1;
        rd=Vt/(Is * exp(Vd/(N*Vt)));
        ID=Is*(exp(Vd/(N*Vt))-1);
        id=ID - Vd/rd;

        A=[
            rd+R1+rc, rc;
            1, 1;
        ];
        B=[
            id*rd + Vin;
            Vc/rc;
        ];
        x = A\B; % iv1 ic
        vdOld=Vd;
        Vd=rd*(x(1)-id);
        dv=abs(Vd-vdOld);
    end
    Vds(n)=Vd;
    % fprintf('\t%d iters for linearization\n', m);
    yPts(1, n)=x(1)*R1;% R1 voltage drop
    yPts(2, n)=x(1);% Total current
    yPts(3, n)=Vd; % Diode voltage drop
    dVc=Vc-x(2)*rc;
    Vc=Vc+dVc;
end
% fprintf('%d iters for integration\n', n-1);
data=[
    xPts;
    yPts(1,:);
    yPts(2,:);
    yPts(3,:);
    yPts(1,:) .* yPts(2,:)];