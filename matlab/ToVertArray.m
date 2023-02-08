function [ out ] = Untitled( in )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s = size(in);
if s(1,1)==1
    out = [];
    for i=1:3:s(1,2)
        out = [out; in(i) in(i+1) in(i+2)];
    end
    return;
else fprintf('Use a row vector.');
end
end
