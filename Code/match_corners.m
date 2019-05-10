function [mpts1,mpts2] = match_corners(img1,img2,pts1,pts2,WSIZE) 
img1=rgb2gray(img1); 
img1 =double(img1);
img2=rgb2gray(img2); 
img2 =double(img2);

matchTable = zeros(1,size(pts1,1)); 
ncc=zeros(1,size(pts2,1)); 

counter=zeros(1,size(pts2,1));
WSIZE =round(WSIZE /2) -3;

for i=1:size(pts1,1) 
     for j=1:size(pts2,1) 
        %windw siz
        i1=img1(pts1(i,1)-WSIZE: pts1(i,1)+WSIZE,pts1(i,2)-WSIZE: pts1(i,2)+WSIZE); 
        i2=img2(pts2(j,1)-WSIZE: pts2(j,1)+WSIZE,pts2(j,2)-WSIZE: pts2(j,2)+WSIZE); 
        %mean of win
        i1Mean=mean(mean(i1)); 
        i2Mean=mean(mean(i2));
        %sustract the mean
        i1=i1-i1Mean; 
        i2=i2-i2Mean; 
        %sum squared
        i1_sum_sq=sum(sum(i1.^2))^0.5; 
        i2_sum_sq=sum(sum(i2.^2))^0.5; 
        %nomlztion
        i1Norm=i1/i1_sum_sq; 
        i2Norm=i2/i2_sum_sq;
        
        %dot products 
        ncc(j)= sum(sum(i1Norm.*i2Norm)); 
     end
     %sort corrspondnc
     [vals,index]=sort(ncc);
  
    
   if (vals(end)>0.9)&&(counter(index(end))==0) 
      matchTable(i) = index(end); 
      counter(index(end))=1; 
   else 
      matchTable(i) = 0; 
   end 
      
 end 

idx1 = find(matchTable); 
idx2 = matchTable(idx1); 
x1 = pts1(idx1,2); 
x2 = pts2(idx2,2); 
y1 = pts1(idx1,1); 
y2 = pts2(idx2,1); 
 
mpts1 = [x1,y1]; 
mpts2 = [x2,y2]; 
 
end

