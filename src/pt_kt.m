
function v = pt_kt(j, k_t, s)
v = 1;
for i=0:j*k_t - 1
    curr_j = mod(i, j);
    if curr_j == 0
        curr_j = 1;
    end
    v = v  * 1/(curr_j);

end


end
