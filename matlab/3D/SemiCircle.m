classdef SemiCircle
    %SemiCircle Summary of this class goes here
    %   Detailed explanation goes here

    properties
        radius = 0;
        divs = 0;
        x = [];
        y = [];
        rot = 'pos';
    end

    methods
        function obj = SemiCircle(r, d, rot)
            if nargin < 1
                return;
            end
            obj.radius = r;

            if nargin > 2; obj.rot = rot; end

            if nargin < 2; obj.divs = 100;
            else; obj.divs = d;
            end

            xRange = 0:pi/obj.divs:pi;
            if obj.rot == 'neg'
                xRange = -xRange;
            else
                if obj.rot ~= 'pos'
                    error("rot: must be 'pos' or 'neg'");
                end
            end

            obj.x = zeros(1, obj.divs); obj.y = zeros(1, obj.divs);
            j = 0;
            for i=xRange
                j = j+1;
                obj.x(j) = obj.radius * cos(i);
                obj.y(j) = obj.radius * sin(i);
            end

        end

        function newObj = GetXReflection(obj)
            if(obj.rot == 'pos')
                newObj = SemiCircle(obj.radius, obj.divs, 'neg');
            else
                newObj = SemiCircle(obj.radius, obj.divs, 'pos');
            end
        end
    end
end