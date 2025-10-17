function assertlinear(vec)
    if size(vec,1) > 1
        error('Data must be a linear matrix');
    end
end