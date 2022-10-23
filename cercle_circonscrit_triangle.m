% En géométrie du triangle, le cercle circonscrit à un triangle non plat est l'unique cercle passant 
% par ses trois sommets.
% Le centre de ce cercle est le point de concours des médiatrices des côtés du triangle.
function [centre_x, centre_y, rayon] = cercle_circonscrit_triangle(xa, ya, xb, yb, xc, yc) 
    delta = 2*det([xa, ya, 1 ; xb, yb, 1; xc, yc, 1]);
    centre_x = det([xa^2 + ya^2, ya, 1 ; xb^2 + yb^2, yb, 1 ; xc^2 + yc^2, yc, 1]) / delta;
    centre_y = -det([xa^2 + ya^2, xa, 1 ; xb^2 + yb^2, xb, 1 ; xc^2 + yc^2, xc, 1]) / delta;
    a = sqrt((xb - xc)^2 + (yb- yc)^2);
    b = sqrt((xc - xa)^2 + (yc - ya)^2);
    c = sqrt((xa - xb)^2 + (ya - yb)^2);
    p = (a+b+c)/2;
    % p = (a + b + c)/2  est le demi-périmètre du triangle 
    rayon = (a*b*c)/(4*sqrt(p*(p-a)*(p-b)*(p-c)));
end