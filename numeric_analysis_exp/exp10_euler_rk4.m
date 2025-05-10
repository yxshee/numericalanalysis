
%% Experiment 10 – Modified Euler & 4th‑order Runge‑Kutta
%
function y = modEuler(f,t0,y0,h,steps)
y = y0;
for k=1:steps
    t=t0+(k-1)*h;
    k1 = f(t,y);
    k2 = f(t+h,y+h*k1);
    y = y + h*(k1+k2)/2;
end
end

function y = rk4(f,t0,y0,h,steps)
y=y0;
for k=1:steps
    t=t0+(k-1)*h;
    k1=f(t,y);
    k2=f(t+h/2,y+h/2*k1);
    k3=f(t+h/2,y+h/2*k2);
    k4=f(t+h,y+h*k3);
    y = y + h*(k1+2*k2+2*k3+k4)/6;
end
end

% Demo: y' = -y + 2 cos t , y(0)=1 on [0,1] h=0.2
f=@(t,y) -y + 2*cos(t);
h=0.2; steps=5;
y_me=modEuler(f,0,1,h,steps);
y_rk=rk4(f,0,1,h,steps);
fprintf('y(1) Modified Euler ≈ %.6f  RK4 ≈ %.6f\n',y_me,y_rk);
