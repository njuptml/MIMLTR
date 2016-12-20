function [ SLnew_min,index ] = labelSort( SLnew ,k )
%UNTITLED3 此处显示有关此函数的摘要
%   挑选出排名前k的列
A=SLnew;
A(A==-1)=0;

B=sum(A,1);
[C,index]=sort(B,'descend');
E=SLnew(:,index(1:k));
index=index(1:k);

SLnew_min=E;

end

