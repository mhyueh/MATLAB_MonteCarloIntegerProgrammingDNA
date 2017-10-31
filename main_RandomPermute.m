clear;clc;
addpath(genpath('.'));

R  = 9896;
A1 = 14376744;  A2 =  93518316386;  nA = 2941;
C1 =  9137674;  C2 =  61462309894;  nC = 1787;
G1 =  9911331;  G2 =  64865822857;  nG = 1998;
T1 = 15544607;  T2 = 103243636299;  nT = 3170;

nSol = 10;

%%
load('DNA0.mat');
DNA = DNA0;

A = strfind(DNA, 'A');
C = strfind(DNA, 'C');
G = strfind(DNA, 'G');
T = strfind(DNA, 'T');

[isValidA, ErrorA1, ErrorA2] = CheckSolution(A, A1, A2);
[isValidC, ErrorC1, ErrorC2] = CheckSolution(C, C1, C2);
[isValidG, ErrorG1, ErrorG2] = CheckSolution(G, G1, G2);
[isValidT, ErrorT1, ErrorT2] = CheckSolution(T, T1, T2);

DNA0 = DNA;
TotalError0 = abs(ErrorA1) + abs(ErrorC1) + abs(ErrorG1) + abs(ErrorT1) ...
            + abs(ErrorA2) + abs(ErrorC2) + abs(ErrorG2) + abs(ErrorT2);

trialNum = 0;
permLen = 9;
Perms = perms(1:permLen);
Perms(end,:) = [];
nPerms = size(Perms,1);
candidate = 5:9892;
FileNo = 0;
while TotalError0 > 1 && ~isempty(candidate) && FileNo < nSol
    entryNo = randi(length(candidate));
    fprintf('Permute %d - %d ...  ', candidate(entryNo)-4, candidate(entryNo)+4);
    tic
    trialNum = trialNum+1;
    DNA_idx = candidate(entryNo)-4:candidate(entryNo)+4;
    candidate(entryNo) = [];
    for ii = 1:nPerms
        DNA(DNA_idx) = DNA(DNA_idx(Perms(ii,:)));
        A = strfind(DNA, 'A');
        C = strfind(DNA, 'C');
        G = strfind(DNA, 'G');
        T = strfind(DNA, 'T');
        [isValidA, ErrorA1, ErrorA2] = CheckSolution(A, A1, A2);
        [isValidC, ErrorC1, ErrorC2] = CheckSolution(C, C1, C2);
        [isValidG, ErrorG1, ErrorG2] = CheckSolution(G, G1, G2);
        [isValidT, ErrorT1, ErrorT2] = CheckSolution(T, T1, T2);
        TotalError = abs(ErrorA1) + abs(ErrorC1) + abs(ErrorG1) + abs(ErrorT1) ...
                   + abs(ErrorA2) + abs(ErrorC2) + abs(ErrorG2) + abs(ErrorT2);
        if TotalError <= TotalError0 && ~strcmp(DNA0, DNA)
            FileNo = FileNo+1;
            DNA0 = DNA;
            TotalError0 = TotalError;
            fprintf('# %d: Error = %d, A1 = %d, A2 = %d, C1 = %d, C2 = %d, G1 = %d, G2 = %d, T1 = %d, T2 = %d \n',...
                    trialNum, TotalError0, ErrorA1, ErrorA2, ErrorC1, ErrorC2, ErrorG1, ErrorG2, ErrorT1, ErrorT2);
            save(['Solutions\DNA_Error=' num2str(TotalError0) '_' num2str(randi(1e9)) '.mat'], 'DNA0');
        else
            DNA = DNA0;
        end
    end
    toc
end
