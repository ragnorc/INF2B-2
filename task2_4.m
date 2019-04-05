%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

Corrs = zeros(11,1);
[EVecs, EVals] = comp_pca(Xtrain);
projectedPoints = (EVecs(:,1:2)' * Xtrain')';
numClasses = 10;
for i=1:numClasses
    classElements = projectedPoints(find(Ytrain==i-1),:);
    covM = myCov(classElements);
    Corrs(i) = covM(1,2)/sqrt(covM(1,1)*covM(2,2));
end
covM = myCov(projectedPoints);
Corrs(11) = covM(1,2)/sqrt(covM(1,1)*covM(2,2));

end
