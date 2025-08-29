classdef SawTooth < Signal
    properties
        m % slope
    end
    methods
        function obj = SawTooth(period, max, min)
            obj@Signal(period, max, min);
            obj.m = (max-min) / period;
        end
        function voltage = V(obj, t)
            part = obj.GetTimePart(t);
            voltage = obj.Min+part*obj.T*obj.m;
        end
    end
end

