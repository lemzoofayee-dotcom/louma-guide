-- ============================================================
-- 2026-10-14 — Guide : dakhine corrige + beugeuth (beugeuc) + produits lies
-- Sources : Lamine 16/09 (dakhine = riz + pate d'arachide, parfume au yeet ou au netetou)
--           Lamine 14/10 (on peut y ajouter yeet, toufa, yokhos, pagne ; beugeuth ET beugeuc)
-- A executer dans Supabase > SQL Editor, PUIS commit vide + push (rebuild Vercel, SSG).
-- Convention : francais sans accents (comme les fiches existantes).
-- ============================================================

-- 1) DAKHINE : l'ancienne fiche disait "riz mouille aux fruits de mer seches" (FAUX) --
UPDATE dishes SET
  subtitle = 'Riz cuit dans la pate d''arachide',
  description = 'Le dakhine (ou deukine) est un riz cuit dans une sauce a la pate d''arachide (tigadegue), parfume au netetou ou au yeet. On peut aussi y ajouter des fruits de mer seches du Saloum : yeet, toufa, yokhos, pagne. On dit aussi dakhine mbeup.',
  other_ingredients = ARRAY['1 kg de riz','Pate d''arachide (tigadegue)','Viande : mouton, chevre, tripes ou boeuf (ou fruits de mer seches : yeet, toufa, yokhos, pagne)','Netetou ou yeet','2 oignons','Huile vegetale','Sel, poivre, piment'],
  steps = '[{"step":1,"title":"Preparer","text":"Si vous mettez des fruits de mer seches (toufa, yokhos, pagne), les tremper 15 min a l''eau tiede puis egoutter."},{"step":2,"title":"La base","text":"Faire revenir les oignons et la viande (mouton, chevre, tripes ou boeuf), ajouter le netetou ou le yeet."},{"step":3,"title":"La pate d''arachide","text":"Delayer la pate d''arachide dans un peu d''eau chaude, l''ajouter avec de l''eau et laisser mijoter."},{"step":4,"title":"Cuire le riz dans la sauce","text":"Verser le riz lave dans la sauce et le laisser cuire dedans jusqu''a ce qu''il soit tendre."},{"step":5,"title":"Servir","text":"Servir chaud, piment a cote."}]',
  tips = ARRAY['Le dakhine, c''est le riz cuit DANS la pate d''arachide (tigadegue) : c''est ce qui le distingue du mafe, ou la sauce est servie sur le riz.','Parfume au netetou ou au yeet, au choix.','Version de la mer : ajoutez yeet, toufa, yokhos ou pagne.']
WHERE slug = 'dakhine';

-- 2) BEUGEUTH : les 2 graphies (le gabarit affiche "Beugeuth (Beugeuc)") ---------
UPDATE dishes SET name_wolof = 'Beugeuc' WHERE slug = 'beugeuth';

-- 2b) THIEBOU DIAGA : retirer guedj/yeet (FAUX, Lamine 14/10), sauce exacte ---------
UPDATE dishes SET
  name_wolof = 'Diagga',
  description = 'Le thiebou diaga (thiebou djeun diagga) est un thieboudienne rouge servi avec une sauce rouge et des boulettes de poisson (dieye ou yaboye). La sauce : oignons sautes a l''huile, ail, poivre, piment, concentre de tomate, et une pincee de netetou en poudre a la fin. Ni guedj ni yeet.',
  other_ingredients = ARRAY['1 kg de riz brise','Dieye ou yaboye (pour les boulettes)','Concentre de tomate','3 gros oignons','Ail, poivre, piment','Netetou en poudre (une pincee)','Legumes du thieboudienne','Huile vegetale','Sel'],
  steps = '[{"step":1,"title":"Les boulettes","text":"Former de petites boulettes avec la chair du dieye ou du yaboye."},{"step":2,"title":"La sauce","text":"Faire sauter les oignons a l''huile, ajouter les epices : ail, poivre, piment. Puis le concentre de tomate."},{"step":3,"title":"Cuire les boulettes","text":"Plonger les boulettes dans la sauce rouge et laisser cuire doucement."},{"step":4,"title":"La touche finale","text":"Une pincee de netetou en poudre a la fin. Pas de guedj ni de yeet."},{"step":5,"title":"Le riz","text":"Le riz se fait exactement comme le thieboudienne rouge."},{"step":6,"title":"Servir","text":"Le riz rouge, nappe de la sauce rouge et de ses boulettes."}]',
  tips = ARRAY['Ni guedj ni yeet dans le diagga : juste une pincee de netetou en poudre a la fin.','Boulettes de dieye ou de yaboye.','Le riz, c''est celui du thieboudienne rouge.']
WHERE slug = 'thiebou-diaga';

-- 3) PRODUITS LIES (aucun jusqu'ici : pas de CTA boutique sur ces fiches) --------
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, is_substitute, display_order, expert_note) VALUES
-- dakhine
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='tiguadegue-500'), 'Pate d''arachide (la base)', '250 g', true,  false, 1, 'Le riz cuit dans la pate d''arachide : c''est le dakhine.'),
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='netetu-dom'),     'Parfum',                    '1 c. a soupe', true,  false, 2, 'Netetou ou yeet, au choix.'),
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='yeet-maggi'),     'Parfum (alternative)',      '1 petit morceau', false, true,  3, NULL),
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='tuffa'),          'Fruits de mer seches (option)', 'Une poignee', false, false, 4, NULL),
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='yoxos'),          'Fruits de mer seches (option)', 'Une poignee', false, false, 5, NULL),
((SELECT id FROM dishes WHERE slug='dakhine'), (SELECT id FROM products WHERE slug='pagne'),          'Fruits de mer seches (option)', 'Une poignee', false, false, 6, NULL),
-- beugeuth
((SELECT id FROM dishes WHERE slug='beugeuth'), (SELECT id FROM products WHERE slug='beugeuc-feuille-bissap'), 'Feuilles de bissap (la base)', '300 g', true,  false, 1, 'Feuilles de bissap sechees : le beugeuc (beugeuth).'),
((SELECT id FROM dishes WHERE slug='beugeuth'), (SELECT id FROM products WHERE slug='sauce-netetu-beugeuc'),   'Sauce prete (raccourci)',     '1 pot',  false, true,  2, 'Netetou + beugeuc deja prepares.'),
((SELECT id FROM dishes WHERE slug='beugeuth'), (SELECT id FROM products WHERE slug='guej-beurre'),            'Guedj',                        '1 morceau', false, false, 3, NULL),
((SELECT id FROM dishes WHERE slug='beugeuth'), (SELECT id FROM products WHERE slug='yeet-maggi'),             'Yeet',                         '1 petit morceau', false, false, 4, NULL),
((SELECT id FROM dishes WHERE slug='beugeuth'), (SELECT id FROM products WHERE slug='diwtir-pure'),            'Huile de palme (filet final)', 'Un filet', false, false, 5, NULL),
-- niankatang diola (diwtir confirme par Lamine)
((SELECT id FROM dishes WHERE slug='niankatang-diola'), (SELECT id FROM products WHERE slug='pagne'),             'Fruits de mer seches', 'Une poignee', true,  false, 1, NULL),
((SELECT id FROM dishes WHERE slug='niankatang-diola'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', 'Une poignee', true,  false, 2, NULL),
((SELECT id FROM dishes WHERE slug='niankatang-diola'), (SELECT id FROM products WHERE slug='guej-beurre'),       'Guedj',                '1 morceau',   false, false, 3, NULL),
((SELECT id FROM dishes WHERE slug='niankatang-diola'), (SELECT id FROM products WHERE slug='diwtir-pure'),       'Huile de palme rouge (filet)', 'Un filet', true, false, 4, NULL),
-- spaghetti aux fruits de mer
((SELECT id FROM dishes WHERE slug='spaghetti-fruits-de-mer'), (SELECT id FROM products WHERE slug='pagne'),             'Fruits de mer seches', 'Une poignee', true, false, 1, NULL),
((SELECT id FROM dishes WHERE slug='spaghetti-fruits-de-mer'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', 'Une poignee', true, false, 2, NULL),
-- thiebou diaga (Lamine 14/10 : PAS de guedj ni de yeet ; boulettes de dieye ou yaboye ; pincee de netetou poudre a la fin)
((SELECT id FROM dishes WHERE slug='thiebou-diaga'), (SELECT id FROM products WHERE slug='chanchar-dieye'), 'Poisson des boulettes', '1 kg', true, false, 1, 'Boulettes de dieye ou de yaboye.'),
((SELECT id FROM dishes WHERE slug='thiebou-diaga'), (SELECT id FROM products WHERE slug='yaye-boye'),      'Poisson des boulettes (alternative)', '1 kg', false, true, 2, NULL),
((SELECT id FROM dishes WHERE slug='thiebou-diaga'), (SELECT id FROM products WHERE slug='netetu-poudre'),  'Touche finale', 'Une pincee', true, false, 3, 'Une pincee de netetou en poudre a la fin. Ni guedj ni yeet dans le diagga.')
ON CONFLICT (dish_id, product_id) DO NOTHING;

-- Verif :
-- SELECT d.slug, count(*) FROM dish_products dp JOIN dishes d ON d.id = dp.dish_id
-- WHERE d.slug IN ('dakhine','beugeuth','niankatang-diola','spaghetti-fruits-de-mer','thiebou-diaga') GROUP BY d.slug;
