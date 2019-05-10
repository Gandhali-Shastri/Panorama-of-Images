function [ blend ] = create_panorama2( img1,img2,use_vlsift,use_ransac)
use_ransac =true;

if(use_vlsift == true)
    [mpts1, mpts2] = siftMatch(img1, img2);
end

[pts1] = extract_corners(img1,20);
[pts2] = extract_corners(img2,20);

WSIZE = 10;
[mpts1, mpts2] = match_corners(img1,img2,pts1, pts2,WSIZE);

[H1] = compute_homography(mpts2',mpts1');

if(use_ransac == true)
    Inlier_Ratio = 0.1; 
   
    n = size(mpts2,2); 
    THRESH = round(Inlier_Ratio*n); 
    [H, corrPtIdx] = compute_homography_ransac(mpts2',mpts1',THRESH);
    H 
end

[blend] = blend_images(H,corrPtIdx,img1,img2);

