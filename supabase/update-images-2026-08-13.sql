-- ============================================================
-- 2026-08-13 — Images plats manquants + correction DOMODA
-- Convention : francais SANS accents. Apostrophes doublees ''.
-- Fichiers images dans public/dishes/. Rebuild Vercel OBLIGATOIRE
-- apres (SSG sans revalidate). LANCER CE SQL AVANT le push.
-- ============================================================

-- 1) Images des plats deja existants ------------------------
UPDATE dishes SET image_url = '/dishes/bissap-jus.jpg' WHERE slug = 'bissap-jus';
UPDATE dishes SET image_url = '/dishes/bouye-jus.jpg'  WHERE slug = 'bouye-jus';
UPDATE dishes SET image_url = '/dishes/accara.jpg'     WHERE slug = 'accara';
UPDATE dishes SET image_url = '/dishes/dibi.jpg'       WHERE slug = 'dibi';
UPDATE dishes SET image_url = '/dishes/lakh.jpg'       WHERE slug = 'lakh';
UPDATE dishes SET image_url = '/dishes/ndambe.jpg'     WHERE slug = 'ndambe';
UPDATE dishes SET image_url = '/dishes/firire.jpg'     WHERE slug = 'firire';

-- 2) CORRECTION recette DOMODA (viande) ---------------------
-- Ancienne fiche FAUSSE : pate d'arachide + niebe + netetou = c'est le DAKHINE, pas le domoda.
-- Vrai domoda : sauce tomate vinaigree, epaissie a la FARINE delayee, citron, legumes, riz.
UPDATE dishes SET
  emoji = '🍲',
  subtitle = 'Ragout a la tomate acidulee, epaissi a la farine',
  description = 'Le domoda est un ragout senegalais a la sauce tomate legerement vinaigree, epaissie a la farine delayee dans l''eau (et non a la pate d''arachide, qui est reservee au mafe). Sa saveur acidulee au citron et ses legumes fondants en font un plat reconfortant servi avec du riz blanc. Cette version est preparee a la viande.',
  other_ingredients = ARRAY['500 g de viande (boeuf ou agneau)','3 c. a s. de farine (delayee dans l''eau)','150 g de concentre de tomate','1 tomate fraiche','1 oignon','2 gousses d''ail','Vinaigre','Bissap blanc (fleurs sechees ou poudre)','1 citron','Carottes','Pomme de terre ou patate douce','Huile, sel, poivre, piment','Riz blanc'],
  steps = '[{"step":1,"title":"Saisir la viande","text":"Faire saisir la viande avec l''oignon et l''ail jusqu''a coloration."},{"step":2,"title":"Monter la sauce tomate","text":"Ajouter le concentre et la tomate fraiche, mouiller d''eau et laisser reduire. Ajouter un trait de vinaigre et un peu de bissap blanc pour l''acidite."},{"step":3,"title":"Epaissir a la farine","text":"Delayer la farine dans un peu d''eau froide, puis l''incorporer a la sauce en remuant pour une texture lisse."},{"step":4,"title":"Ajouter les legumes","text":"Ajouter carottes et pomme de terre. Couvrir et laisser mijoter jusqu''a ce que la viande et les legumes soient fondants."},{"step":5,"title":"Servir","text":"Rectifier l''assaisonnement, ajouter un filet de jus de citron. Servir avec du riz blanc."}]',
  tips = ARRAY['Le domoda n''a PAS de pate d''arachide (ca, c''est le mafe) : on epaissit a la farine delayee dans l''eau.','Le vinaigre, le bissap blanc et le jus de citron donnent sa signature acidulee.','A ne pas confondre avec le dakhine (riz a l''arachide et aux produits seches).'],
  image_url = '/dishes/domoda.jpg'
WHERE slug = 'domoda';

-- 3) Nouvelles fiches DOMODA POISSON + DOMODA BOULETTE -------
INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES

('domoda-poisson', 'Domoda Poisson', 'Domoda', 'Ragout a la tomate acidulee, au poisson', '🐟', 'Version au poisson du domoda : la meme sauce tomate vinaigree, epaissie a la farine delayee dans l''eau (jamais de pate d''arachide, qui est reservee au mafe), relevee de citron. Le poisson remplace la viande pour un plat plus leger, servi avec du riz blanc.', 30, 45, '6 personnes', 'Facile', 'Plat principal',
  ARRAY['500 g de poisson (darnes)','3 c. a s. de farine (delayee dans l''eau)','150 g de concentre de tomate','1 tomate fraiche','1 oignon','2 gousses d''ail','Vinaigre','Bissap blanc (fleurs sechees ou poudre)','1 citron','Carottes','Pomme de terre ou patate douce','Huile, sel, poivre, piment','Riz blanc'],
  '[{"step":1,"title":"Monter la sauce tomate","text":"Faire revenir l''oignon et l''ail, ajouter le concentre et la tomate fraiche. Mouiller et laisser reduire avec un trait de vinaigre et un peu de bissap blanc."},{"step":2,"title":"Epaissir a la farine","text":"Delayer la farine dans un peu d''eau froide et l''incorporer a la sauce en remuant pour une texture lisse."},{"step":3,"title":"Ajouter les legumes","text":"Ajouter carottes et pomme de terre. Laisser mijoter jusqu''a ce qu''ils soient fondants."},{"step":4,"title":"Cuire le poisson","text":"Deposer les darnes de poisson dans la sauce et laisser cuire doucement 10 min, sans trop remuer."},{"step":5,"title":"Servir","text":"Rectifier l''assaisonnement, ajouter un filet de jus de citron. Servir avec du riz blanc."}]',
  ARRAY['Le domoda n''a PAS de pate d''arachide (ca, c''est le mafe) : on epaissit a la farine delayee dans l''eau.','Ajouter le poisson en fin de cuisson pour qu''il ne se defasse pas.','Le vinaigre, le bissap blanc et le jus de citron donnent sa signature acidulee.'],
  NULL, false),

('domoda-boulette', 'Domoda Boulette', 'Domoda', 'Ragout a la tomate acidulee, aux boulettes de poisson', '🐟', 'Version aux boulettes de poisson du domoda : de petites boulettes pochees dans la sauce tomate vinaigree, epaissie a la farine delayee dans l''eau (jamais de pate d''arachide, qui est reservee au mafe), relevee de citron. Un plat convivial servi avec du riz blanc.', 40, 50, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['Boulettes de poisson (chair de poisson, ail, persil, oeuf, farine)','3 c. a s. de farine (delayee dans l''eau)','150 g de concentre de tomate','1 tomate fraiche','1 oignon','2 gousses d''ail','Vinaigre','Bissap blanc (fleurs sechees ou poudre)','1 citron','Carottes','Pomme de terre ou patate douce','Huile, sel, poivre, piment','Riz blanc'],
  '[{"step":1,"title":"Preparer les boulettes","text":"Hacher la chair de poisson avec ail et persil, lier avec un oeuf et un peu de farine, puis former de petites boulettes."},{"step":2,"title":"Monter la sauce tomate","text":"Faire revenir l''oignon et l''ail, ajouter le concentre et la tomate fraiche. Mouiller et laisser reduire avec un trait de vinaigre et un peu de bissap blanc."},{"step":3,"title":"Epaissir a la farine","text":"Delayer la farine dans un peu d''eau froide et l''incorporer a la sauce en remuant pour une texture lisse."},{"step":4,"title":"Ajouter legumes et boulettes","text":"Ajouter carottes et pomme de terre, puis plonger les boulettes de poisson. Laisser cuire doucement 15 min."},{"step":5,"title":"Servir","text":"Rectifier l''assaisonnement, ajouter un filet de jus de citron. Servir avec du riz blanc."}]',
  ARRAY['Le domoda n''a PAS de pate d''arachide (ca, c''est le mafe) : on epaissit a la farine delayee dans l''eau.','Des boulettes de poisson bien liees a l''oeuf tiennent mieux a la cuisson.','Le vinaigre, le bissap blanc et le jus de citron donnent sa signature acidulee.'],
  NULL, false);

-- 4) Correctif : image_url oublie dans l'INSERT des 2 variantes domoda
UPDATE dishes SET image_url = '/dishes/domoda-poisson.jpg'  WHERE slug = 'domoda-poisson';
UPDATE dishes SET image_url = '/dishes/domoda-boulette.jpg' WHERE slug = 'domoda-boulette';
