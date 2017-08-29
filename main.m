%% Monte Carlo Integer Programming for the DNA equations
% The following are the equations for exactly A, C, G and T.
%     { s[A][1]   + s[A][2]   + ... + s[A][2941]   = 14376744
% (A) { s[A][1]^2 + s[A][2]^2 + ... + s[A][2941]^2 = 93518316386
%     { where 0 < s[A][1] < s[A][2] < ...... < s[A][2941] < 9897
% 
%     { s[C][1]   + s[C][2]   + ... + s[C][1787]   = 9137675
% (C) { s[C][1]^2 + s[C][2]^2 + ... + s[C][1787]^2 = 61462309895
%     { where 0 < s[C][1] < s[C][2] < ...... < s[C][1787] < 9897
% 
%     { s[G][1]   + s[G][2]   + ... + s[G][1998]   = 9911330
% (G) { s[G][1]^2 + s[G][2]^2 + ... + s[G][1998]^2 = 64865822856
%     { where 0 < s[G][1] < s[G][2] < ...... < s[G][1998] < 9897
% 
%     { s[T][1]   + s[T][2]   + ... + s[T][3170]   = 15544607
% (T) { s[T][1]^2 + s[T][2]^2 + ... + s[T][3170]^2 = 103243636299
%     { where 0 < s[T][1] < s[T][2] < ...... < s[T][3170] < 9897
%
%  Descriptions
%   ACGT: string, could be 'A', 'C', 'G', or 'T'
%   nSol: double, number of solutions
% 
%   SolListA: double array, nSol x nA, list of solutions for Eq. (A)
%   SolListC: double array, nSol x nC, list of solutions for Eq. (C)
%   SolListG: double array, nSol x nG, list of solutions for Eq. (G)
%   SolListT: double array, nSol x nT, list of solutions for Eq. (T)
%
%% Contribution
%  Author : Mei-Heng Yueh
%  Created: 2017/08/08
% 
%  Copyright 2017 Mei-Heng Yueh
%  https://mhyueh.github.io
%
%%
clear;clc;
addpath(genpath('.'));


%% Settings
ACGT = 'A';
nSol = 10;


%% Initialize
R  = 9896;
A1 = 14376744;  A2 =  93518316386;  nA = 2941;
C1 =  9137675;  C2 =  61462309895;  nC = 1787;
G1 =  9911330;  G2 =  64865822856;  nG = 1998;
T1 = 15544607;  T2 = 103243636299;  nT = 3170;
switch ACGT
    case 'A'; a = A1; b = A2; n = nA;
    case 'C'; a = C1; b = C2; n = nC;
    case 'G'; a = G1; b = G2; n = nG;
    case 'T'; a = T1; b = T2; n = nT;
end
SolList = zeros(nSol,n);


%%
fprintf('Initial searching ...       ');
tic
S0 = InitialSearch(ACGT, R, a);
toc
for ii = 1:nSol
    fprintf('Finding %2d-th solution ...  ', ii);
    tic
    S = MonteCarloIntegerProgramming(S0, a, b, n);
    toc
    SolList(ii,:) = S.';
end


%% Save the list of solutions
SaveSolutionList(ACGT, SolList);

