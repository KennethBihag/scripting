classdef Sphere
    properties
        radius = 0;
        divs = 0;
        circles = {};
    end

    methods
        function obj = Sphere(r, d)
            if nargin < 2; return; end
            obj.radius = r; obj.divs = d;
            z_ = -pi/2:pi/obj.divs:pi/2;
            z = sin(z_) * r;
            rCircles = cos(z_);
            j = 0;
            obj.circles = cell(1, numel(z_));
            for i=z
                j = j+1;
                obj.circles{j} = Circle(rCircles(j), d/2, i);
            end
        end
    end
end