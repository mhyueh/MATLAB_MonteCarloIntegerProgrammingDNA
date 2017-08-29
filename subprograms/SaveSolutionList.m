%% SaveSolutionList
% Save the list of solutions as MAT file
%
%% Syntax
%   SaveSolutionList(ACGT, SolList)
%
%% Description
%  ACGT   : string, could be 'A', 'C', 'G', or 'T'
%  SolList: double array, nSol x n, list of solutions
%  
%% Contribution
%  Author : Mei-Heng Yueh
%  Created: 2017/08/08
% 
%  Copyright 2017 Mei-Heng Yueh
%  https://mhyueh.github.io

function SaveSolutionList(ACGT, SolList)
SolNo = 1;
SolDir = 'Solutions\';
switch ACGT
    case 'A'
        while exist(['SolListA_' num2str(SolNo) '.mat'],'file')~=0
            SolNo = SolNo+1;
        end
        SolListA = SolList;
        save([SolDir 'SolListA_' num2str(SolNo) '.mat'], 'SolListA');
    case 'C'
        while exist(['SolListC_' num2str(SolNo) '.mat'],'file')~=0
            SolNo = SolNo+1;
        end
        SolListC = SolList;
        save([SolDir 'SolListC_' num2str(SolNo) '.mat'], 'SolListC');
    case 'G'
        while exist(['SolListG_' num2str(SolNo) '.mat'],'file')~=0
            SolNo = SolNo+1;
        end
        SolListG = SolList;
        save([SolDir 'SolListG_' num2str(SolNo) '.mat'], 'SolListG');
    case 'T'
        while exist(['SolListT_' num2str(SolNo) '.mat'],'file')~=0
            SolNo = SolNo+1;
        end
        SolListT = SolList;
        save([SolDir 'SolListT_' num2str(SolNo) '.mat'], 'SolListT');
end