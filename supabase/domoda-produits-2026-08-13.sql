-- ============================================================
-- 2026-08-13 — Produits lies des 3 fiches DOMODA
-- 1) Retrait des 3 produits de l'ANCIENNE recette fausse (niebe/arachide/netetou)
-- 2) Bissap Blanc lie aux 3 fiches (acidite signature)
-- 3) Poissons sur les 2 variantes : tilapia (principal), sompate + thiof (alternatives)
-- Rebuild Vercel apres (SSG). Lancer AVANT le push.
-- ============================================================

-- 1) Retirer les liens faux du domoda (viande) ---------------
DELETE FROM dish_products
WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'domoda')
  AND product_id IN (SELECT id FROM products WHERE slug IN ('niebe-saloum','tiguadegue-500','netetu-dom'));

-- 2) Bissap Blanc sur les 3 fiches domoda -------------------
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, is_substitute, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='domoda'),          (SELECT id FROM products WHERE slug='bissap-blanc'), 'Touche acidulee', '1 c. a c.', true, false, 1, 'Le bissap blanc apporte l''acidite signature du domoda (a doser).'),
((SELECT id FROM dishes WHERE slug='domoda-poisson'),  (SELECT id FROM products WHERE slug='bissap-blanc'), 'Touche acidulee', '1 c. a c.', true, false, 1, 'Le bissap blanc apporte l''acidite signature du domoda (a doser).'),
((SELECT id FROM dishes WHERE slug='domoda-boulette'), (SELECT id FROM products WHERE slug='bissap-blanc'), 'Touche acidulee', '1 c. a c.', true, false, 1, 'Le bissap blanc apporte l''acidite signature du domoda (a doser).');

-- 3) Poissons sur domoda-poisson ----------------------------
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, is_substitute, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='domoda-poisson'), (SELECT id FROM products WHERE slug='tilapia-rouge'),   'Le poisson du ragout', '500 g', true,  false, 2, 'Poisson a chair ferme, ideal pour le domoda.'),
((SELECT id FROM dishes WHERE slug='domoda-poisson'), (SELECT id FROM products WHERE slug='poisson-sompate'), 'Poisson (alternative)', '500 g', false, true,  3, 'Au choix selon la disponibilite.'),
((SELECT id FROM dishes WHERE slug='domoda-poisson'), (SELECT id FROM products WHERE slug='thiof-decoupe'),   'Poisson (alternative)', '500 g', false, true,  4, 'Version noble si tu veux monter en gamme.');

-- 4) Poissons sur domoda-boulette (chair pour les boulettes) -
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, is_substitute, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='domoda-boulette'), (SELECT id FROM products WHERE slug='tilapia-rouge'),   'Chair pour les boulettes', '500 g', true,  false, 2, 'Chair ferme, parfaite pour des boulettes qui tiennent.'),
((SELECT id FROM dishes WHERE slug='domoda-boulette'), (SELECT id FROM products WHERE slug='poisson-sompate'), 'Poisson (alternative)', '500 g', false, true,  3, 'Au choix selon la disponibilite.'),
((SELECT id FROM dishes WHERE slug='domoda-boulette'), (SELECT id FROM products WHERE slug='thiof-decoupe'),   'Poisson (alternative)', '500 g', false, true,  4, 'Version noble si tu veux monter en gamme.');
