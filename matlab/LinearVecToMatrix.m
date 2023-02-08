function [Indices,Vertices,TMatrix] = ...
    LinearVecToMatrix(indices,vertices,cols,tMatrix,sqSize)

%Args: indices,vertices and tMatrix are linear vectors
%convert indices and vertices to m x cols, and n x cols matrices, respectively
%convert tMatrix to a sqSize x sqSize matrix

%Check parameters if they're linear vectors.
sizeMat = size(indices);
if sizeMat(1)~=1
    Indices = nan; Vertices = nan; TMatrix=nan;
   return 
else
    sizeMat = size(vertices);
    if sizeMat(1)~=1
        Indices = nan; Vertices = nan; TMatrix=nan;
        return
    else
        sizeMat=size(tMatrix);
        if sizeMat(1)~=1
            Indices = nan; Vertices = nan; TMatrix=nan;
            return
        end
    end
end
%check if cols and sqSize are correct
cols=int32(cols); sqSize=int32(sqSize);
if cols==0 || sqSize == 0
    disp("3rd and/or 5th args must be greater than 1");
    Indices = nan; Vertices = nan; TMatrix=nan;
    return
end
fprintf('Converting to m x %d and %dx%d matrices\n',cols,sqSize,sqSize);
%convert indices and vertices to [colsxn] vectors
if ~isnan(indices)
Indices = reshape(indices,[cols length(indices)/cols])';
else
    Indices=nan;
end
if ~isnan(vertices)
    Vertices = reshape(vertices,[cols length(vertices)/cols])';
else
    Vertices=nan;
end
if ~isnan(tMatrix)
    TMatrix = reshape(tMatrix,[sqSize sqSize])';
else
    TMatrix=nan;
end
end

