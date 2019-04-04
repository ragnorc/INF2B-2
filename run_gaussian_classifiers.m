function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

numClasses = 10;
[numTrain, dimTrain] = size(Xtrain);
[numTest, dimTest] = size(Xtest);
Ypreds = zeros(size(Xtest,1),1);
Ms = zeros(numClasses,dimTrain);
Covs = zeros(numClasses,dimTrain,dimTrain);

%Learn parameters
for i=1:numClasses
    classElements = Xtrain(find(Ytrain==i-1),:);
    Ms(i,:) = myMean(classElements);
    Covs(i,:,:) = myCov(classElements);
end

%Classification
% for i=1:numTest
%     maxClass = 1;
%     maxP = 0;
%     for c=1:numClasses
%       p = myGaussPDF(Ms(c,:)',reshape(Covs(1,:,:), [dimTrain,dimTrain]),Xtest(i,:)',epsilon);
%       if p >= maxP
%           maxClass = c;
%       end
%     end
%     
% end


%Classification
logProbMatrix = zeros(numClasses,numTest);
for i=1:numClasses
   logProbMatrix(i,:) = myLogpdf(Ms(i,:),reshape(Covs(i,:,:), [dimTrain,dimTrain]), Xtest, epsilon);
 end

[maxV,maxI] = max(logProbMatrix);
Ypreds = (maxI - ones(1,numTest))'; %Subtract 1 since working with labels zero

end
