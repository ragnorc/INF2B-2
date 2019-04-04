

function dist_matrix = mySquaredDist(X,Y)
    %% Calculate distances between vectors of 2 matrices using the
    %% vectorisation algorithm described in the coursework helpsheet.
    rowsX = size(X,1);
    rowsY = size(Y,1);
    XX = zeros(rowsX,1);
    for i=1:rowsX
        XX(i,:) = X(i,:)*X(i,:)';
    end
    YY = zeros(rowsY,1);
    for i=1:rowsY
        YY(i,:) = Y(i,:)*Y(i,:)';
    end
    dist_matrix = repmat(XX,1,rowsY) - 2*X*Y' + repmat(YY,1,rowsX)';
    return;
end