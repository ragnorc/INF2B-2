function plotgauss2D(means,covM,points)

%axes
% var = diag(covM);
% maxsd = max(var(1),var(2));
% x = meanVector(1)-2*maxsd:0.1:meanVector(1)+2*maxsd;
% y = meanVector(2)-2*maxsd:0.1:meanVector(2)+2*maxsd;
% probStd = myGaussPDF(meanVector,covM,sqrt(var),0);
% disp(probStd);
% [X Y] = meshgrid(x,y);
% grid2D = [X(:), Y(:)];
% numPoints = size(grid2D,1);
% prob = zeros(numPoints,1);
% plotPoints = zeros(numPoints,2);
% for i=1:numPoints
%     p = myGaussPDF(meanVector,covM,grid2D(i,:)',0);
%     %p = mvnpdf(point,meanVector,covM);
%     if abs(p - probStd) < 0.1 * probStd
%     prob(i)=p;
%     plotPoints(i,:)=grid2D(i,:);
%     else
%     prob(i)=0;
%     end
%     %disp(p);
%  
% end
% scatter(plotPoints(:,1),plotPoints(:,2),100,'Marker','.');
% hold on;


npts = 50;
axh = gca;
tt=linspace(0,2*pi,npts)';
x = cos(tt); y=sin(tt);
ap = [x(:) y(:)]';
[v,d]=eig(covM); 
d = sqrt(d); % 1 standard deviation as required by taks
bp = (v*d*ap) + repmat(means, 1, size(ap,2)); 
h = plot(bp(1,:), bp(2,:), '-', 'parent', axh);
hold on
end