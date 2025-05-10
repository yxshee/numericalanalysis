
%% Experiment 6 – Power Method for dominant eigen‑value/vector
%
function [lambda,x,iter] = powerMethod(A,x0,tol,maxIt)
x = x0(:)/norm(x0);
lambda = 0;
for iter=1:maxIt
    y = A*x;
    lambda_new = max(abs(y));
    x = y/lambda_new;
    if abs(lambda_new-lambda) < tol, lambda=lambda_new; return; end
    lambda = lambda_new;
end
error('Power method did not converge')
end

% Demo matrix
A=[4 1 0;1 20 1;0 1 4];
[lambda,vec,~]=powerMethod(A,[1;1;1],1e-6,100);
fprintf('Dominant eigen‑value ≈ %.6f\n',lambda);
fprintf('Eigen‑vector ‑ normalized:\n'); disp(vec.' );
