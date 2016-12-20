function [Pre,Rec,F1,Ap,Cov,Hloss,OError,RLoss] = MIMLTR( sourcesInstancesPath ,sourcesLabelPath,targetInstancesPath, targetLabelPath,labelnumber,r)
% Pre: 精度
% Rec：召回率
% F1 ：F1值
% Ap ：平均精度
% Cov：覆盖率
% Hloss：汉明损失
% OError：0-1损失
% RLoss ：排序损失
% sourcesInstancesPath ：源域样本路径
% sourcesLabelPath ：源域样本标记路径
% targetInstancesPath ：目标域样本路径
% targetLabelPath ：目标域样本标记路径
% labelnumber ：预测共享标记个数
% r ：高斯径向基核半径

%文本文档转化为cell元胞格式
[source_data,source_label]=Cell_get(sourcesInstancesPath,sourcesLabelPath);
[target_data,target_label]=Cell_get(targetInstancesPath,targetLabelPath);
%
target_data1 =transData_MIMLfast(target_data);
source_data1 =transData_MIMLfast(source_data);

 % 运行miFV算法
fv_sourceInstance=mifv_1(source_data);
fv_targetInstance=mifv_1(target_data);

% 构建共享标记的数据集
[SLnew,TLnew]=LabelConduct(source_label,target_label);
[SLnew_min,index]= labelSort( SLnew ,labelnumber );
TLnew_min=TLnew(:,index);

[Sd_fast]=data2fast(fv_sourceInstance);
[Td_fast]=data2fast(fv_targetInstance);


% KMM算法对源域样本加权
[beta,EXITFLAG] = KMM(fv_sourceInstance,fv_targetInstance,1.8);
[test_outputs,test_labels]=MIMLfast(Sd_fast,SLnew_min,Td_fast,beta);
test_output2=test_outputs(:,1:10);
[Pre,Rec,F1,Ap,Cov,Hloss,OError,RLoss]=standerd(test_output2',test_labels',TLnew_min');
end

