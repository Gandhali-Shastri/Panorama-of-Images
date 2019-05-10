function [H corrPtIdx] = compute_homography_ransac(pts1,pts2,THRESH)
%threshh is calculated inside the function

coef.minPtNum = 4;
coef.iterNum = 30;
coef.thDist = 4;
coef.thInlrRatio = .1;

[H corrPtIdx] = ransac1(pts1,pts2,coef,@compute_homography,@calcDist);


end
