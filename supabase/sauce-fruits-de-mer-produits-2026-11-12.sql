-- 12/11/2026 : Lamine garde la fiche sauce fruits de mer → produits de la boutique relies.
DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'sauce-fruits-de-mer');
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', NULL, true, 1, NULL),
((SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer'), (SELECT id FROM products WHERE slug='pagne'), 'Fruits de mer seches', NULL, true, 2, NULL),
((SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer'), (SELECT id FROM products WHERE slug='yoxos'), 'Fruits de mer seches', NULL, true, 3, NULL),
((SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer'), (SELECT id FROM products WHERE slug='netetu-poudre'), 'Netetou', NULL, false, 4, NULL);
SELECT p.slug, dp.is_essential FROM dish_products dp JOIN products p ON p.id = dp.product_id
WHERE dp.dish_id = (SELECT id FROM dishes WHERE slug = 'sauce-fruits-de-mer') ORDER BY dp.display_order;

-- Lamine (12/11) : + citron + piment
UPDATE dishes SET
  other_ingredients = ARRAY['Crevettes sechees','Pagne (coques)','Yokhos (huitres sechees)','2 oignons','Tomates / concentre de tomate','Huile vegetale','Citron','Piment','Sel, poivre']
WHERE slug = 'sauce-fruits-de-mer';
UPDATE dishes SET steps = jsonb_set(steps, '{3,text}', '"Ajoute le citron et le piment, puis nappe sur du riz blanc ou des pates."')
WHERE slug = 'sauce-fruits-de-mer' AND steps->3->>'title' = 'Servir';
DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer') AND product_id = (SELECT id FROM products WHERE slug='puree-piment');
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='sauce-fruits-de-mer'), (SELECT id FROM products WHERE slug='puree-piment'), 'Piment', NULL, false, 5, NULL);
