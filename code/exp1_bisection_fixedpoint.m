
%% Experiment 1 – Bisection & Fixed‑Point Iteration
% Numerical Analysis UMA011 (TIET)
%
% This script provides reusable MATLAB functions *bisection* and *fixedPoint*
% together with demonstrations for the lab‑sheet exercises.
%
% -------------------------------------------------------------------------
% Helper functions
% -------------------------------------------------------------------------

function root = bisection(f, a, b, tol, maxIt)
%%BISECTION  Find root of scalar nonlinear equation f(x)=0 using the
%%           classical bisection method.
%   root = bisection(@(x) x^2-2,0,2,1e-6)
if f(a)*f(b) >= 0
    error('f(a) and f(b) must have opposite sign');
end
for k = 1:maxIt
    c = (a+b)/2;
    if abs(f(c)) < tol || abs(b-a) < tol
        root = c; return
    end
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end
root = (a+b)/2;
end

function [root, iter] = fixedPoint(g, x0, tol, maxIt)
%%FIXEDPOINT  Iterative solution of x = g(x).
iter = 0;
while iter < maxIt
    x1 = g(x0);
    if abs(x1-x0) < tol || abs((x1-x0)/x1) < tol
        root = x1; return
    end
    x0 = x1;
    iter = iter+1;
end
error('Fixed‑point iteration failed to converge in %d iterations',maxIt)
end

% -------------------------------------------------------------------------
% Demonstrations required by the lab‑sheet
% -------------------------------------------------------------------------
disp('Experiment 1 demonstrations:')

% (i) √29 using bisection
f  = @(x) x.^2 - 29;
r1 = bisection(f,5,6,1e-6,100);
fprintf('(i) sqrt(29) ≈ %.8f\n', r1)

% (ii) Smallest positive root of cos(x)=1/2+sin(x)
f2 = @(x) cos(x) - 0.5 - sin(x);
r2 = bisection(f2,0,2,1e-6,100);
fprintf('(ii) root ≈ %.6f\n', r2)

% (iii) Root of x^3+4x^2-10 with accuracy 1e-3
f3 = @(x) x.^3 + 4*x.^2 - 10;
r3 = bisection(f3,1,2,1e-3,100);
fprintf('(iii) root ≈ %.5f\n', r3);

% (iv) tan(x)=4x (first two positive roots) using fixed‑point iteration
g4 = @(x) atan(4*x);
r4a = fixedPoint(g4,0.2,1e-3,100);
r4b = fixedPoint(g4,1.3,1e-3,100);
fprintf('(iv) roots ≈ %.4f , %.4f\n',r4a,r4b)

% (v) 2*sin(πx)+x=0 in [1,2] (x0=1) accuracy 1e-2
g5 = @(x) -2*sin(pi*x);
r5 = fixedPoint(g5,1,1e-2,100);
fprintf('(v) root ≈ %.3f\n',r5);
