function [testError] = computerTestSetError(X, y, Xtest, ytest, lambda)
%UNTITLED3 计算测试级误差
theta = trainLinearReg(X, y, lambda);
testError = linearRegCostFunction(Xtest, ytest, theta, 0);

end

