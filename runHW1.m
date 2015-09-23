function [  ] = runHW1( imageFileName )
%runHW1 Creates/saves LoG segmegmented picture specified by input string
%name pitcture with sigmas [3,6,12,24,48]
    
    %Here are Sigma Values
    SigmaValues = [3,6,12,14,48];
    
    %Load Image
    image = imread(imageFileName);

    %Get name for output pictures
    [~,name,~] = fileparts(imageFileName);

    %Check if RGB, if so, convert to grey
    if size(image,3)==3
        image = rgb2gray(image);
    end
    %Check if uint8, if so, convert to Double for conv2 warnings
    if isa(image,'uint8')
        image = im2double(image);
    end

    %Set loop interval
    d = size(SigmaValues,2)-1;

    for i=0:d,
      %Convolve Laplacian across the Guassian, then the Image (preferred)
        curImage = conv2(image,LaplacianSegment(GaussianFilter...
                 (SigmaValues(1,i+1))),'same');
             
      %Convolve Laplacian across the Guassian smoothed Image (other option)
%         curImage = LaplacianSegment(conv2(image,GaussianFilter...
%                  (SigmaValues(1,i+1)),'same'));
             
        %Preform zero-cross test on current image
        for(m=1:size(curImage,1)-1)
           for(n=1:size(curImage,2)-1)
                if(curImage(m,n)*curImage(m+1,n)<0 ...
                        || curImage(m,n)*curImage(m,n+1)<0)
                    curImage(m,n)=1;
                else
                    curImage(m,n)=0;
                end
           end 
        end
        
        %Convert current image to binary edge map
        curImage = im2bw(curImage);
        %Save image to current directory
        imwrite(curImage,strcat(name,'_',num2str(i),'.bmp'),'bmp');
    end
end
