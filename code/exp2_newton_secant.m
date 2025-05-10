
%% Experiment 2 – Newton & Secant Methods
%
% Provides generic *newton* and *secant* routines followed by examples.
%

function [root,iter] = newton(f,df,x0,tol,maxIt)
for iter=1:maxIt
    x1 = x0 - f(x0)/df(x0);
    if abs(x1-x0) < tol || abs((x1-x0)/x1) < tol
        root=x1; return
    end
    x0 = x1;
end
error('Newton failed to converge')
end

function [root,iter] = secant(f,x0,x1,tol,maxIt)
for iter=1:maxIt
    f0 = f(x0); f1 = f(x1);
    x2 = x1 - (x1-x0)/(f1-f0)*f1;
    if abs(x2-x1) < tol || abs((x2-x1)/x2) < tol
        root=x2; return
    end
    x0 = x1; x1 = x2;
end
error('Secant failed to converge')
end

% Demonstrations
disp('Experiment 2 demonstrations:')

% (i) sqrt(17) via secant
f = @(x) x.^2 - 17;
[root1,~] = secant(f,4,5,1e-6,100);
fprintf('(i) sqrt(17) ≈ %.8f\n',root1);

% (ii)(a) cosx - x*exp(x)=0
f2=@(x) cos(x)-x.*exp(x); df2=@(x) -sin(x)-exp(x)-x.*exp(x);
[r2,~]=newton(f2,df2,0.5,1e-5,100);
fprintf('(ii)(a) root ≈ %.6f\n',r2);

% (b) smallest positive root of cosx = 1/2 + sinx
f3=@(x) cos(x)-0.5-sin(x); df3=@(x) -sin(x)-cos(x);
[r3,~]=newton(f3,df3,0.7,1e-5,100);
fprintf('(ii)(b) root ≈ %.6f\n',r3);

% (c) exp(-x)(x^2+5x+2)+1 = 0, starting -1.5
f4=@(x) exp(-x).*(x.^2+5*x+2)+1; df4=@(x) -exp(-x).*(x.^2+5*x+2)+exp(-x).*(2*x+5);
[r4,~]=newton(f4,df4,-1.5,1e-5,100);
fprintf('(ii)(c) root ≈ %.6f\n',r4);

% (iii) x = 2 sin x
f5=@(x) x-2*sin(x); df5=@(x) 1-2*cos(x);
[r5,~]=newton(f5,df5,2,1e-3,100);
fprintf('(iii) non‑zero root ≈ %.4f\n',r5);

% (iv) 4x^2 - e^x - e^{-x} = 0 (two positive roots)
f6=@(x) 4*x.^2 - exp(x) - exp(-x);
df6=@(x) 8*x - exp(x) + exp(-x);
r6a=newton(f6,df6,0.5,1e-5,100);
r6b=newton(f6,df6,3,1e-5,100);
fprintf('(iv) roots ≈ %.6f , %.6f\n',r6a,r6b);
