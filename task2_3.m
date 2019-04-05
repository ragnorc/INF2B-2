%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

[EVecs, EVals] = comp_pca(X);
projectedPoints = (EVecs(:,1:2)' * X')';
numClasses = 10;
numPoints = size(projectedPoints,1);
% Parameter Estimation for Gaussian

for i=1:numClasses
    classElements = projectedPoints((Y==i-1),:);
    if(size(classElements,1)>2)
        plotgauss2D(myMean(classElements)',myCov(classElements));
        hold on;
    end
end

end
