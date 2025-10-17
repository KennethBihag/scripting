function [newData] = addnoise(data, range, negChance)

if nargin < 3
    negChance = 0.5;
end
if nargin < 2
    range = 1;
end

assertlinear(data);

elems = numel(data);
newData = zeros(1,elems);
for i=1:elems
    pos = rand(1,1) >= negChance;
    offSet = rand(1,1) * range;
    if pos
        newData(i) = offSet + data(i);
    else
        newData(i) = data(i) - offSet;
    end
end

end