-- ndiambane-dakkar : photo (corrige "Champ image manquant" GSC) + couverture des 2
-- graphies wolof (diambane/ndiambane). Le gabarit du guide ajoute AUTOMATIQUEMENT
-- name_wolof entre parenthèses dans le titre → on met la graphie ALTERNATIVE dans
-- name_wolof (pas dans name, sinon double parenthèse).
-- Fichier photo : public/dishes/ndiambane-dakkar.jpg
-- À exécuter dans Supabase > SQL Editor (chaque UPDATE = "1 row").

UPDATE dishes
   SET image_url = '/dishes/ndiambane-dakkar.jpg',
       name      = 'Ndiambane Dakkar',
       name_wolof = 'Diambane'
 WHERE slug = 'ndiambane-dakkar';

UPDATE dishes
   SET name      = 'Diambane Dakkar',
       name_wolof = 'Ndiambane'
 WHERE slug = 'diambane-dakkar';

-- Titres obtenus : "Ndiambane Dakkar (Diambane) …" / "Diambane Dakkar (Ndiambane) …"
-- Vérif :
-- SELECT slug, name, name_wolof, image_url FROM dishes WHERE slug IN ('ndiambane-dakkar','diambane-dakkar');
