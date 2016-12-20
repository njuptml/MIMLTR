
% load the data
load('imagedata_1.mat');
 tic;
% get the predictions for the test data
apa=0;
for i=1:10
    [ap,rl,pre,rec,f1,oe,hl]=MIMLfast(train_data,train_targets,test_data,test_targets);
    apa=apa+ap;
end
disp(apa/10);
Timecost=toc;