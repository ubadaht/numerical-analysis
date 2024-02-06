close all
%Load the picture 
[I] = imread('tumor.jpg');
imagesc(I)
colormap(gray)

INT_SPLINE_CURVE = 1;
INT_POLY         = 0;

%c. Interpolant with a single spline curve 
if (INT_SPLINE_CURVE)
    disp('Pick interpolation points for the entire profile (from R to L)')
    [x,y] = ginput
    x = [x; x(1)];
    y = [y; y(1)];
    n = length(x);
    t = linspace(0,1,n);
    tt= linspace(0,1,100);
    xx = spline(t,x,tt);
    yy = spline(t,y,tt);
    figure(1);
    plot(xx,yy,'k-',x,y,'ro');
    legend('Spline Interpolant','Interpolation points');
    axis equal
end

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a.  Interpolate using 2 lower and upper polynomials
%
if (INT_POLY)
    imagesc(I)
    colormap(gray)
    % Pick the interpolation points for the upper profile until the
    %    return key is pressed..
    disp('Pick interpolation points for the upper profile (from R to L)')
    [xup,yup] = ginput
    % Note that the x-coordinates must be in ascending order
    nup = length(xup);
    yup = - yup; 
    %Because of the way imagesc displays pictures, 
    %the y coordinates need to be negated to make our interpolated right-side up.

    % Pick the interpolation points for the lower profile, but reuse the
    % end points from the upper.
    disp('Pick interpolation points for the lower profile (from R to L).')
    disp('The two endpoints from the upper will be reused.')
    [xlo,ylo] = ginput
    %xlo = [xup(1);xlo;xup(nup)];
    %ylo = [yup(1);-ylo;yup(nup)];
    nlo = length(xlo);
    ylo = - ylo; 

    disp('Interpolation points for the upper profile:')
    [xup,yup]

    disp('Interpolation points for the lower profile:')
    [xlo,ylo]
    %===============================================================
    %1. UPPER interpolant poly
    %  evaluation points
    xxup=linspace(min(xup),max(xup),200);
    %  compute Newton coefficients
    cup=InterpN(xup,yup);
    %  evaluate interpolant poly
    yyup=HornerN(cup,xup,xxup);
    %------------------------------------------------
    %2. LOWER interpolant poly
    %  evaluation points
    xxlo=linspace(min(xlo),max(xlo),200);
    %  compute Newton coefficients
    clo=InterpN(xlo,ylo);
    %  evaluate interpolant poly
    yylo=HornerN(clo,xlo,xxlo);
    %-------------------------------------------------
    %  join the interpolating points 
    xt=[xup; flip(xlo); xup(1)];
    yt=[yup; flip(ylo); yup(1)];
    figure(2);
    plot(xxup,yyup,'b-',xxlo,yylo,'c-',xt,yt,'r-',xt,yt,'ro');
    legend('UPPER Interpolant','LOWER Interpolant','Linear Interp.','Points');
    axis equal
end