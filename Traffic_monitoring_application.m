clear all;
clc;
close all;
 vid=VideoReader('video.mp4');
 numFrames = vid.NumberOfFrames;
 n=numFrames;
 for i = 12n
 frames = read(vid,i);
 imwrite(frames,['Image' int2str(i), '.jpg']);
 im(i)=image(frames);
end
location = 'xxx.jpg';       %  folder in which your images exists
ds = imageDatastore(location) ;
 im1=imread('Image1.jpg');
 im1=rgb2gray(im1);
  i=1;
while hasdata(ds) 
    img = read(ds) ;             % read image from datastore
  % creates a new window for each image
 img=rgb2gray(img);

 for k=1480
     for j=1720
         if im1(k,j)>=45
             im1(k,j)=255;
         else
             im1(k,j)=0;
         end
     end
 end
  for k=1480
     for j=1720
         if img(k,j)>=45
             img(k,j)=255;
         else
             img(k,j)=0;
        end
     end
  end
 
 imnew=xor(im1,img);
 imnew=ordfilt2(imnew,1,ones(3));
 imshow(imnew);
 imwrite(imnew,[int2str(i), '.jpg']);
 i=i+1;
end
 
%  subplot(2,2,1);
%  imshow(im1);
%  subplot(2,2,2);
%  imshow(img);
%  subplot(2,2,3);
%  imnew=xor(im1,img);
%  imshow(imnew);
%  subplot(2,2,4);
%  fcbp=ordfilt2(imnew,1,ones(3));
%  imshow(fcbp);