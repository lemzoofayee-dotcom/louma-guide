-- 2026-10-14 : thiebou diaga = NI guedj NI yeet (Lamine) ; netetou = poudre seulement (pincee a la fin)
DELETE FROM dish_products
WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'thiebou-diaga')
  AND product_id IN (SELECT id FROM products WHERE slug IN ('guej-beurre','yeet-maggi','netetu-dom'));
