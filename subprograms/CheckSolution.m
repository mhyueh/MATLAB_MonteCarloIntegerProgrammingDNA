%% CheckSolution
% Check solution for the DNA equations
%
%% Syntax
%   [isValid, ErrorA, ErrorB] = CheckSolution(S, a, b)
%
%% Description
%  S : double array, 1 x n, integer solution for the DNA equations
%  a : double, objective of linear equation
%  b : double, objective of quadratic equation
% 
%  isValid: Boolean, whether the solution is valid
%  ErrorA : double, error of linear equation
%  ErrorB : double, error of quadratic equation
%  
%% Contribution
%  Author : Mei-Heng Yueh
%  Created: 2017/08/08
% 
%  Copyright 2017 Mei-Heng Yueh
%  https://mhyueh.github.io

function [isValid, ErrorA, ErrorB] = CheckSolution(S, a, b)
isValid = 1;

if min(S) < 1
    isValid = 0;
end
if max(S) > 9896
    isValid = 0;
end

ErrorA = NaN;
ErrorB = NaN;
if nargin > 1
    ErrorA = sum(S)-a;
    ErrorB = sum(S.^2)-b;
    if ErrorA~=0 || ErrorB~=0
        isValid = 0;
    end
end

Diff_S = diff(S);
if min(Diff_S) < 1
    isValid = 0;
end

