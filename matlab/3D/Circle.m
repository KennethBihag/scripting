classdef Circle
    %Circle Summary of this class goes here
    %   Detailed explanation goes here

    properties
        radius = 0;
        divs = 0;
        x = [0];
        y = [0];
        z = [0];
    end

    methods
        function obj = Circle(r, d, z)
            if nargin < 1
                return;
            end
            obj.radius = r;

            if nargin < 3; z = 0; end

            if nargin < 2; obj.divs = 100;
            else obj.divs = d; end

            xRange = 0:pi/obj.divs:2*pi;
            obj.x = zeros(1, obj.divs); obj.y = zeros(1, obj.divs);
            j = 0;
            for i=xRange
                j = j+1;
                obj.x(j) = obj.radius * cos(i);
                obj.y(j) = obj.radius * sin(i);
            end

            obj.z = z * ones(1,numel(xRange));
        end
        function obj = zeros(obj)
            obj = Circle();
        end
    end
end