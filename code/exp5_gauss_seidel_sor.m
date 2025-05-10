
%% Experiment 5 – Gauss‑Seidel & SOR
%
function [x,iter] = gaussSeidel(A,b,x0,tol,maxIt)
n = length(b); x = x0;
for iter=1:maxIt
    x_old = x;
    for i=1:n
        x(i) = (b(i) - A(i,[1:i-1 i+1:n])*x([1:i-1 i+1:n]))/A(i,i);
    end
    if norm(x-x_old,inf) < tol, return, end
end
error('Gauss‑Seidel failed')
end

function [x,iter] = sor(A,b,x0,omega,tol,maxIt)
n=length(b); x=x0;
for iter=1:maxIt
    x_old=x;
    for i=1:n
        sigma = A(i,1:i-1)*x(1:i-1) + A(i,i+1:n)*x(i+1:n);
        x(i) = (1-omega)*x(i) + omega*(b(i)-sigma)/A(i,i);
    end
    if norm(x-x_old,inf) < tol, return, end
end
error('SOR failed')
end

% Demos
A1=[4.63 -1.21 3.22;
   -3.07 5.48 2.11;
    1.26 3.11 4.57];
b1=[2.22;-3.17;5.11];
[xgs,~]=gaussSeidel(A1,b1,zeros(3,1),1e-6,100);
fprintf('Gauss‑Seidel solution:'); disp(xgs.');

A2=[4 1 -1 1;
    1 4 -1 -1;
   -1 -1 5 1;
    1 -1 1 3];
b2=[-2;-1;0;1];
[xsor,~]=sor(A2,b2,zeros(4,1),1.2,1e-3,500);
fprintf('SOR solution:'); disp(xsor.');
