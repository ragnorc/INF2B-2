%
function [C, idx, SSE] = joankmeans(X, k, initialCentres, maxIter)
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
  
  C = initialCentres;
  idx = zeros(size(X,1),1);
  SSE = [];
  
  for l=1:maxIter
      convergence = true;
      SSE_entry = 0;
      dist_matrix = joansqd(X,C);
      for n = 1:size(X,1)
          [min_dist, index] = min(dist_matrix(n,:));
          if index ~= idx(n,1)
              convergence = false;
              idx(n,1) = index;
          end
          SSE_entry = SSE_entry + min_dist;
      end
      % Add the new sum squared error to the list
      SSE = [SSE SSE_entry];
      
      if convergence
          break;
      end
      
      C = compute_new_centres(C, X, idx);
  end
  return;
  
end

function C = compute_new_centres(C, X, idx)
    for c = 1:size(C,1)
        Xc = X(idx==c,:);
        C(c,:) = size(Xc,1)^(-1) * sum(Xc);
    end
    return;
end