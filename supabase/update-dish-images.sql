-- Mise a jour des images de plats
-- Les images sont servies depuis /dishes/ (public folder Vercel)

UPDATE dishes SET image_url = '/dishes/thieboudienne.jpg' WHERE slug = 'thieboudienne';
UPDATE dishes SET image_url = '/dishes/soupoukandja.jpg' WHERE slug = 'soupoukandja';
UPDATE dishes SET image_url = '/dishes/thiere-mboum.jpg' WHERE slug = 'thiere-mboum';
UPDATE dishes SET image_url = '/dishes/ceebu-yapp.jpg' WHERE slug = 'ceebu-yapp';
UPDATE dishes SET image_url = '/dishes/bassi-sale.jpg' WHERE slug = 'bassi-sale';
