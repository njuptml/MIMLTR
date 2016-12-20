dataname='imagedata_0';   %text_2_fv
load([dataname,'.mat']);

iter_num=20;
[results]=Average(train_data,train_targets,test_data,test_targets,iter_num);