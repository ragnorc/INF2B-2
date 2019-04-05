 dset_dir = '/Users/ragnor/Development/repos/INF2B-2';
  [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
  Xtrn = double(Xtrn)/255.0;
  Xtst = double(Xtst)/255.0;
  % disp_one(Xtrn, Ytrn);
  %imshow( reshape(V(3,:), 28, 28)' );
  %task1_1(Xtrn, Ytrn);
  %M = task1_2(Xtrn, Ytrn);
  %save('task1_2_M.mat','M');
  %comp_pca(Xtrn(1:30,:));
% montageImages = zeros(28,28,11);
% for c=1:10
% montageImages(:,:,c) = reshape(C(c,:), 28, 28)';
% end
% figure
% montage(montageImages);

% save('task1_7_dmap_1.mat','Dmap');
% Dmap = task1_7('task1_5_c_2.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_2.mat','Dmap');
% Dmap = task1_7('task1_5_c_3.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_3.mat','Dmap');
% Dmap = task1_7('task1_5_c_5.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_5.mat','Dmap');
% Dmap = task1_7('task1_5_c_10.mat', 'task1_2_M.mat', 'task1_3_evecs.mat','task1_3_evals.mat', mean(Xtrn), 200);
% save('task1_7_dmap_10.mat','Dmap');

% Ks = [1,2,3,4,5,7,10,15,20];
% for i=1:size(Ks,2)
%     figure
%     task1_6(sprintf('task1_5_c_%d.mat',Ks(i)));
% end
% plot the gaussian fits
% [EVecs, EVals] = comp_pca(Xtst);
% projectedPoints = (EVecs(:,1:2)' * Xtst')';
% numClasses = 10;
% numPoints = size(projectedPoints,1);
% classElements = projectedPoints(find(Y==0),:);
% C = myCov(classElements);
% means = myMean(classElements)';
% 

