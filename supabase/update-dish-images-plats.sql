-- Mise a jour des images des plats (Partie 1 : plats existants)
-- Images servies depuis /dishes/ (public folder Vercel)
-- A executer dans le SQL Editor de Supabase (le merge PR n'execute pas la base)

UPDATE dishes SET image_url = '/dishes/mafe.jpg'             WHERE slug = 'mafe';
UPDATE dishes SET image_url = '/dishes/yassa-poulet.jpg'     WHERE slug = 'yassa-poulet';
UPDATE dishes SET image_url = '/dishes/caldou.jpg'           WHERE slug = 'caldou';
UPDATE dishes SET image_url = '/dishes/thiakry.jpg'          WHERE slug = 'thiakry';
UPDATE dishes SET image_url = '/dishes/pastels.jpg'          WHERE slug = 'pastels';
UPDATE dishes SET image_url = '/dishes/thiou.jpg'            WHERE slug = 'thiou';
UPDATE dishes SET image_url = '/dishes/mbakhalou-saloum.jpg' WHERE slug = 'mbakhalou-saloum';
UPDATE dishes SET image_url = '/dishes/diambane-dakkar.jpg'  WHERE slug = 'diambane-dakkar';
UPDATE dishes SET image_url = '/dishes/chere.jpg'            WHERE slug = 'chere';

-- Verification
SELECT slug, image_url FROM dishes WHERE slug IN
  ('mafe','yassa-poulet','caldou','thiakry','pastels','thiou','mbakhalou-saloum','diambane-dakkar','chere')
  ORDER BY slug;
