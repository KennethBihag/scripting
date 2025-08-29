classdef Sinusoid < Signal    
    
    methods
        function obj = Sinusoid(period, peak)
            obj@Signal(period, peak, -peak);
        end

        function voltage = V(obj, t)
            t2 = obj.GetTimePart(t);
            x =t2*360;
            voltage = sind(x) * obj.Max;
        end
    end
end

