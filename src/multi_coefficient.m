function res = multi_coefficient(s, k)
res = factorial(s);
for i=1:length(k)
    res = res / factorial(k(i));
end
end

