function VizMeshAndPolylines(varargin)
%Visualizes triangulated mesh
%args: index_array,verts_x_array,verts_y_array,verts_z_array
% h, set if hold on at the end
if nargin >= 3
    trimesh(varargin{1},...
        varargin{2}(:,1),...
        varargin{2}(:,2),...
        varargin{2}(:,3),...
        'EdgeColor',varargin{3},'FaceColor',varargin{4},'FaceAlpha',0.5);
    axis('equal');
    hold on;
end
    c = 'r';
	if (size(plines)==[1 1])
		for pl = plines
			x = pl{:}(:,1);
			y= pl{:}(:,2);
			z=pl{:}(:,3);
			plot3(x,y,z,'linewidth',3,'color',c);
			hold on;
        end
	else
		if  size(plines,1)==1 && size(plines,2)>=1
			for pl = plines
                x = pl{1}(:,1);
                y= pl{1}(:,2);
                z=pl{1}(:,3);
                plot3(x,y,z,'linewidth',3,'color',c);
                hold on;
                if c=='r'
                    c='g';
                elseif c=='g'
                    c='b';
                else c='r';
                end
		end
    end
    axis('equal');
    hold off;
    return;
end