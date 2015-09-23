function [ GaussMat ] = GaussianFilter( Sigma )
%GaussianFilter Returns filtered matrix for desired Sigma

    %Create temporary Matrix
    n = Sigma*8-3;
    if (n<3)
        n=3;
    end
    n = floor(n);
    GaussMat = zeros(n);

    %Create pi var w/ more sig figs
    PI = 3.14159265359;
    %Create coef to min computations
    Coef = 1/(2*(Sigma)^2);
    
    %Create var to tell positon in Matrix relative to center unit
    Del = ceil(n/2);
    %Set Gaussian Values
    for x=1:n,
        for y=1:n,
            GaussMat(x,y) = Coef/PI*...
                exp(-1*Coef*((x-Del)^2+(y-Del)^2));
        end 
    end
    
end