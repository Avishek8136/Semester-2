im=imread('a.png');
k=[-1 -1 -1;0 0 0;1 1 1];
out=conv2(im,k);
imshow(out,[]);