function [ segImage ] = LaplacianSegment( Mat )
    %LaplacianSegment Returns the Laplacian Matrix of input Matrix
    Mask = [0,-1,0;-1,4,-1;0,-1,0];
    segImage = conv2(Mat,Mask,'same');
end

