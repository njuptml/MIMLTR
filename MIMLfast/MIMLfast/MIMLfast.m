function [test_outputs,test_labels]=MIMLfast(train_data,train_targets,test_data,beta)
% train_data: n*1 cells, one cell for a bag, each cell is a n_ins*d matrix
% train_targets: n*n_class, one row for a bag
% 
% % %% parameters
D=200; % dimension of the shared space
norm_up=15; % norm of each vector
maxiter=25; % number of iterations
step_size=0.005;  % step size of SGD 1e-4
lambda=1e-5;
num_sub=1;% number of sub concepts
opts.norm=1;

% 
% % 
% D=100; % dimension of the shared space
% norm_up=10; % norm of each vector
% maxiter=15; % number of iterations
% step_size=0.0005;  % step size of SGD 1e-4
% lambda=1e-7
% num_sub=1;% number of sub concepts
% opts.norm=1;

opts.average_size=10;
opts.average_begin=0; 
opts.type='micro';
opts.mi_type='0';
opts.soft_alpha=0.1;

%% initialization
train_targets=[train_targets,2*ones(size(train_targets,1),1)];
n_class=size(train_targets,2);
m=size(train_data{1},1);
costs=1./(1:n_class);
for k=2:n_class
    costs(k)=costs(k-1)+costs(k);
end

V=normrnd(0,1/sqrt(m),D,m); % D*m
W=normrnd(0,1/sqrt(m),D,n_class*num_sub); % D*n_class
for k=1:m
    tmp1=V(:,k);
    V(:,k)=tmp1*norm_up/norm(tmp1);
end
for k=1:n_class*num_sub
    tmp1=W(:,k);
    W(:,k)=tmp1*norm_up/norm(tmp1);
end

AW=0;
AV=0;
Anum=0;
trounds=0;

%% train
for i=1:maxiter
    [W,V,AW,AV,Anum,trounds]=MIML_train(train_data,train_targets,W,V,costs,norm_up,step_size,num_sub,AW,AV,Anum,trounds,lambda,opts,beta);
end
AW=AW/Anum;
AV=AV/Anum; 
%% test
[test_outputs,test_labels]=MIML_test(test_data,AW,AV,num_sub,opts);
% [pre,rec,f1]=PRF1(test_labels',test_targets',opts);
% ap=Average_precision(test_outputs(:,1:end-1)',test_targets');
% rl=Ranking_loss(test_outputs(:,1:end-1)',test_targets');
% oe=One_error(test_outputs(:,1:end-1)',test_targets');
% hl=Hamming_loss(test_labels',test_targets');


% [hammingloss,oneerror,coverage,rankingloss,averageprecision,precision,recall,f1]=MIML_Vresults(test_targets,test_outputs);
