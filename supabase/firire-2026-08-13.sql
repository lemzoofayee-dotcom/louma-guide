-- ============================================================
-- 2026-08-13 — FIRIRE : correction accompagnement + produits lies
-- Precisions Lamine : poisson frit a l'huile, accompagne d'une sauce
-- d'oignon, de crudites/salade, de legumes, de tomate et de frites.
-- Rebuild Vercel apres (SSG). Lancer AVANT le push.
-- ============================================================

-- 1) Correction recette (accompagnement) --------------------
UPDATE dishes SET
  subtitle = 'Poisson frit a l''huile, sauce oignon, crudites et frites',
  description = 'Le firire, c''est du poisson frit a la senegalaise : assaisonne au roff (marinade persil-ail-piment) puis frit a l''huile jusqu''a etre bien croustillant. On l''accompagne d''une sauce d''oignon, de crudites et salade, de legumes, de tomate et de frites.',
  other_ingredients = ARRAY['1 kg de poisson (yaboye, diargne ou autre)','Persil','4 gousses d''ail','Piment','1 cube bouillon','Huile de friture','Sauce d''oignon','Crudites et salade','Legumes','Tomate','Frites','Sel, poivre'],
  steps = '[{"step":1,"title":"Preparer le roff","text":"Mixer persil, ail, oignon et piment. Assaisonner le poisson avec cette marinade. Laisser reposer 30 min."},{"step":2,"title":"Frire","text":"Chauffer l''huile. Frire le poisson 5-7 min de chaque cote selon l''epaisseur. Il doit etre dore et croustillant."},{"step":3,"title":"Servir","text":"Servir avec une sauce d''oignon, des crudites et de la salade, des legumes, de la tomate, des frites et du kani."}]'
WHERE slug = 'firire';

-- 2) Produits lies : poisson en avant, kani en accompagnement
UPDATE dish_products
SET display_order = 4
WHERE dish_id = (SELECT id FROM dishes WHERE slug='firire')
  AND product_id = (SELECT id FROM products WHERE slug='puree-piment');

INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, is_substitute, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='firire'), (SELECT id FROM products WHERE slug='tilapia-rouge'),   'Le poisson a frire', '1 kg', true,  false, 1, 'Poisson entier a chair ferme, parfait frit et croustillant.'),
((SELECT id FROM dishes WHERE slug='firire'), (SELECT id FROM products WHERE slug='poisson-sompate'), 'Poisson (alternative)', '1 kg', false, true, 2, 'Au choix selon la disponibilite.'),
((SELECT id FROM dishes WHERE slug='firire'), (SELECT id FROM products WHERE slug='thiof-decoupe'),   'Poisson (alternative)', '1 kg', false, true, 3, 'Version noble si tu veux monter en gamme.');
