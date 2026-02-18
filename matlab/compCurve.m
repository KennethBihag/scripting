function [corrSame, pointSame] = compCurve(x1, y1, x2, y2, tol)
    if nargin < 5
        tol = 0.25;
    end

    corrSame = false;
    pointSame = [];

    if size(x1, 1) ~= 1 || size(x2, 1) ~= 1
        error('x1 and x2 must have 1 row only');
    end
    if numel(x1) ~= numel(y1) && numel(x2) ~= numel(y2)
        error(['x1 and x2 must have same number of elements ' ...
            ' with y1 and y2, respectively']);
    end
    figure(1);
    % tiledlayout(2,1);
    % nexttile;
    plot(x1, y1); hold on;
    % nexttile;
    plot(x2,y2);
    legend('Original 1', 'Original 2');
    tMin = max(min(x1), min(x2));
    tMax = min(max(x1), max(x2));
    xRef = linspace(tMin, tMax, max(numel(x1),numel(x2)));
    norm1 = interp1(x1, y1, xRef,"linear");
    norm2 = interp1(x2, y2, xRef, "linear");
    if any(isnan(norm1)) || any(isnan(norm2))
        error('Interpolation failed: insufficient overlap');
    end
    figure(2);
    plot(xRef, norm1); hold on; plot(xRef, norm2);
    legend('New 1', 'New 2');
    corrSame = findcorr(norm1, norm2) >= 0.99;
    pointSame = mean(abs(norm2 - norm1) <= tol) >= 0.99;
end