%该函数用于将读取的结构体数据转化成MIMLfast可用的Cell格式存储的形式（注意转置）


function [data,label]=Cell_get(files1,files2)
%files1='C:\Users\郑茂\Desktop\项目工作\我的算法\算法1.0\data\SourceDomain\instances.txt'
%files2='C:\Users\郑茂\Desktop\项目工作\我的算法\算法1.0\data\SourceDomain\labels.txt'
Data_struct=getData(files1,files2);

num_data=length(Data_struct);   %所有示例包的个数

num_label=length(Data_struct(1).label);   %所有标记的个数


% % 创建一个Cell存储所有的示例包，一个Cell存一个包
% % Cell的每一个单元是一个矩阵，矩阵的每一行是一个单示例
data=cell(num_data,1);



label=zeros(num_data,num_label);
for i=1:num_data
    
% num_source_instance(i)=length(Source(i).instance);
%对于每一个样本包存成一个矩阵
    data{i}=[];
    for j=1:length(Data_struct(i).instance)

        data{i}=[data{i};Data_struct(i).instance(j).data];


    end
    
    label(i,:)=Data_struct(i).label;
end


