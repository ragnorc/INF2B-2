%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)

indices = ones([1,10]);
montageImages = zeros(28,28,10,10);
% 4D matrix 28x28x10 (sample) x10 (class)
for i=1:size(Y,1)
    classIndex = Y(i)+1;
    sampleIndex = indices(classIndex);
    if sampleIndex <= 10
        montageImages(:,:,sampleIndex,classIndex) = reshape(X(i,:), 28, 28)';
        indices(classIndex) = sampleIndex + 1;
    end
end
for c=1:10
    figure, montage(montageImages(:,:,:,c));
end
end
