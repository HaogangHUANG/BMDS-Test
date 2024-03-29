function ode45_hhg
k1 = 100;k2 = 600;k3 = 150;
E = 1; S = 10;ES = 0; P = 0;
dt = 1e-6;

e = [];
s = [];
es = [];
p = [];

for i = 1:1000000
    E1 = E; S1 = S; ES1 = ES;P1 = P;
    
    E1 = E1 - k1*E1*S1*dt + k2*ES1*dt + k3*ES1*dt;
    S1 = S1 - k1*E1*S1*dt + k2*ES1*dt;
    ES1 = ES1 + k1*E1*S1*dt - k2*ES1*dt - k3*ES1*dt;
    P1 = P1 + k3*ES1*dt;
    if (E1<=1e-10) || (S1<=1e-10)
        break
    end
    
    E = E1;
    S = S1;
    ES = ES1;
    P = P1;
    
    e(end+1) = E;
    s(end+1) = S;
    es(end+1) = ES;
    p(end+1) = P;
end

plot(e);
xlabel('t/min');
ylabel('E');
plot(s);
xlabel('t/min');
ylabel('S');
plot(es);
xlabel('t/min');
ylabel('ES');
plot(p);
xlabel('t/min');
ylabel('P');
plot(s, k3*es);
xlabel('S');
ylabel('V');

end

