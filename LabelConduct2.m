function [SLnew,TLnew,LabelCommen]=LabelConduct2(source_label,target_label,TargetGO)


SourceLableName='C:\Users\郑茂\Desktop\实验\test2\算法\code\data\SourceDomain\Saccharomyces_cerevisiae\all_gos.txt';
 fidin=fopen(SourceLableName,'r');
%%
%首先将源域样本所有的标记名称集合读取到cell数组中
t=0;
SourcesGOname=cell(1566,1);
while ~feof(fidin)
    t=t+1;
    tline=fgetl(fidin);
    SourcesGOname{t,:}=tline;
 
end

%%
%取出源域标记和目标域标记的交集
[LabelCommen,Target_index,Source_index]=intersect(TargetGO,SourcesGOname);

%%
%将源域标记按照交集重组
SLnew=source_label(:,Source_index);
% % % % % % A(A==-1)=0;
% % % % % % B=sum(A,1);
SLnew=[SLnew,-ones(3509,3)];


%%
%下面手动补全TLnew的剩余标记
TLnew=target_label(:,Target_index);
TLnew=[TLnew,target_label(:,318)];
TLnew=[TLnew,target_label(:,259)];
TLnew=[TLnew,target_label(:,1115)];





