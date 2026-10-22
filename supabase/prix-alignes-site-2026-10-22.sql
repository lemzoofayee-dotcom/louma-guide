-- 2026-10-22 : prix du guide alignés sur la boutique (produits.js), écarts trouvés par comparaison des 53 fiches
-- guedj beurre 10 € / 200 g depuis le 17/10 (le guide affichait 8 €)
UPDATE products SET price = 10.00, price_unit = 'par 200g', price_old = 12.00 WHERE slug = 'guej-beurre';
-- cartons 5 kg (prix du site depuis le 10/09)
UPDATE products SET price = 55.00 WHERE slug = 'diargne-colafil';
UPDATE products SET price = 55.00 WHERE slug = 'beurre-capitaine';
UPDATE products SET price = 50.00 WHERE slug = 'poisson-eau-douce';
-- contrôle : doit afficher 10 / 55 / 55 / 50
SELECT slug, price, price_unit FROM products WHERE slug IN ('guej-beurre','diargne-colafil','beurre-capitaine','poisson-eau-douce');
