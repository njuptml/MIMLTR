function [Pre,Rec,F1,Ap,Cov,Hloss,OError,RLoss]=standerd(Outputs,Pre_Labels,test_target)
[Pre,Rec,F1]=PRF1(Outputs,test_target)
Ap=Average_precision(Outputs,test_target)
Cov=coverage(Outputs,test_target)
Hloss=Hamming_loss(Pre_Labels,test_target)
OError=One_error(Outputs,test_target)
RLoss=Ranking_loss(Outputs,test_target)
