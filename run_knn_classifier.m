function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest
numXtrain = size(Xtrain,1);
numXtest = size(Xtest,1);
numL = size(Ks,2);
distMatr = mySqDist(Xtest,Xtrain,numXtest,numXtrain);
Ypreds = zeros(numXtest,numL);
for l=1:numL
    for i=1:numXtest
        [d I] = sort(distMatr(i,:), 'ascend');
        Ypreds(i,l) = mode(Ytrain(I(1:Ks(l))));
    end
end
Ypreds = uint8(Ypreds);
end
