function [TargetGO,index]=TargetGOMin(target_label)
%%

%首先对目标域样本的标记排序（正样本个数）
[TLnew,index]= labelSort( target_label ,15 );%抽取出目标域正样本数大于100的标记，从大到小排序，标记索引存储在index中。


TargetLabelName='C:\Users\郑茂\Desktop\实验\test2\算法\code\data\TargetDomain\RAT\all_mf_gos.txt';
% SourceLableName='C:\Users\郑茂\Desktop\实验\test2\算法\code\data\SourceDomain\Saccharomyces_cerevisiae\all_gos.txt';
fidin=fopen(TargetLabelName,'r');
% fidoutname=fopen('TargetLabelName_min.txt','w');

%%
% %此处将目标域所有的标记存储为cell格式
t=0;
GOname=cell(2600,1);
while ~feof(fidin)
    t=t+1;
    tline=fgetl(fidin);
    GOname{t,:}=tline;
 
end

%%
TargetGO=cell(15,1);
for i=1:15
    TargetGO{i,:}=GOname{index(:,i),:}
end

