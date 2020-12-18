function [error_train, error_val] = learningCurvemulti(X, y, Xval, yval, lambda, multitimes)
%UNTITLED4 此处显示有关此函数的摘要
m = size(X, 1);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

for i = 1:m
    error_train_tmp = 0;
    error_val_tmp = 0;
    for j = 1:multitimes
        selectIndex = randperm(12, i);
        theta = trainLinearReg(X(selectIndex,:), y(selectIndex,:), lambda); 
        
        error_train_tmp = error_train_tmp + linearRegCostFunction(X(selectIndex,:), y(selectIndex,:), theta, 0);
        selectIndex = randperm(12, i);
        
        error_val_tmp = error_val_tmp + linearRegCostFunction(Xval(selectIndex,:), yval(selectIndex,:), theta, 0);
    end
    error_train(i) = error_train_tmp / multitimes;
    error_val(i) = error_val_tmp / multitimes;
end

end

