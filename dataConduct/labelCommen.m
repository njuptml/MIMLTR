%找到标记空间相同的下标
function [A,i,j]=labelCommen()
fid1=fopen('C:\Users\郑茂\Desktop\实验\mao\A-THALIANA(植物-拟南芥）\all_gos.txt');
fid2=fopen('C:\Users\郑茂\Desktop\实验\test1\算法\data\TargetDomain\RAT\all_gos.txt');
labelNum=0;

while ~feof(fid1)
  tline=fgetl(fid1);
  
  labelNum=labelNum+1;
  l=str2num(tline(4:length(tline)));
  SourceLabel(labelNum)=l;
  
end
 SourceLabel=SourceLabel';
 labelNum=0;
 while ~feof(fid2)
  tline=fgetl(fid2);
  
  labelNum=labelNum+1;
  l=str2num(tline(4:length(tline)));
  TargetLabel(labelNum)=l;
  
end
TargetLabel=TargetLabel';



[A,i,j]=intersect(SourceLabel,TargetLabel);