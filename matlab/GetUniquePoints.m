function [ result ] = GetUniquePoints( points)
% returns only unique points from a vertex array
% the points input parameter is an n by 3 matrix
% a point is a 3-element array, representing x,y,z coordinates
    if(size(points,2)~=3)
        display('Input matrix must have 3 columns');
        return;
    else
        result=[];
        for i=1:size(points,1)
            isDuplicate=false;
            for j=1:size(result,1)
                if(points(i,:)==result(j,:))
                    isDuplicate=true;
                    break;
                end
            end
            if(~isDuplicate)
                result=[result;...
                    points(i,:)];
            end
        end
    end
     return;
end