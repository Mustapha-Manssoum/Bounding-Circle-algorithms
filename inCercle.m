% inCercle est une fonction qui vérifie si un point A est à l'intérieur d'un
% cercle de rayon r et de centre C
function check = inCercle(r, Cx, Cy, Ax, Ay)
    % calcul de la distance euclidienne entre le centre C et le point A
    distance = sqrt((Cx - Ax)^2 + (Cy - Ay)^2);
    if distance > r 
        check = 0;
    else
        check = 1;
    end
end