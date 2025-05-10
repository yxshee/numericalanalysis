
%% Experiment 3 – Gauss Elimination
%
% Function gaussElim solves Ax=b via forward elimination & back‑substitution.
%

function x = gaussElim(A,b)
n = length(b);
% Forward elimination
for k = 1:n-1
    [~,p] = max(abs(A(k:n,k))); p = p+k-1;
    if p~=k
        A([k p],:) = A([p k],:);
        b([k p]) = b([p k]);
    end
    for i = k+1:n
        m = A[i,k] / A[k,k];
        A[i,k:n] = A[i,k:n] - m*A[k,k:n];
        b(i) = b(i) - m*b(k);
    end
end
% Back substitution
x = zeros(n,1);
for i=n:-1:1
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n)) / A(i,i);
end
end

% Demo – solve the system in the lab‑sheet
A = [10 8 -3 1;
     2 10 1 -4;
     3 -4 10 1;
     2 2 -3 10];
b = [16;9;10;11];
x = gaussElim(A,b);
fprintf('Solution vector:\n'); disp(x);
