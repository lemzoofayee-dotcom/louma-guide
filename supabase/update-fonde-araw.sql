-- Enrichissement de la fiche 'fonde' : corriger la base (sankal -> ARAW = farine de mil)
-- et ajouter les 3 facons ancestrales de servir (lait caille & miel, bissap blanc, baobab/bouye).
-- Source : Lamine Faye (@seggfaye). Araw = farine de mil roulee ; sankal = brisure de mil ;
-- thiakry = mil precuit a la vapeur. Les versions bissap blanc et baobab sont ancestrales.
-- A EXECUTER dans le SQL Editor de Supabase (le merge de la PR n'execute PAS le SQL).

-- 1) Upsert de la fiche (UPDATE si elle existe, INSERT sinon)
INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES
('fonde', 'Fonde', 'Fonde', 'Bouillie de mil (araw) au lait caille, bissap blanc ou baobab', '🥣',
 'Le fonde est une bouillie de mil epaisse et reconfortante, servie au petit-dejeuner ou au gouter. On la prepare a base d''araw (farine de mil roulee) — a ne pas confondre avec le sankal (brisure de mil) ni le thiakry (mil precuit a la vapeur). Elle se sert de trois facons ancestrales : au lait caille et au miel, a l''infusion de bissap blanc, ou a la poudre de baobab (bouye).',
 5, 20, '4 personnes', 'Facile', 'Petit-dejeuner',
 ARRAY['Araw (farine de mil)','Eau','Lait caille + miel (version classique)','Bissap blanc sec (version infusion)','Poudre de baobab / bouye (version baobab)'],
 '[{"step":1,"title":"Cuire l''araw","text":"Porter l''eau a ebullition. Verser l''araw (farine de mil) en pluie en remuant sans arret pour eviter les grumeaux."},{"step":2,"title":"Epaissir","text":"Cuire a feu doux 15 min en remuant. La bouillie doit etre epaisse et lisse."},{"step":3,"title":"Version lait caille & miel","text":"Verser la bouillie dans les bols. Napper de lait caille et d''un filet de miel pur (lem). La version classique du quotidien."},{"step":4,"title":"Version bissap blanc","text":"Cuire l''araw non pas dans l''eau mais dans une infusion de bissap blanc, douce et fleurie. Recette ancestrale, legere et parfumee."},{"step":5,"title":"Version baobab (bouye)","text":"Delayer de la poudre de baobab (bouye) dans le fonde : il devient cremeux, legerement acidule et riche en vitamine C."}]',
 ARRAY['Remuer sans arret pour eviter les grumeaux : c''est la cle d''un bon fonde.','Ne pas confondre : araw = farine de mil roulee, sankal = brisure de mil, thiakry = mil precuit a la vapeur.','Le fonde au bissap blanc et a la poudre de baobab (bouye) sont des recettes ancestrales, au meme titre que le lait caille.','Le miel pur (lem) est bien meilleur que le sucre seul.'],
 'https://seggfaye.com/blog/fonde-araw-bouillie-mil-senegalais.html', true)
ON CONFLICT (slug) DO UPDATE SET
  subtitle = EXCLUDED.subtitle,
  description = EXCLUDED.description,
  other_ingredients = EXCLUDED.other_ingredients,
  steps = EXCLUDED.steps,
  tips = EXCLUDED.tips,
  blog_url = EXCLUDED.blog_url,
  is_featured = EXCLUDED.is_featured;

-- 2) Reconstruire les produits lies : base ARAW (au lieu de sankal) + les 3 versions
DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug='fonde');

INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='arraw-dugup'), 'Base de la bouillie', '250 g', true, 1, 'L''araw (farine de mil) donne une bouillie epaisse et fondante. C''est la vraie base du fonde.'),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='lem-miel'), 'Accompagnement (version classique)', '2 cuilleres a soupe', false, 2, 'Le miel pur (lem) transforme le fonde, bien mieux que le sucre seul.'),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='bissap-blanc'), 'Version bissap blanc', 'pour l''infusion', false, 3, 'Cuire l''araw dans une infusion de bissap blanc : recette ancestrale, douce et fleurie.'),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='bouye-baobab'), 'Version baobab (bouye)', '1 a 2 cuilleres', false, 4, 'La poudre de baobab (bouye) rend le fonde cremeux, acidule et riche en vitamine C.');

-- 3) Image de la fiche (frame extraite de la video, deployee dans public/dishes/fonde.jpg)
UPDATE dishes SET image_url = '/dishes/fonde.jpg' WHERE slug = 'fonde';
