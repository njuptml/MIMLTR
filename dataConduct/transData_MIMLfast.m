function[data] =transData_MIMLfast(data)

Snum=length(data);
%对每一个元胞进行转置
for i=1:Snum
    data{i}=data{i}';
 
end
