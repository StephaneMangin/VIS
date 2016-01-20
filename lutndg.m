% on peut d'abord construire un vecteur de 256 valeurs pour chaque
% composante R, V, et B, les valeurs doivent être comprises entre 0 et 1
r=0:1/255:1;
v=0:1/255:1;
b=0:1/255:1;   % les vecteurs r, v et b sont identiques pour afficher en niveaux de gris
% on fabrique la LUT à l'aide des 3 vecteurs transposés en vecteur colonne
map=[r' v' b'];

%negative: map=[(1-r') (1-v') (1-b')];

%map=[r' zeros(size(r',1),1) zeros(size(r',1),1)];

%t=ones(size(r',1),1);
%map=[r' t t];

% pour appliquer la LUT
colormap(map)
