function [pts] = extract_corners(img,THRESH) 

I=rgb2gray(img); 
I =double(I); 
min_N=350;max_N=450; 
 
sigma=1.4;  
radius=4;  
dx = [-1 0 1; -1 0 1; -1 0 1];
dy = dx'; 

Ix = conv2(I, dx, 'same');    
Iy = conv2(I, dy, 'same'); 
g = fspecial('gaussian',5*sigma, sigma);

Ix2 = conv2(Ix.^2, g, 'same');   
Iy2 = conv2(Iy.^2, g, 'same'); 
Ixy = conv2(Ix.*Iy, g,'same'); 

k = 0.04; 
R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2; 
R11=(1000/max(max(R11)))*R11; 
R=R11; 

sze = 2*radius+1; 
% non-Maximun supression 
NonMax = ordfilt2(R,sze^2,ones(sze));
R11 = (R==NonMax)&(R>THRESH);       
count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5))); 


loop=0;
while (((count<min_N)||(count>max_N))&&(loop<30)) 
    if count>max_N 
        THRESH=THRESH*1.5; 
    elseif count < min_N 
        THRESH=THRESH*0.5; 
    end 

    R11 = (R==MX)&(R>THRESH);  
    count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5))); 
    loop=loop+1; 
end 

%Interest points
R=R*0; 
R(5:size(R11,1)-5,5:size(R11,2)-5)=R11(5:size(R11,1)-5,5:size(R11,2)-5);% 
[r1,c1] = find(R); 
IP=[r1,c1]; 
pts=IP; 

