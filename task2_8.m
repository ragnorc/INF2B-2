function task2_8(Xtrain, Ytrain, Xtest, Ytest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Xtrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ytest  : N-by-1 label vector (uint8) for Xtest
%   epsilon : A scalar parameter for regularisation
%   L      : scalar (integer) of the number of Gaussian distributions per class


numSamples = size(Xtest,1);

tic
[Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L);
time = toc;
fprintf('Number of test samples: %d\n',numSamples);
fprintf('User time taken in seconds: %.2f\n',time);
[cm, acc] = comp_confmat(Ytest,Ypreds(:,1));
fprintf('Accuracy: %.4f\n',acc);
fprintf('Number of wrongly classified test samples: %d\n',numSamples-sum(diag(cm)));
save(sprintf('task2_8_cm_%d.mat',L),'cm');
Ms1 = MMs(1:L,:);
Covs1 = MCovs(1:L,:,:);

save(sprintf('task2_8_g%d_m1.mat',L),'Ms1');
save(sprintf('task2_8_g%d_cov1.mat',L),'Covs1');



end
