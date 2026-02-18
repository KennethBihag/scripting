f = @(t) 5*(1-exp(-t/1.2)) + 0.5*exp(-0.3*t).*sin(2*pi*1.5*t);

t1 = linspace(0,10,100);
t2 = linspace(0,10,90);

tgt5 = t1 >= 5;
first1 = 0;
for i=1:numel(t1)
    if tgt5(i) > 0
        break;
    end
end
first1 = i;
t3 = t1(tgt5);
tls9 = t3 <= 9;
t3 = t3(tls9);
tgt5 = t2 >= 5;
first2 = 0;
for i=1:numel(t1)
    if tgt5(i) > 0
        break;
    end
end
first2 = i;
t4 = t2(tgt5);
tls9 = t4 <= 9;
t4 = t4(tls9);


V1 = f(t1);
V2 = f(t2);
otherSignal = SawTooth(3,2,-1);
sw1 = otherSignal.V(t3);
sw2 = otherSignal.V(t4);
V3 = [zeros(1,first1-1), sw1, zeros(1, 101-first1-numel(sw1)) ];
V4 = [zeros(1,first2-1), sw2, zeros(1, 91-first2-numel(sw2))];

V1 = V1 + V3;
V2 = V2 + V4; 
