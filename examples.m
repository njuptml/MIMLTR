%添加其他算法的路径
addpath('..\data')
addpath('..\dataConduct')
addpath('..\KMM')
addpath('..\miFV')
addpath('..\MIMLfast\MIMLfast')
addpath('..\dataConduct\index');
addpath('..\dataConduct');
%加载数据集
sourcesInstancesPath='..\SourcesDomain\instances.txt';
sourcesLabelPath='..\SourcesDomain\labels.txt';
targetInstancesPath='..\TargetDomain\instances.txt';
targetLabelPath='..\TargetDomain\RAT\labels.txt';
[Pre,Rec,F1,Ap,Cov,Hloss,OError,RLoss] =MIMLTR( sourcesInstancesPath ,sourcesLabelPath,targetInstancesPath, targetLabelPath,60,1.5);