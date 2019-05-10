function H = compute_homography(pts1,pts2)

%least square method
n = size(pts1,2);
A = zeros(2*n,9);
A(1:2:2*n,1:2) = pts1';
A(1:2:2*n,3) = 1;
A(2:2:2*n,4:5) = pts1';
A(2:2:2*n,6) = 1;

A(1:2:2*n,7) = -pts2(1,:)'.*pts1(1,:)';
A(2:2:2*n,7) = -pts2(2,:)'.*pts1(1,:)';
A(1:2:2*n,8) = -pts2(1,:)'.*pts1(2,:)';
A(2:2:2*n,8) = -pts2(2,:)'.*pts1(2,:)';
A(1:2:2*n,9) = -pts2(1,:)';
A(2:2:2*n,9) = -pts2(2,:)';

[evec,~] = eig(A'*A);
H = reshape(evec(:,1),[3,3])';
H = H/H(end);

end