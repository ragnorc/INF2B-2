%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
images = zeros(10,784,10);
indices = ones([1,10]);
montageVar = zeros(28,28,10);
  % 28x28 image x 10 samples x to digits
% 10 samples * 784 pixels (image row vector) * 10 classes
for i=1:size(Y,1)
    classIndex = Y(i)+1;
    sampleIndex = indices(classIndex);
    if sampleIndex <= 10
    images(sampleIndex,:,classIndex) = X(i,:);
    montageVar(:,:,sampleIndex,classIndex) = reshape(X(i,:), 28, 28)';
    indices(classIndex) = sampleIndex + 1;
    end
end
for c=1:10  
figure, montage(montageVar(:,:,:,c));
end
end
