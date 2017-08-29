%% MonteCarloIntegerProgramming
% Monte Carlo integer programming for the DNA equations
%
%% Syntax
%   S = MonteCarloIntegerProgramming(S0, a, b, n)
%
%% Description
%  S0: double array, 1 x n, integer initial values
%  a : double, objective of linear equation
%  b : double, objective of quadratic equation
% 
%  S : double array, 1 x n, integer solution for the DNA equations
%
%% Contribution
%  Author : Mei-Heng Yueh
%  Created: 2017/08/08
% 
%  Copyright 2017 Mei-Heng Yueh
%  https://mhyueh.github.io

function S = MonteCarloIntegerProgramming(S0, a, b, n)
S = S0;
Error = sum(S.^2)-b;
isValid = 0;
while ~isValid
    IDX = sort(randperm(n, 2));
    Snew = S;
    if Error>0
        Snew(IDX(1)) = Snew(IDX(1))+1;
        Snew(IDX(2)) = Snew(IDX(2))-1;
    else
        Snew(IDX(1)) = Snew(IDX(1))-1;
        Snew(IDX(2)) = Snew(IDX(2))+1;
    end
    isValid = CheckSolution(Snew);
    if isValid
        S = Snew;
        Error = sum(S.^2)-b;
        isValid = CheckSolution(S, a, b);
    end
end
