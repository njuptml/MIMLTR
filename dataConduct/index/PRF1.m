function [ Precision,Recall,F1] = PRF1(Outputs,test_target,varargin)
%SLPRF Calculate the average micro Precision, recall and F1 measure
% $ Syntax $
%   - slprf( X,Y,varargin)

%
% $ Description $
%   %Outputs,: the predicted labels of the classifier, if the ith instance
%belong to the jth class, Outputs(j,i)=1, otherwise Outputs,(j,i)=0
%test_target: the actual labels of the test instances, if the ith instance belong to the jth class, test_target(j,i)=1, otherwise test_target(j,i)=-1
%transform: calculated on Output{-1,1} test_target{-1,1}   
%   - 'type':   the type of P,R,F: 
%               'micro'--micro-averaging (results are computed based on global sums over all decisions) (default ='micro')
%               'macro'--macro-averaging (results are computed on a
%               per-category basis, then averaged over categories)
%       Micro-averaged scores tend to be dominated by the most commonly used categories, 
%       while macro-averaged scores tend to be dominated by the performance in rarely used categories. 
%   
% $ History $
%   - Created by Xiangnan Kong, on Jan 7, 2008
%
%% parse and verify input arguments
opts.type='micro';
opts = slparseprops(opts, varargin{:});
%% calculate average Precision
Outputs = ((Outputs > 0)-.5)*2;

    [num_class,num_instance]=size(Outputs);
    temp_Outputs=[];
    temp_test_target=[];
    for i=1:num_instance
        temp=test_target(:,i);
        if((sum(temp)~=num_class)&&(sum(temp)~=-num_class))
            temp_Outputs=[temp_Outputs,Outputs(:,i)];
            temp_test_target=[temp_test_target,temp];
        end
    end
    Outputs=temp_Outputs;
    test_target=temp_test_target;   


X=Outputs;
Y=test_target;
[num_class,num_instance]=size(Y); 

X(X>0) = 1;X(X<=0) = 0;
Y(Y>0) = 1;Y(Y<=0) = 0;


disp(size(X));
disp(size(Y));
XandY = X&Y;
if strcmp(opts.type,'micro')
    if sum(XandY(:))==0
        Precision=0;
        Recall=0;
        F1=0;
    else if  sum(X(:))==0
        Precision=0;
        Recall=0;
        F1=0;  
        else if sum(Y(:))==0
                 Precision=0;
                 Recall=0;
                 F1=0;  
            else
    Precision=sum(XandY(:))/sum(X(:));
     
    Recall=sum(XandY(:))/sum(Y(:));
    F1=2*Precision*Recall/(Precision+Recall);
          end
        end
    end
    
end
if strcmp(opts.type,'marco')
    p=sum(XandY,2)./sum(X,2);
    r=sum(XandY,2)./sum(Y,2);
    tmp_p=find(isnan(p));
    tmp_r=find(isnan(r));
     
    p(tmp_p)=0;
    r(tmp_r)=0;
    f=2*p.*r./(p+r);
    
    tmp_f=find(isnan(f));
    f(tmp_f)=0;
    
    Precision = mean(p);
    Recall = mean(r);
    F1 = mean(f);
     
    
end


if strcmp(opts.type,'Wmarco')
    p=sum(XandY,2)./sum(X,2);
    r=sum(XandY,2)./sum(Y,2);
    tmp_p=find(isnan(p));
    tmp_r=find(isnan(r));
     
    p(tmp_p)=0;
    r(tmp_r)=0;
    f=2*p.*r./(p+r);
    
    tmp_f=find(isnan(f));
    f(tmp_f)=0;   
    
    freL=sum(Y,2)/num_instance;
    
    Precision = sum((p.*freL)/sum(freL));
    Recall =  sum((r.*freL)/sum(freL));
    F1 =  sum((f.*freL)/sum(freL));
     
    
end


