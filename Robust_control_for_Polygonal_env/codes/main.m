clear
clc

[MarkLocation, A_h, A_b, z_h, z_b, p_r] = GenerateEnv(true);
GenerateDyn;
CalcContorller;
CalcPath;