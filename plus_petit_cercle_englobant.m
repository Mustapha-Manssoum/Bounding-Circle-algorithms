%% Algorithme naif pour trouver le plus petit cercle englobant en utilisant 3 points
close all;clear ;clc;
%% Un nuage de points aléatoire dans le carré [0,1]²
n = 20;
points = rand(2,n);
%% Affichage du nuage
figure;
plot(points(1,:), points(2,:), 'x');
axis square; axis equal;
title("nuage de points");
axis([0 1 0 1]); hold on;
%%
nb_triplets = nchoosek(n,3);
rayon_cercle = inf;
centre_cercle = zeros(1,2);
for i = 1:n
    for j = 1:n
        if i~=j
            for k = 1:n
                if (k~=i && k~=j)
                    xa = points(1,i);
                    ya = points(2,i);
                    xb = points(1,j);
                    yb = points(2,j);
                    xc = points(1,k);
                    yc = points(2,k);
                    [centre_x, centre_y, rayon] = cercle_circonscrit_triangle(xa, ya, xb, yb, xc, yc);
                    % check if all points are in cercle
                    for q = 1:n
                        if (q~=i && q~=j && q~=k)
                            check = inCercle(rayon, centre_x, centre_y, points(1,q), points(2,q));
                            if (check == 0)
                                break;
                            end
                        end
                    end

                    if (q == n && check == 1)
                        if (rayon <= rayon_cercle)
                            rayon_cercle = rayon;
                            centre_cercle = [centre_x centre_y];
                        end
                    end

                end
            end
        end
    end
end

    pos = [centre_cercle - rayon_cercle 2 * rayon_cercle 2 * rayon_cercle];
    rectangle('Position',pos,'Curvature',[1 1]);
    axis equal;