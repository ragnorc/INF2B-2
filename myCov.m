function cov = myCov(X)

[sampleSize,dim] = size(X);
meanVector = myMean(X);
cov = zeros(dim,dim);
for i=1:sampleSize
    cov = cov + ((X(i,:)-meanVector)'*(X(i,:)-meanVector));
end
cov = cov / sampleSize;
end