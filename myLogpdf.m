function [logp] = myLogpdf(mu,Sigma,x,epsilon)
% returns log likelihood array for N X D data points x
Sigma = Sigma + epsilon*eye(size(Sigma,1));
[N,D] = size(x);
const = -0.5 * D * log(2*pi);
xc = bsxfun(@minus,x,mu);
logp = (-0.5 * sum((xc / Sigma) .* xc, 2))' + (const - 0.5 * logdet(Sigma));
end