function [ out ] = Untitled( inp )
%converts a single row array of vertex coordinates to m rows of 3 cols
if size(inp,1)>1
   fprintf('Input is not single row vector\n'); 
   return;
end
out = [];
for coord=1:3:length(inp)
    if isnan(inp(coord))
        break;
    end
    out = [out; inp(coord) inp(coord+1) inp(coord+2)];    
end
return;
end

