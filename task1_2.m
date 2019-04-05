%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.

M = zeros(11,784);
numSamples = size(Y,1);
sizes = zeros(11,1);
sizes(11) = numSamples;
for i=1:numSamples
    classIndex = Y(i) + 1;
    M(classIndex,:) = M(classIndex,:) + X(i,:);
    M(11,:) = M(11,:) + X(i,:);
    sizes(classIndex) = sizes(classIndex) + 1;
    
end
M = M ./ sizes;
montageImages = zeros(28,28,11);
for c=1:11
    montageImages(:,:,c) = reshape(M(c,:), 28, 28)';
end
montage(montageImages);
end
