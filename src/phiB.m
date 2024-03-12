%Don't touch
%Function to compute the linear combination of actions with expmv
function out = phiB(A,B)
    q=size(B,2);
    if q == 1
        At = [A, B; zeros(q, length(A)) 0];
        if issparse(A)
            At = sparse(At);
        end  
    else
        if issparse(A)
            At = sparse([A, B; sparse(zeros(q,length(A))), sparse(diag(ones(q-1,1),1))]);
        else
            At = [A, B; (zeros(q,length(A))), (diag(ones(q-1,1),1))];
        end
    end
    e = zeros(length(At),1); e(length(A)+q) = 1;
    out = expmv(1,At,e);
    out = out(1:length(A));
end
