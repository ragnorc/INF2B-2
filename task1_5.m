%
%
function times = task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
times = zeros(20,1);
for i=1:size(Ks,2)
   tic;
   k = Ks(i);
  [C,idx,SSE] =  my_kMeansClustering(X,k,X(1:k,:));
  %save(sprintf('task1_5_c_%d.mat',k),'C');c
  %save(sprintf('task1_5_idx_%d.mat',k),'idx');
  %save(sprintf('task1_5_sse_%d.mat',k),'SSE');
  times(k)=toc;
end
end
