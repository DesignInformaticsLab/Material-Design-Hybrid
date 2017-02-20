% clear
% load('hidstates3rd_alloy2_(24f40f64f6ws9ws9ws).mat')
cluster_num=8;
for i = 1:100
    fprintf('Loading image %d...\n',i);
%     xtr_temp=reshape(xtr(i,:),[1296 288]);
    xtr_temp=reshape(hidstate,[288 1296])';
    [idx,C]=kmeans(xtr_temp',cluster_num);
    for j = 1:cluster_num
        index{j}=find(idx==j);
    end
    index_store{i}=index;
end



for k = 1:cluster_num
    cluster_compare=index_store{1}{k};
    for j = 2:60
        for i = 1:cluster_num
            cluster_temp=index_store{j}{i};
            count(i)=numel(intersect(cluster_compare,cluster_temp));
        end
        [~,index_temp]=max(count);
        cluster_compare=intersect(cluster_compare,index_store{j}{index_temp});
    end
    cluster_store{k}=cluster_compare;
end