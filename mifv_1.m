function [fv]=mifv_1(data)
opt = InitSystem();
opt.kmeans_num_center = 1;
opt.PCA_energy = 0.0;


addpath('C:\Users\郑茂\Desktop\实验\test2\算法\code\data');
addpath('C:\Users\郑茂\Desktop\实验\test2\算法\code\miFV');
addpath('C:\Users\郑茂\Desktop\实验\test2\算法\code\dataConduct');


% inputname = 'data4.mat';
% load(inputname);
% 
% % %首先抽取相同的标记，构建新的样本集
% [SLnew,TLnew]=LabelConduct(source_label,target_label);
% 
num_bag = size(data,1);
trainIndex = 1:num_bag;

% Create codebook

instances = [];
for ii = 1:num_bag
    instances = [instances; data{trainIndex(ii),1}]; %#ok<AGROW>
end



[codes opt] = CreateKmeansCodebook(instances,opt);

% Convert data into FV format
dim = opt.PCA_dim * opt.kmeans_num_center * 2;
fv = zeros(num_bag,dim);
labels = zeros(num_bag,1);%此处为原版的标记，是单标记，故可以集成一个向量。
for ii = 1:num_bag
    fv(ii,:) = ExtractFV(data{ii,1},opt,codes);
    fv(ii,:) = fv(ii,:) / norm(fv(ii,:)); 
end

minv = min(fv(trainIndex,:));
maxv = max(fv(trainIndex,:)) - minv;
maxv = 1./maxv;
fv = (fv -repmat(minv,num_bag,1)) .* repmat(maxv,num_bag,1);
fv(isnan(fv))=0;

