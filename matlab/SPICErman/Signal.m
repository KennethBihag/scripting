classdef Signal
    % Parent class of waveform classes, i.e. SawTooth,
    % Sinusoid, etc.
    
    properties 
        T % period
        Max=0
        Min=0
    end
    
    methods
        function obj = Signal(period, maxVal, minVal)
            display('Signal ctr');
            obj.T = period;
            obj.Max = maxVal;
            obj.Min = minVal;
        end
        
        function frequency = f(obj)
            frequency = 1/obj.T;
        end

        function voltage = V(obj, t)
            display('Not implemented');
        end

        function part = GetTimePart(obj,t)
            part = mod(t,obj.T);
            part = part/obj.T;
        end
    end
end

