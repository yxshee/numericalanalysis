
%% Experiment 8 – Newton's Divided Difference Interpolation
%
function Pn = newtonInterp(x,y,p)
n = length(x);
dd = zeros(n,n); dd(:,1)=y(:);
for j=2:n
    for i=1:n-j+1
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1)-x(i));
    end
end
Pn = dd(1,1);
prod_term = 1;
for k=1:n-1
    prod_term = prod_term*(p - x(k));
    Pn = Pn + dd(1,k+1)*prod_term;
end
end

% Demo
x=[1 1.5 2.0 2.5]; y=[2.7183 4.4817 7.3891 12.1825];
approx=newtonInterp(x,y,2.25);
fprintf('exp(2.25) ≈ %.6f (exact %.6f)\n',approx,exp(2.25));
