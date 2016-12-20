%构造一个函数，使得该函数可以将数据矩阵转化成为mimlfast可以处理的数据格式
function [data_fast]=data2fast(data)

A=data;
[instance_num,feature_num]=size(A);
data_fast=cell(instance_num,1);

for i=1:instance_num
   data_fast{i}=A(i,:)';
end