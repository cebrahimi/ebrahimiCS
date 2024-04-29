function biharmonic_test ()
    
    n = 17;
    k_order = 4;
    xmin = 0;
    xmax = 1;
    ymin = 0;
    ymax = 1;
    h = ( xmax - xmin ) / ( n - 1 );

    x = linspace ( xmin, xmax, n );
    y = linspace ( ymin, ymax, n );
    
    
    [X, Y] = meshgrid(x, y);
    
  
    U = X.^4 .* ( X - 1.0 ).^2 .* Y.^4 .* ( Y - 1.0 ).^2;

    L = lap2D(k_order,n-2,h,n-2,h);
    
    BC = robinBC2D(k_order,n-2,h,n-2,h,0,0);
    L = L + BC;
    U_Vector = reshape(U,[], 1);
    final = L * L * U_Vector;
   
    final = reshape(final,[n,n]);

%     F = 24.0 * ( 1.0 - 10.0 * X + 15.0 * X.^2 ) .* ( 1.0 - Y ).^2 * Y.^4 ...
%       + 8.0 * X.^2 * ( 6.0 - 20.0 * X + 15.0 * X.^2 ) ...
%                 * Y.^2 * ( 6.0 - 20.0 * Y + 15.0 * Y.^2 ) ...
%       + 24.0 * ( 1.0 - X ).^2 * X.^4 .* ( 1.0 - 10.0 * Y + 15.0 * Y.^2 );
% 
%     surf ( X, Y, F );
%     title_string = sprintf ( 'RHS equation', k_order );
%     title ( title_string );
%     filename = sprintf ( 'RHS.png', k_order );
%     print ( '-dpng', filename );
    
    surf ( X, Y, final );
    title_string = sprintf ( 'biharmonic equation', k_order );
    title ( title_string );
 %   filename = sprintf ( 'biharmonic.png', k_order );
 %   print ( '-dpng', filename );



  return
end






