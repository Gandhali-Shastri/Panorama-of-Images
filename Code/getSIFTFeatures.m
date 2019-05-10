function [f, d] = getSIFTFeatures(image)
run('F:\MATLAB\vlfeat-0.9.21\toolbox\vl_setup');

%convert images to greyscale
if (size(image, 3) == 3)
    Im = single(rgb2gray(image));
else
    Im = single(image);
end

% get features and descriptors
[f, d] = vl_sift(Im);

end