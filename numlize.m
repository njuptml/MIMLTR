function [Sd_nor,Td_nor]=numlize(Sd,Td)
%进行标准化：


% %%%%%%%normalize  标准化过程

Sd_nor = Sd;
Td_nor = Td;


source_instance_ind=max(abs(Sd_nor));
target_instance_ind=max(abs(Td_nor));

t=repmat(target_instance_ind,  length(Td_nor),1);
Sd_nor=Sd_nor./repmat(source_instance_ind, size(Sd_nor,1),1);
Td_nor=Td_nor./repmat(target_instance_ind,  size(Td_nor,1),1);
% Sd_nor=Sd_nor./repmat(source_instance_ind,  length(Sd_nor),1);
% Td_nor=Td_nor./repmat(target_instance_ind,  length(Td_nor),1);


% %数据已经标准化，接下来是要使得数据关于中心点对称，即每一维所有的数据的和等于0
Sd_nor=Sd_nor-ones(size(Sd_nor, 1),1)*mean(Sd_nor, 1);
Td_nor=Td_nor-ones(size(Td_nor, 1),1)*mean(Td_nor, 1);

