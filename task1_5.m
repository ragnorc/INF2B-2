%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours

for i=1:size(Ks,2)
   k = Ks(i);
  [C,idx,SSE] =  my_kMeansClustering(X,k,X(1:k,:));
  save(sprintf('task1_5_c_%d.mat',k),'C');
  save(sprintf('task1_5_idx_%d.mat',k),'idx');
  save(sprintf('task1_5_sse_%d.mat',k),'SSE');
end
end
