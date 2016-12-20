function [beta,EXITFLAG] = KMM(Sd,Td,r)
%
%========================================ɢ��ͼ=============================================================
% [Sd_nor,Td_nor]=numlize(Sd,Td);

% scatter(Sd_nor(:,1),Sd_nor(:,3));hold on;
% 
% scatter(Td_nor(:,1),Td_nor(:,3),'r');hold on;
% 
% ============================================================================================================
% 
% 
% =====================================�����?===============================================================
[Sd_nor,Td_nor]=numlize(Sd,Td);

Xs=Sd_nor;
Xt=Td_nor;

ns=size(Xs,1);
nt=size(Xt,1);

H=rbf_dot(Xs,Xs,r);
H=(H+H')/2;
R3 = rbf_dot(Xs,Xt,r);
f=(R3*ones(nt, 1));
f=-ns/nt*f;
eps = (sqrt(ns)-1)/sqrt(ns);
A=ones(1,ns);
A(2,:)=-ones(1,ns);%Ϊ��Լ��Ȩ��ֵ
b=[ns*(eps+1); ns*(eps-1)];

Aeq = [];
beq = [];
LB = zeros(ns,1);
UB = ones(ns,1).*3000;%Ȩ��ֵ�����½�
[beta,FVAL,EXITFLAG] = quadprog(H,f,A,b,Aeq,beq,LB,UB);
EXITFLAG

if ((EXITFLAG==0 ) && (doingRealTraining==1))
    [beta,FVAL,EXITFLAG] = quadprog(H,f,A,b,Aeq,beq,LB,UB,beta,optimset('MaxIter',2e4));
    EXITFLAG
end

%===========================================================================================================

% % [source_data,target_data]=numlize();
% % 
% % Xt=target_data.instance;
% % Xs=source_data.instance;
% % 
% % ns=size(Xs,1);
% % nt=size(Xt,1);
% % 
% % H=rbf_dot(Xs,Xs,0.5);
% % H=(H+H')/2;
% % 
% % R3 = rbf_dot(Xs,Xt,0.5);
% % f=(R3*ones(nt, 1));
% % f=-ns/nt*f;
% % eps = (sqrt(ns)-1)/sqrt(ns);
% % A=ones(1,ns);
% % A(2,:)=-ones(1,ns);%Ϊ��Լ��Ȩ��ֵ
% % b=[ns*(eps+1); ns*(eps-1)];
% % Aeq = [];
% % beq = [];
% % LB = zeros(ns,1);
% % UB = ones(ns,1).*1000;%Ȩ��ֵ�����½�
% % [beta,FVAL,EXITFLAG] = quadprog(H,f,A,b,Aeq,beq,LB,UB);
% % EXITFLAG
% % 
% % if ((EXITFLAG==0 ) && (doingRealTraining==1))
% %     [beta,FVAL,EXITFLAG] = quadprog(H,f,A,b,Aeq,beq,LB,UB,beta,optimset('MaxIter',2e4));
% %     EXITFLAG
% % end
