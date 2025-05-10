
%% Experiment 7 – Lagrange Polynomial Interpolation
%
function Pn = lagrangeInterp(x,y,p)
n = length(x);
L = ones(1,n);
for i=1:n
    for j=1:n
        if i~=j
            L(i) = L(i)*(p - x(j))/(x(i)-x(j));
        end
    end
end
Pn = sum(L .* y);
end

% Demo
x = [0 0.25 0.5 0.75];
y = [1 1.64872 2.71828 4.48169];
val = lagrangeInterp(x,y,0.43);
fprintf('f(0.43) ≈ %.6f using Lagrange\n',val);
