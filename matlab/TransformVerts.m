function [Vertices] = TransformVerts(tMatrix,verts)
%check dimensions
Vertices = nan;
if size(tMatrix)~=[4 4]
    ErrorMess();
    return
else
    sizemat = size(verts);
    if sizemat(1,2)~=3
        ErrorMess();
        return
    end
end
Vertices = [verts ones(size(verts,1),1)];
Vertices = Vertices * tMatrix;
Vertices = Vertices(:,1:3);
end

function ErrorMess()
disp("args must be a 4x4 transform matrix and an m by 3 vertices matrix");
end