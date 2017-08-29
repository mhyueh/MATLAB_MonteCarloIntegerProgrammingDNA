%% InitialSearch
% Initial vector search for the DNA equations
%
%% Syntax
%   S0 = InitialSearch(ACGT, R, a)
%
%% Description
%  ACGT: string, could be 'A', 'C', 'G', or 'T'
%  R : double, size of the DNA sequence
%  a : double, objective of linear equation
% 
%  S0: double array, 1 x n, integer initial values
%  
%% Contribution
%  Author : Mei-Heng Yueh
%  Created: 2017/08/08
% 
%  Copyright 2017 Mei-Heng Yueh
%  https://mhyueh.github.io

function S0 = InitialSearch(ACGT, R, a)
doInitialSearch = 1;
minUpdateNum    = 10;
switch ACGT
    case 'A'
        n = 2941;
        if exist('A0.mat', 'file')
            load('A0.mat');
            isValid = 0;  updateNum = 0;
            while ~isValid || updateNum < minUpdateNum
                IDX = sort(randperm(n, 2));
                S0 = A0;
                S0(IDX(1)) = S0(IDX(1))+1;
                S0(IDX(2)) = S0(IDX(2))-1;
                isValid = CheckSolution(S0);
                if isValid
                    A0 = S0;
                    updateNum = updateNum+1;
                end
            end
            doInitialSearch = 0;
        end
    case 'C'
        n = 1787;
        if exist('C0.mat', 'file')
            load('C0.mat');
            isValid = 0;  updateNum = 0;
            while ~isValid || updateNum < minUpdateNum
                IDX = sort(randperm(n, 2));
                S0 = C0;
                S0(IDX(1)) = S0(IDX(1))+1;
                S0(IDX(2)) = S0(IDX(2))-1;
                isValid = CheckSolution(S0);
                if isValid
                    C0 = S0;
                    updateNum = updateNum+1;
                end
            end
            doInitialSearch = 0;
        end
    case 'G'
        n = 1998;
        if exist('G0.mat', 'file')
            load('G0.mat');
            isValid = 0;  updateNum = 0;
            while ~isValid || updateNum < minUpdateNum
                IDX = sort(randperm(n, 2));
                S0 = G0;
                S0(IDX(1)) = S0(IDX(1))+1;
                S0(IDX(2)) = S0(IDX(2))-1;
                isValid = CheckSolution(S0);
                if isValid
                    G0 = S0;
                    updateNum = updateNum+1;
                end
            end
            doInitialSearch = 0;
        end
    case 'T'
        n = 3170;
        if exist('T0.mat', 'file')
            load('T0.mat');
            isValid = 0;  updateNum = 0;
            while ~isValid || updateNum < minUpdateNum
                IDX = sort(randperm(n, 2));
                S0 = T0;
                S0(IDX(1)) = S0(IDX(1))+1;
                S0(IDX(2)) = S0(IDX(2))-1;
                isValid = CheckSolution(S0);
                if isValid
                    T0 = S0;
                    updateNum = updateNum+1;
                end
            end
            doInitialSearch = 0;
        end
end

while doInitialSearch
    S = randperm(R, n);
    S = sort(S);
    S(end) = a - sum(S(1:n-1));
    S = sort(S);
    if S(end) <= R
        isValid = CheckSolution(S);
        if isValid
            doInitialSearch = 0;
            S0 = S;
        end
    end
end