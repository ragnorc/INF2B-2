  dset_dir = '/Users/ragnor/Development/repos/INF2B-2';
  [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
  Xtrn = double(Xtrn)/255.0;
  Xtst = double(Xtst)/255.0;
  % disp_one(Xtrn, Ytrn);
  %imshow( reshape(V(3,:), 28, 28)' );
  %task1_1(Xtrn, Ytrn);
  %M = task1_2(Xtrn, Ytrn);
  %save('task1_2_M.mat','M');
  comp_pca(Xtrn(1:30,:));
  