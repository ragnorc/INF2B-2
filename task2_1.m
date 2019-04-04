%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

numSamples = size(Xtest,1);
for i=1:size(Ks,2)
    tic
    Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest,Ks(i));
    time = toc;
    fprintf('Number of nearest neighbours: %d \n',Ks(i));
    fprintf('Number of test samples: %d\n',numSamples);
    fprintf('User time taken in seconds: %.2f\n',time);
    [cm, acc] = comp_confmat(Ytest,Ypreds(:,1));
    fprintf('Accuracy: %.4f\n',acc);
    fprintf('Number of wrongly classified test samples: %d\n',numSamples-sum(diag(cm)));
    save(sprintf('task2_1_cm%d.mat',Ks(i)));
    
end




end
