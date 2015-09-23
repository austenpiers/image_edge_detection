function [ blurdImage ] = LoG_Filter( image, Sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
PI = 3.14159265359;
mask = zeros(Sigma);
Coef = 1/(PI*(Sigma/7)^4);
Div = 1/(2*(Sigma/7)^2);
Del = ceil(Sigma/2);
for x=1:Sigma,
    for y=1:Sigma,
        Val = Div*((x-Del)^2+(y-Del)^2);
        mask(x,y) = -1*Coef*(1-Val)*exp(-1*Val);
    end 
end
%mask
mask = fspecial('log',Sigma,Sigma/8)
% fspecial('log',Sigma,Sigma/8);
% figure;
% surf(mask);
% hold on;
% figure;
% surf(fspecial('log',Sigma,Sigma/8));
% hold on;
%blurdImage = imfilter(image,mask,'conv');
blurdImage = conv2(image,mask,'valid');
% mask
% figure;
% imshow(blurdImage);
% hold on;
end