
%% Experiment 9 – Composite Trapezoidal & Simpson Rules
%
function I = compTrap(f,a,b,N)
h=(b-a)/N;
xs=a+h*(1:N-1);
I=h*(0.5*f(a)+sum(f(xs))+0.5*f(b));
end

function I = compSimpson(f,a,b,N)
if mod(N,2)~=0, error('N must be even for Simpson'); end
h=(b-a)/N;
xs=a+h*(1:N-1);
I=h/3*(f(a)+f(b)+4*sum(f(xs(1:2:end)))+2*sum(f(xs(2:2:end))));
end

% Demo integral (a) (cos x)^2 from -0.25 to 0.25 with N=10
f=@(x) (cos(x)).^2;
Ia=compTrap(f,-0.25,0.25,10);
Ib=compSimpson(f,-0.25,0.25,10);
fprintf('Integral (cos x)^2 by Trap: %.8f Simpson: %.8f\n',Ia,Ib);
