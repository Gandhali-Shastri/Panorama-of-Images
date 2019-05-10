% %References: https://www.mathworks.com/matlabcentral/fileexchange/46148-image-mosaicing?s_tid=FX_rc2_behav
% https://github.com/yihui-he/panorama
% www.nowpublishers.com/article/DownloadSummary/CGV-009
% https://dsp.stackexchange.com/questions/21703/how-to-apply-a-2d-2d-homography-matrix-to-an-image
% 1.pdf
% https://www.mathworks.com/matlabcentral/fileexchange/30809-ransac-algorithm-with-example-of-finding-homography

file = 'mall';
ext = 'jpg';
img1 = imread([file '1.' ext]);
img2 = imread([file '2.' ext]);
img3 = imread([file '3.' ext]);
img4 = imread([file '4.' ext]);
img5 = imread([file '5.' ext]);
use_vlsift = false; 
use_ransac = false;

img0 = create_panorama2(img2,img1,use_vlsift,use_ransac);
figure,imshow(img0)

img1 = create_panorama2(img1,img0,use_vlsift,use_ransac);
figure,imshow(img1)

img2 = create_panorama2(img2,img1,use_vlsift,use_ransac);
figure,imshow(img2)

img3 = create_panorama2(img3,img2,use_vlsift,use_ransac);
figure,imshow(img3)

img4 = create_panorama2(img4,img3,use_vlsift,use_ransac);
figure,imshow(img4)

img5 = create_panorama2(img5,img4,use_vlsift,use_ransac);
figure,imshow(img5)