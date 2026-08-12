-- fataya : ajoute la photo manquante (corrige "Champ image manquant" GSC).
-- Fichier : public/dishes/fataya.jpg
-- À exécuter dans Supabase > SQL Editor (doit dire "1 row").
UPDATE dishes SET image_url = '/dishes/fataya.jpg' WHERE slug = 'fataya';

-- ⚠️ PAS de graphie alternative pour fataya : "Fatiya" = Al-Fâtiha (verset du Coran),
--    aucun rapport avec le beignet. Ne jamais mettre ça en name_wolof.

-- Vérif :
-- SELECT slug, name, image_url FROM dishes WHERE slug = 'fataya';
