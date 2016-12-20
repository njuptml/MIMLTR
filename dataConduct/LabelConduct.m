%构建新的标记空间，源域和目标域的标记空间是相同的
function [SLnew,TLnew]=LabelConduct(source_label,target_label)
[A,i,j]=labelCommen();%A中存储所有源域和目标域相同的标记，i中存储源域标记的位置，j存储该标记在目标域的位置

SL=source_label;
TL=target_label;
t=size(i,1);
SLnew=zeros(size(SL,1),t);
TLnew=zeros(size(TL,1),t);
% TLnew=zeros(t);


for m=1:t
   SLnew(:,m)= SL(:,i(m));
   TLnew(:,m)= TL(:,j(m)); 
end



