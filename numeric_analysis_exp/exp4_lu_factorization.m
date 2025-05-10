
%% Experiment 4 – LU Factorization (Doolittle: unit lower‑triangular L)
%
function [L,U] = luFactor(A)
n = size(A,1);
L = eye(n); U = zeros(n);
for k = 1:n
    U(k,k:n) = A(k,k:n) - L(k,1:k-1)*U(1:k-1,k:n);
    for i = k+1:n
        L(i,k) = (A(i,k) - L(i,1:k-1)*U(1:k-1,k)) / U(k,k);
    end
end
end

% Demo (matrix a)
A = [2 -1 1; 3 3 9; 3 3 5];
[L,U] = luFactor(A);
disp('L ='); disp(L); disp('U ='); disp(U); disp('Check LU:'); disp(L*U);
