function opt = InitSystem()

opt.PCA_dim = 0;
opt.useRoot = 2; % 0 -- not use; 1 -- standard (sqrt+L1); 2 -- sqrt but not L1 normalization
% use residue normalization or not -- will not affect PCA or codewords
opt.useRN = 0; % residue normalization, 0 -- not use; 1 -- use

% setup VLFeat
run('C:\Users\֣ï\Desktop\ʵ��\test2\�㷨\vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup');
