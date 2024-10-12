function whiteRemoving(X,filename,filetype)
%WHITEREMOVING 去除图像白边，并保存图片
%   X为图像矩阵，filepath为保存路径，filetype为保存类型

% default set
if nargin < 3
    filetype = 'png';
end

% remove boundaries
set(gca, 'Position', get(gca, 'OuterPosition') - get(gca, 'TightInset')... 
* [-1 0 1 0; 0 -1 0 1; 0 0 1 0; 0 0 0 0]);
% the first -1 corresponds to dx_left; 
% ＜-1 represents right-shift the region of interest, e.g., -1.2, -2, ...;
% the second -1 corresponds to dy_bottom, <-1 represents up-shift; >-1 ...
% The four coefficients can be changed according to unique applications. 

% save the image
saveas(X,filename,filetype);
end