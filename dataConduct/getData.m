%该函数将吴老师发来的文本文档的数据存储成结构体
%每个结构体存放一个包，包的名字，包的标记

function  [Domain] =getData(instance_files,label_files)
clc

%读取instances

fidin=fopen(instance_files,'r');
%fidoutname=fopen('instancesName.txt','w');
numName=0; 
j=0;
while ~feof(fidin)              %测试文件指针是否在文件的结束位置
    tline=fgetl(fidin);         %从文件中读取一行数据

    if tline(1)=='>'
        numName=numName+1;      %如果读取到了类标号的名称，则将该行的名称存储在lable_name.txt中
        Domain(numName).name=tline;
        j=0;
    else
        j=j+1;
       Domain(numName).instance(j).data=str2num(tline);
%          Domain(numName).instance(j).data=tline;
    end
end
fclose(fidin);




%读取label

fidin=fopen(label_files,'r');
Lnum=0;
while ~feof(fidin)
    tline=fgetl(fidin);
    
    if tline(1)=='>'
        Lnum=Lnum+1;
    else
        Domain(Lnum).label=str2num(tline);
    end
end


fclose(fidin);








%fclose(fidoutname);