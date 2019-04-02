%
function [C, idx, SSE, helper] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

%% If 'maxIter' argument is not given, we set by default to 500
if nargin < 4
    maxIter = 500;
end

%% TO-DO
[numPoints,pointDim] = size(X);
idx = zeros(numPoints,1);
C = initialCentres;
%centroids = datasample(X,k,'Replace',false);

for i=1:maxIter
    idxInvariant = true;
    SSE(i,:) = 0;
    distMatr = vectorisedEuclid(X,C,numPoints,k);
    %Assign points to clusters
    for p=1:numPoints
        [minDist,clusterIndex] = min(distMatr(p,:));
        SSE(i,1) = SSE(i,1) + minDist;
        if idx(p) ~= clusterIndex
            idxInvariant = false;
            idx(p) = clusterIndex;
        end
    end
    helper(:,i) = idx;
    
    if idxInvariant
        break;
    end
 
    
    
    %Recompute centroids
    C = zeros(k, pointDim);
    for cluster=1:k
        XCluster = X(idx==cluster,:);
        denom = size(XCluster,1);
        C(cluster, :) = (1/denom) * sum(XCluster);
        %C(cluster, :) = (1/denom) * [sum(xi(:,1)) sum(xi(:,2))];
    end
end
