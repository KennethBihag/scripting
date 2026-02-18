function [corrSame, pointSame, corrVal] = compCurve(x1, y1, x2, y2, tol)
    if nargin < 5
        tol = 1e-4;
    end

    corrSame = false;
    pointSame = [];
    corrVal = 0;

    if size(x1, 1) ~= 1 || size(x2, 1) ~= 1
        error('x1 and x2 must have 1 row only');
    end
    if numel(x1) ~= numel(y1) || numel(x2) ~= numel(y2)
        error(['x1 and x2 must have same number of elements ' ...
            ' with y1 and y2, respectively']);
    end
    % figure(1);
    % plot(x1, y1); hold on; plot(x2,y2);
    % legend('Original 1', 'Original 2');

    tMinI = find(x1 >= min(x2), 1, "first");
    tMaxI = find(x1 <= max(x2), 1, "last");
    xRef = x1(tMinI:tMaxI);
    yRef = y1(tMinI:tMaxI);
    norm2 = interp1(x2, y2, xRef, "linear");
    if any(isnan(norm2))
        error('Interpolation failed: insufficient overlap');
    end
    % figure(2);
    % plot(xRef, yRef); hold on; plot(xRef, norm2);
    % legend('New 1', 'New 2');
    corrVal = corr(transpose(yRef), transpose(norm2));
    corrSame = corrVal >= 0.99;
    diffs = abs(norm2 - yRef);
    pointSame = mean(diffs <= tol) >= 0.99;
end