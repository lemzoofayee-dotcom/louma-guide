-- fataya : ajoute la photo manquante (corrige "Champ image manquant" GSC).
-- Fichier : public/dishes/fataya.jpg
-- À exécuter dans Supabase > SQL Editor (doit dire "1 row").
UPDATE dishes SET image_url = '/dishes/fataya.jpg' WHERE slug = 'fataya';

-- Graphie wolof alternative (à confirmer par Lamine, ex. 'Fatiya') pour ratisser large :
-- UPDATE dishes SET name_wolof = 'Fatiya' WHERE slug = 'fataya';

-- Vérif :
-- SELECT slug, name, name_wolof, image_url FROM dishes WHERE slug = 'fataya';
