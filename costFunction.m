function[J,grad]=costFunction(theta,X,y)
m=length(y);
J=(-y'*log(sigmoid(X*theta))-(1-y)'*log(1-sigmoid(X*theta)))/m;
grad=X'*(sigmoid(X*theta)-y)/m;
end