-- ndiambane-dakkar : ajoute la photo manquante (corrige "Champ image manquant" en GSC)
-- + graphie alternative ENTRE PARENTHÈSES dans le nom (couvre les 2 orthographes wolof
--   diambane/ndiambane pour le SEO, sans page dupliquée).
-- Fichier photo : public/dishes/ndiambane-dakkar.jpg
-- À exécuter dans Supabase > SQL Editor. Chaque UPDATE doit dire "1 row".

UPDATE dishes
   SET image_url = '/dishes/ndiambane-dakkar.jpg',
       name      = 'Ndiambane (Diambane) Dakkar'
 WHERE slug = 'ndiambane-dakkar';

-- L'autre graphie porte aussi la variante entre parenthèses (réciproque) :
UPDATE dishes
   SET name = 'Diambane (Ndiambane) Dakkar'
 WHERE slug = 'diambane-dakkar';

-- Vérif :
-- SELECT slug, name, image_url FROM dishes WHERE slug IN ('ndiambane-dakkar','diambane-dakkar');
