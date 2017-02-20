for ii = 1:100
fprintf('processing 3rd hidstate %d...\n',ii);
fname = sprintf('hidstates3rd_10_WB_(24f40f288f6ws9ws9ws)_%d',ii);
f1=load(sprintf('%s.mat', fname));   
temp = double([f1.hidstate;]);
temp = permute(temp,[3,1,2]);%% caution, changed from [3,2,1] 12/9 2016
for i = 1:40
    temp2=reshape(temp(:,i),[36 36]);
    temp2=imresize(temp2,[18 18]);
    temp3(:,i)=double(im2bw(temp2(:)));
end
fname2 = sprintf('hidstates3rd_10_WB_pooled_(24f40f288f6ws9ws9ws)_%d',ii);
save(sprintf('3rd_hidstate/%s.mat',fname2),'temp3', '-v7.3');

xtr(ii,:) = temp3(:)';
% f1=load([CIFAR_DIR '/filter8_ws12.mat']);
end
fname3 = sprintf('hidstates3rd_10_WB_pooled');
save(sprintf('3rd_hidstate/%s.mat',fname3),'xtr', '-v7.3');
fprintf('data to be trained in the next layer is ----->\n 3rd_hidstate//%s.mat\n',fname3);
