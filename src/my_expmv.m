function [res,s,m,mv,mvd,unA] = ...
          my_expmv(A,b)
shift = true;
n = length(A);

if shift
    mu = trace(A)/n; mu = full(mu); %initial_comment% Much slower without the full!
    A = A-mu*speye(n);
end
prec = class(A);
tt = 1;
[M,mvd,~,unA] = select_taylor_degree(A,b,[],[],prec,false,false);
mv = mvd;


switch prec
    case 'double', tol = 2^(-53);
    case 'single', tol = 2^(-24);
    case 'half',   tol = 2^(-10);
end

s = 1;

[m_max,p] = size(M);
 U = diag(1:m_max);
 C = ( (ceil(abs(tt)*M))'*U );
 C (C == 0) = inf;
 if p > 1
     [cost, m] = min(min(C)); %initial_comment% cost is the overall cost.
 else
     [cost, m] = min(C);  %initial_comment%  when C is one column. Happens if p_max = 2.
 end
 if cost == inf; cost = 0; end
 s = max(cost/m,1);

eta = 1;
if shift, eta = exp(mu/s); end



% 
nums = zeros(m, 1);
k = zeros(m + 1, 1);
k(end) = s;

%->


Powers = zeros(size(b, 1),s*m);
Pi = b;
for power=1:s*m
   Pi = A * Pi * (1/s);
   Powers(:,power) = Pi;
end
%<- 
% size(A)

res = zeros(size(b, 1), 1);

while 1

    f = b;
    power=1;
    for t=0:m
        f = pt_kt(t, k(t+1), s);
        power = power + k(t + 1) * t;
    end
    f = Powers(power)*f * multi_coefficient(s, k);
    res = res + f;

    if nums(end) < s
        j = m;
    else
        j = m - 1;
        while j > 0 && nums(j) == nums(j + 1)
            j = j - 1;
        end
    end
    if j > 0
        nums(j) = nums(j) + 1;
        k(j) = k(j) + 1;
        r = 0;
        for i= j + 1:m
            nums(i) = nums(i - 1);
            r = r + k(i);
            k(i) = 0;
        end
        k(end) = r + k(end) - 1;
    else
        break
    end
end


