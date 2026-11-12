-- 12/11/2026 : corrections dictées par Lamine.
-- Sauce netetou : PAS de guedj. Oignon frit à l'huile + concentré de tomate + netetou. Tous les netetou de la boutique.
-- Thiere toumboulane : recette de Lamine du 21/10 (= article blog/thiere-couscous-mil-senegalais.html) + produits.
-- Temps et nombre de personnes non donnés par Lamine → NULL (non affiché).
-- Idempotent. À coller dans Supabase → SQL Editor → Run.

-- ===== SAUCE NETETOU =====
UPDATE dishes SET
  description = 'La sauce netetou est une sauce brune profonde ou le netetou (graines de nere fermentees) domine : des oignons frits a l''huile, du concentre de tomate et du netetou. Puissamment umami, elle accompagne le riz.',
  prep_time_minutes = NULL,
  cook_time_minutes = NULL,
  servings = NULL,
  other_ingredients = ARRAY['Netetou','Oignons','Huile vegetale','Concentre de tomate','Riz blanc (pour servir)'],
  steps = '[
    {"step": 1, "title": "Les oignons", "text": "Fais frire les oignons dans l''huile."},
    {"step": 2, "title": "La tomate", "text": "Ajoute le concentre de tomate."},
    {"step": 3, "title": "Le netetou", "text": "Ajoute le netetou et laisse-le parfumer la sauce."},
    {"step": 4, "title": "Servir", "text": "Sers sur du riz blanc."}
  ]'::jsonb,
  tips = ARRAY['Pas de guedj dans la sauce netetou : c''est le netetou qui fait tout le gout.','Le netetou remplace le bouillon cube : 100 pour cent naturel.','A doser : son gout fermente est puissant.']
WHERE slug = 'sauce-netetou';

DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'sauce-netetou');
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='sauce-netetou'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Netetou en grains', NULL, true, 1, NULL),
((SELECT id FROM dishes WHERE slug='sauce-netetou'), (SELECT id FROM products WHERE slug='netetu-barre'), 'Netetou en barre', NULL, false, 2, NULL),
((SELECT id FROM dishes WHERE slug='sauce-netetou'), (SELECT id FROM products WHERE slug='netetu-poudre'), 'Netetou en poudre', NULL, false, 3, NULL),
((SELECT id FROM dishes WHERE slug='sauce-netetou'), (SELECT id FROM products WHERE slug='netetu-mix'), 'Netetou Mix (creation Louma)', NULL, false, 4, 'Netetou torrefie, crevettes et kethiakh en poudre.'),
((SELECT id FROM dishes WHERE slug='sauce-netetou'), (SELECT id FROM products WHERE slug='sauce-netetu-beugeuc'), 'Version prete', NULL, false, 5, NULL);

-- ===== THIERE TOUMBOULANE =====
UPDATE dishes SET
  description = 'Le thiere toumboulane, c''est la version brute du toumboulane : une sauce toute simple a l''oignon et a la tomate fraiche, le guedj toumboulane qui mijote dedans, et le couscous de mil. Simple et bon.',
  prep_time_minutes = NULL,
  cook_time_minutes = NULL,
  servings = NULL,
  other_ingredients = ARRAY['Couscous de mil (thiere)','Guedj toumboulane','Oignons','Tomates fraiches'],
  steps = '[
    {"step": 1, "title": "La sauce", "text": "Fais une sauce toute simple : oignon et tomate fraiche."},
    {"step": 2, "title": "Le toumboulane", "text": "Ajoute le guedj toumboulane et laisse mijoter."},
    {"step": 3, "title": "Version sauce epaisse", "text": "Prepare le thiere a l''eau, puis verse la sauce dessus."},
    {"step": 4, "title": "Ou version thiere simm", "text": "Recupere tout le jus de la sauce et melange-le au thiere : il se rehydrate une dizaine de minutes."},
    {"step": 5, "title": "Le dressage", "text": "Dans les deux cas, pose le toumboulane au dressage."}
  ]'::jsonb,
  tips = ARRAY['Deux facons de le servir : en sauce epaisse sur le thiere, ou en thiere simm (le jus melange au couscous).','Le guedj toumboulane est tres rare : un accelerateur de gout precieux.'],
  blog_url = 'https://seggfaye.com/blog/thiere-couscous-mil-senegalais.html'
WHERE slug = 'thiere-toumboulan';

DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'thiere-toumboulan');
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='thiere-toumboulan'), (SELECT id FROM products WHERE slug='guej-toumboulan'), 'Le guedj du plat', NULL, true, 1, 'Pose au dressage.'),
((SELECT id FROM dishes WHERE slug='thiere-toumboulan'), (SELECT id FROM products WHERE slug='thiere-champion'), 'Couscous de mil', NULL, true, 2, NULL);

-- Controle
SELECT d.slug, p.slug AS produit, dp.is_essential FROM dish_products dp
JOIN dishes d ON d.id = dp.dish_id JOIN products p ON p.id = dp.product_id
WHERE d.slug IN ('sauce-netetou','thiere-toumboulan') ORDER BY d.slug, dp.display_order;
