function mean = MyMean(X)

denom = size(X,1);
mean = sum(X,1)/denom;
end