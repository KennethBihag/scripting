function corr = findcorr(x, y, degree)
if nargin < 3
    degree = 1;
else
    if degree ~= 'log'
        x = x .^ degree;
    else
        x = log(x);
    end
end
% Find correlation of data
    assertlinear(x);
    assertlinear(y);
    if numel(x) ~= numel(y)
        error('Vectors must be have the same lengths');
    end

    n = numel(x);

    A = n * sum(x .* y);
    B = sum(x) * sum(y);
    C = n * sum(x .^ 2) - sum(x)^2;
    D = n * sum(y .^ 2) - sum(y)^2;

    corr = (A-B) / ( sqrt(C) * sqrt(D) );

end