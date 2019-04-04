function [EVecs, EVals] = comp_pca(X)
% Input:
%   X:  N x D matrix (double)
% Output:
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
%% TO-DO
sampleSize = size(X,1);
covarianceMatrix = zeros(784,784);
meanVector = myMean(X);
for i=1:sampleSize
   covarianceMatrix = covarianceMatrix + ((X(i,:)-meanVector)'*(X(i,:)-meanVector));
end
covarianceMatrix = covarianceMatrix / sampleSize;
[EVecs, EVals] = eig(covarianceMatrix);
EVals = diag(EVals);
for i=1:size(EVals,1)
    if EVecs(1,i) < 0
       EVecs(:,i) = (-1)*EVecs(:,i);
    end
end
[EVals,indices] = sort(EVals,'descend');
EVecs = EVecs(:,indices);

end

