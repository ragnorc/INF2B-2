%
%
function get = task1_8(X)
%  NB: there is no specification to this function.
load('task1_2_M.mat','M'); 
% [C,idx,SSE] =  my_kMeansClustering(X,10,X(1:10,:));
% save('task1_8_c_10_initialSample.mat','C');
% save('task1_8_sse_10_initialSample.mat','SSE');
% [C,idx,SSE] =  my_kMeansClustering(X,10,M(1:10,:));
% save('task1_8_c_10_means.mat','C');
% save('task1_8_sse_10_means.mat','SSE');
% [C,idx,SSE] =  my_kMeansClustering(X,10,rand(10,784));
% save('task1_8_c_10_random.mat','C');
% save('task1_8_sse_10_random.mat','SSE');
% k=10;
% X = X';
%  C = X(:,1+round(rand*(size(X,2)-1)));
%     L = ones(1,size(X,2));
%     for i = 2:k
%         D = X-C(:,L);
%         D = cumsum(sqrt(dot(D,D,1)));
%         if D(end) == 0, C(:,i:k) = X(:,ones(1,k-i+1)); return; end
%         C(:,i) = X(:,find(rand < D/D(end),1));
%         [~,L] = max(bsxfun(@minus,2*real(C'*X),dot(C,C,1).'));
%     end
%  [C,idx,SSE] =  my_kMeansClustering(X',10,C');
% save('task1_8_c_10_k++.mat','C');
% save('task1_8_sse_10_k++.mat','SSE');

% task1_6('task1_8_c_10_initialSample.mat')
% task1_6('task1_8_c_10_means.mat')
% task1_6('task1_8_c_10_random.mat')
% task1_6('task1_8_c_10_k++.mat')
load('task1_8_sse_10_k++.mat','SSE');
figure
plot([1:size(SSE,1)],SSE);
hold on;
load('task1_8_sse_10_means.mat','SSE');
plot([1:size(SSE,1)],SSE);
load('task1_8_sse_10_random.mat','SSE');
plot([1:size(SSE,1)],SSE);
load('task1_8_sse_10_initialSample.mat','SSE');
plot([1:size(SSE,1)],SSE);
%axis([0 40 0 3])

end
