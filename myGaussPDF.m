function p = myGaussPDF(mu,sigma,point,epsilon)
%Expecting column vectors for mu and point
sigma = sigma + epsilon*eye(size(sigma,1));
p = 1/(sqrt((2*pi)^2*logdet(sigma))) * exp(-0.5 *((point-mu)'*inv(sigma)*(point-mu)));

end