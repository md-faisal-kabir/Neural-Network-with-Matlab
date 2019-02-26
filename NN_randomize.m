function random_rows =NN_randomize(train_dataset)
[r,~] =size(train_dataset);
randomRowIdxs = randperm(r);
random_rows=train_dataset(randomRowIdxs,:);
end
