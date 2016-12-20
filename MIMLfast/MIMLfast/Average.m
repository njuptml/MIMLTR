function [results]=Average(train_data,train_targets,test_data,test_targets,run_num)

perform=zeros(run_num,8);

%% main program
for i=1:run_num
    tic;
    [ap,rl,pre,rec,f1,oe,hl]=MIMLfast(train_data,train_targets,test_data,test_targets);
    timecost=toc;
    perform(i,1)=ap;
    perform(i,2)=rl;
    perform(i,3)=pre;
    perform(i,4)=rec;
    perform(i,5)=f1;
    perform(i,6)=oe;
    perform(i,7)=hl;
    perform(i,8)=timecost;
end

results=mean(perform,1);

end

