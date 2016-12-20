function data_new =Weight(data,beta)
b=beta;
X=data;
t=size(X, 2);
b=repmat(b,1,t);
data_new=b.*X;









%===================================================================

% plot(1:5991,X(:,1),'r');hold on;
% plot(1:5991,Xnew(:,1),'b');hold on;




% X=ones(9,3);
% b=[1,2,3,4,5,6,7,8,9]';
% b=repmat(b,1,3);
% X=b.*X;
