function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
#{

Olivier Philip · a year ago · Edited
For each centroid k, we want to find argkmin1≤i≤m∑j=0n(X(i)j−C(k)j)2−−−−−−−−−−−−−−⎷.

We get rid of the square root since ∀0≤x,x√≤y√⟹x≤y and expand (a−b)2=a2−2ab+b2.

argkmin1≤i≤m∑j=0n(X(i)j)2−2X(i)jC(k)j+(C(k)j)2.

We get rid of (X(i)j)2 since it does not depends on k and we distribute the summation.

argkmin1≤i≤m∑j=0n(C(k)j)2−2∑j=0nX(i)jC(k)j.

For a fixed k, the first term is a scalar and the second is a m dimension vector.

For all k, the first term is a k dimension vector (easy to compute from centroids) and the second is a [m,k] matrix (easy to compute from X and centroids).

bsxfun() will expand the subtraction and min() give us the result we want.

sq_ujForallk = sum(centroids.^2,2);
xu = 2*X*centroids';
diff = bsxfun(@minus, sq_ujForallk, xu);
#}

for i=1:K
  sel = find(idx==i);
  centroids(i,:) = mean(X(sel,:));
end;

% =============================================================


end

