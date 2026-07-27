-- ============================================================
-- BROUILLON — 11 nouvelles fiches plats (Partie 2)
-- A VALIDER par Lamine avant execution. Ne PAS lancer tel quel.
-- Convention : francais SANS accents (comme les fiches existantes).
-- Les images seront cablees separement (UPDATE image_url) apres validation.
-- Points a valider marques [?] dans les commentaires.
-- ============================================================

INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES

-- 1. NGALAKH (fiable — source encyclopedie Guedjologue)
('ngalakh', 'Ngalakh', 'Ngalakh', 'Dessert du partage au baobab et arachide', '🍮', 'Le ngalakh est un dessert senegalais onctueux a base de poudre de baobab (bouye) et de pate d''arachide, parfume a la muscade. Symbole de teranga : prepare le vendredi saint par les familles chretiennes et offert aux voisins musulmans, c''est l''un des plus beaux symboles de la coexistence au Senegal.', 20, 20, '8 personnes', 'Moyen', 'Dessert',
  ARRAY['250 g de poudre de baobab (bouye)','500 g de pate d''arachide','150 g de couscous de mil','300 g de sucre (au gout)','Muscade rapee','Raisins secs','Beurre clarifie','1,5 L d''eau'],
  '[{"step":1,"title":"Melanger baobab et arachide","text":"Malaxer la poudre de baobab avec la pate d''arachide jusqu''a obtenir une poudre homogene."},{"step":2,"title":"Delayer","text":"Ajouter progressivement 1,5 L d''eau tiede (environ 50 degres) en melangeant. Filtrer au tamis chinois pour retirer les grumeaux."},{"step":3,"title":"Sucrer et parfumer","text":"Ajouter le sucre au gout et la muscade rapee. Melanger."},{"step":4,"title":"Preparer le couscous","text":"Rehydrater le couscous de mil avec une pincee de raisins secs et un peu de beurre clarifie (micro-ondes ou vapeur)."},{"step":5,"title":"Assembler","text":"Incorporer le couscous a la creme de baobab-arachide. Servir frais dans des bols."}]',
  ARRAY['Le ngalakh se prepare traditionnellement une fois par an, le vendredi saint, et se partage entre voisins de toutes les religions.','La texture doit rester cremeuse : ajuster l''eau selon le gout.','La muscade est la signature aromatique du ngalakh.'],
  NULL, true),

-- 2. NIANKATANG DIOLA  [? recette a valider — brief Lamine : riz + fruits de mer seches, version diola/Casamance, filet d'huile de palme rouge ; sans diola = riz blanc simple]
('niankatang-diola', 'Niankatang Diola', 'Niankatang', 'Riz aux fruits de mer seches, filet d''huile de palme', '🦐', 'Le niankatang diola est un plat casamancais de riz blanc melange a des fruits de mer seches (pagne, crevettes, guedj), releve d''un filet d''huile de palme rouge. La version diola est riche en produits de la mangrove ; sans diola, c''est un riz blanc plus simple.', 20, 40, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz blanc','Fruits de mer seches (pagne, crevettes, guedj)','Huile de palme rouge','2 oignons','Sel, poivre, piment'],
  '[{"step":1,"title":"Rehydrater les fruits de mer","text":"Tremper le pagne, les crevettes et le guedj a l''eau tiede 15 min. Egoutter."},{"step":2,"title":"Cuire le riz","text":"Cuire le riz blanc a la vapeur ou a l''eau, grain par grain."},{"step":3,"title":"Faire revenir","text":"Faire revenir les oignons, ajouter les fruits de mer rehydrates. Assaisonner."},{"step":4,"title":"Assembler","text":"Melanger les fruits de mer au riz. Terminer par un filet d''huile de palme rouge avant de servir."}]',
  ARRAY['Plat de Casamance riche en produits seches de la mangrove.','L''huile de palme rouge apporte la couleur et le parfum caracteristiques.'],
  NULL, false),

-- 3. DAKHINE (fiable — encyclopedie : riz MOUILLE, pas couscous de mil ; sauce netetou/yokhos/crevettes/nokkos). = deukhine (variante de graphie)
('dakhine', 'Dakhine', 'Deukhine', 'Riz mouille a la sauce de fruits de mer seches', '🍚', 'Le dakhine (ou deukhine) est un plat de riz mouille nappe d''une sauce riche aux produits seches du Saloum : netetou, yokhos, crevettes sechees et nokkos. Un plat de terroir profond et umami.', 20, 45, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz','Yokhos (huitres sechees)','Crevettes sechees','Nokkos (pate epicee)','2 oignons','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Rehydrater","text":"Tremper le yokhos et les crevettes sechees a l''eau tiede 15 min. Egoutter."},{"step":2,"title":"Faire la sauce","text":"Faire revenir les oignons, ajouter le netetou et le nokkos. Incorporer les fruits de mer seches."},{"step":3,"title":"Mijoter","text":"Couvrir d''eau et laisser mijoter 20 min pour concentrer les saveurs."},{"step":4,"title":"Cuire le riz","text":"Cuire le riz jusqu''a ce qu''il soit mouille et tendre."},{"step":5,"title":"Servir","text":"Napper le riz mouille de la sauce aux fruits de mer seches."}]',
  ARRAY['Le dakhine se fait avec du riz MOUILLE, pas du couscous de mil.','Le netetou et le yokhos donnent la profondeur umami du plat.','On peut lier en CTA avec le guerte noflay (noflay).'],
  NULL, false),

-- 4. BEUGEUTH (graphie exacte validee Lamine : beugeuth) — sauce de feuilles de bissap
('beugeuth', 'Beugeuth', 'Beugeuth', 'Sauce epaisse de feuilles de bissap', '🌿', 'Le beugeuth est une sauce verte epaisse a base de feuilles de bissap (oseille de Guinee) pilees, relevee de produits seches et d''huile de palme. Servie avec du riz, c''est un plat de feuilles typique du terroir senegalais.', 25, 50, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['Feuilles de bissap (fraiches ou sechees)','Huile de palme rouge','Guedj, yeet','2 oignons','Riz blanc','Sel, poivre, piment'],
  '[{"step":1,"title":"Preparer les feuilles","text":"Laver et piler (ou hacher) les feuilles de bissap."},{"step":2,"title":"Faire la base","text":"Faire revenir les oignons, ajouter le netetou, le guedj et le yeet."},{"step":3,"title":"Cuire les feuilles","text":"Ajouter les feuilles de bissap et un peu d''eau. Cuire a feu doux jusqu''a une sauce epaisse."},{"step":4,"title":"Servir","text":"Terminer par un filet d''huile de palme. Servir avec du riz blanc."}]',
  ARRAY['La boutique vend la version sechee des feuilles : beugeuc-feuille-bissap.','Le pilage des feuilles donne une sauce bien epaisse.'],
  NULL, false),

-- 5. THIEBOU DIAGA (validee Lamine : version premium du thieboudienne, sauce tomate rouge epaisse + boulettes de poisson)
('thiebou-diaga', 'Thiebou Diaga', 'Diaga', 'Thieboudienne premium aux boulettes de poisson', '⭐', 'Le thiebou diaga est la version premium du thieboudienne : un riz au poisson nappe d''une sauce tomate rouge et epaisse aux oignons, sublime par de petites boulettes de poisson. La sauce, riche et onctueuse, est la vraie star du plat — la cerise sur le gateau.', 40, 75, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz brise','Poisson (darnes + chair pour les boulettes)','Guedj, yeet','Oeuf et un peu de farine (pour les boulettes)','3 cuilleres de concentre de tomate','3 tomates fraiches','3 gros oignons','Ail, persil','Legumes (carotte, chou, aubergine)','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Preparer les boulettes","text":"Hacher la chair de poisson avec ail, persil et oignon. Lier avec un oeuf et un peu de farine, puis former de petites boulettes."},{"step":2,"title":"Monter la sauce","text":"Faire revenir les oignons, roussir le concentre de tomate. Ajouter le guedj, le yeet et le netetou."},{"step":3,"title":"Sauce rouge epaisse","text":"Ajouter les tomates fraiches et un peu d''eau. Laisser reduire longuement jusqu''a une sauce tomate rouge et bien epaisse."},{"step":4,"title":"Pocher les boulettes","text":"Plonger les boulettes de poisson dans la sauce et cuire doucement 15 min."},{"step":5,"title":"Cuire le riz","text":"Cuire le poisson et les legumes, les retirer, puis cuire le riz brise dans le bouillon."},{"step":6,"title":"Dresser","text":"Riz en dome, poisson, legumes et boulettes, le tout nappe de la sauce tomate epaisse."}]',
  ARRAY['La sauce tomate rouge et epaisse est la signature du thiebou diaga : c''est elle le plus du plat.','Les petites boulettes de poisson en font une version premium, festive.','Une sauce bien epaisse et concentree = la reussite du plat.'],
  NULL, true),

-- 6. YASSA POISSON (fiable — standard, pendant du yassa-poulet existant)
('yassa-poisson', 'Yassa Poisson', 'Yassa jen', 'Poisson grille, sauce oignon-citron', '🐟', 'Le yassa poisson est un grand classique senegalais : du poisson marine puis grille, servi avec une sauce fondante d''oignons confits au citron et a la moutarde. Acidule et parfume, il se mange avec du riz blanc.', 30, 40, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['4 darnes de poisson (thiof, dorade...)','5 gros oignons','3 citrons','Moutarde de Dijon','Ail','Huile vegetale','Riz blanc','Sel, poivre, piment'],
  '[{"step":1,"title":"Mariner","text":"Mariner le poisson avec citron, ail, moutarde, sel et poivre pendant 1 h."},{"step":2,"title":"Griller","text":"Griller le poisson (ou le saisir a la poele) jusqu''a coloration. Reserver."},{"step":3,"title":"Confire les oignons","text":"Faire fondre les oignons emincs longuement dans l''huile avec le reste de marinade. Ajouter le netetou pour la profondeur."},{"step":4,"title":"Reunir","text":"Deposer le poisson dans la sauce oignon, laisser mijoter 10 min."},{"step":5,"title":"Servir","text":"Servir sur du riz blanc, nappe de sauce oignon."}]',
  ARRAY['Le secret du yassa : des oignons longuement confits, jamais brules.','Le netetou remplace avantageusement le bouillon cube.','On peut faire le yassa au poulet (fiche yassa-poulet) sur le meme principe.'],
  NULL, true),

-- 7. SAUCE THIEBOUDIENNE (fiche sauce)
('sauce-thieboudienne', 'Sauce Thieboudienne', NULL, 'La sauce tomate du thieb', '🥫', 'La sauce du thieboudienne est une sauce tomate profonde, montee avec du concentre de tomate roti, des oignons, et des produits seches (guedj, yeet, netetou). C''est elle qui donne au riz au poisson toute sa couleur et sa puissance.', 15, 45, 'Pour 6 personnes', 'Moyen', 'Sauce',
  ARRAY['3 cuilleres de concentre de tomate','3 tomates fraiches','2 gros oignons','Guedj, yeet','Ail, persil','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Roussir le concentre","text":"Faire revenir les oignons, ajouter le concentre de tomate et le faire rotir doucement."},{"step":2,"title":"Ajouter les seches","text":"Incorporer le guedj, le yeet et le netetou pour l''umami."},{"step":3,"title":"Mouiller","text":"Ajouter les tomates fraiches et l''eau. Cuire 30 min pour concentrer."},{"step":4,"title":"Ajuster","text":"Rectifier l''assaisonnement. La sauce doit etre epaisse et rouge fonce."}]',
  ARRAY['Une sauce epaisse = signe d''un bon thieb (le toumboulane epaissit naturellement).','Le contraste frais x seche fait tout l''umami senegalais.'],
  NULL, false),

-- 8. SAUCE FRUITS DE MER (fiche sauce)
('sauce-fruits-de-mer', 'Sauce Fruits de Mer', NULL, 'Sauce aux fruits de mer seches du Saloum', '🦐', 'Une sauce riche aux fruits de mer seches (crevettes, pagne, yokhos), mijotee avec oignons et tomate. Le concentre marin des Iles du Saloum dans une sauce a servir sur riz ou pates.', 15, 40, 'Pour 6 personnes', 'Moyen', 'Sauce',
  ARRAY['Crevettes sechees','Pagne (coques)','Yokhos (huitres sechees)','2 oignons','Tomates / concentre de tomate','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Rehydrater","text":"Tremper les fruits de mer seches a l''eau tiede 15 min."},{"step":2,"title":"Base","text":"Faire revenir les oignons, ajouter le concentre de tomate et le netetou."},{"step":3,"title":"Mijoter","text":"Ajouter les fruits de mer et l''eau. Cuire 25 min a feu doux."},{"step":4,"title":"Servir","text":"Napper sur du riz blanc ou des pates."}]',
  ARRAY['Le pagne (coques) est parfait frais en sauce, ou seche dans le riz.','Ne pas trop cuire les fruits de mer seches pour garder leur mache.'],
  NULL, false),

-- 9. SAUCE NETETOU (fiche sauce)
('sauce-netetou', 'Sauce Netetou', NULL, 'Sauce brune umami au netetou', '🟤', 'La sauce netetou est une sauce brune profonde ou le netetou (graines de nere fermentees) domine. Puissamment umami, elle accompagne le riz et rappelle a elle seule le gout du Senegal.', 15, 35, 'Pour 6 personnes', 'Facile', 'Sauce',
  ARRAY['Netetou (graines fermentees + poudre)','2 gros oignons','Huile vegetale','Guedj','Riz blanc','Sel, poivre, piment'],
  '[{"step":1,"title":"Faire suer","text":"Faire revenir les oignons dans l''huile jusqu''a tendrete."},{"step":2,"title":"Netetou","text":"Ajouter le netetou (graines et poudre) et le laisser parfumer l''huile."},{"step":3,"title":"Mijoter","text":"Ajouter le guedj et l''eau, laisser mijoter 20 min."},{"step":4,"title":"Servir","text":"Servir sur du riz blanc, saupoudre de netetou en poudre."}]',
  ARRAY['Le netetou remplace le bouillon cube : 100 pour cent naturel.','A doser : son gout fermente est puissant.','Le Netetou Mix (creation Louma) est une version tout-en-un en poudre.'],
  NULL, false),

-- 10. SPAGHETTI FRUITS DE MER (fiable — pagne "parfait en sauce spaghetti")
('spaghetti-fruits-de-mer', 'Spaghetti aux Fruits de Mer', NULL, 'Pates aux fruits de mer seches du Saloum', '🍝', 'Une rencontre entre l''Italie et le Saloum : des spaghetti nappes d''une sauce aux fruits de mer seches (pagne, crevettes) et tomate. Le pagne frais est parfait dans cette sauce spaghetti.', 15, 30, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['400 g de spaghetti','Pagne (coques)','Crevettes sechees','2 oignons','Ail','Tomates / concentre de tomate','Huile d''olive','Persil','Sel, poivre, piment'],
  '[{"step":1,"title":"Rehydrater","text":"Tremper le pagne et les crevettes a l''eau tiede 15 min."},{"step":2,"title":"Sauce","text":"Faire revenir ail et oignons, ajouter la tomate, puis les fruits de mer. Mijoter 15 min."},{"step":3,"title":"Pates","text":"Cuire les spaghetti al dente dans l''eau salee."},{"step":4,"title":"Melanger","text":"Melanger les pates a la sauce. Parsemer de persil et servir."}]',
  ARRAY['Le pagne (coques) du Saloum remplace parfaitement les fruits de mer frais.','Un filet d''huile d''olive en fin de cuisson relie les deux cuisines.'],
  NULL, false),

-- 11. THIERE TOUMBOULANE (fiable — encyclopedie : toumboulane epaissit / accelerateur de gout)
('thiere-toumboulan', 'Thiere Toumboulane', 'Cere', 'Couscous de mil au guedj toumboulane', '🍲', 'Le thiere toumboulane est un couscous de mil senegalais servi avec une sauce ou le guedj toumboulane (cartilage seche de raie ou requin) apporte son effet gelatine : une sauce epaisse, signe d''un plat reussi.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['Couscous de mil (thiere)','Guedj toumboulane','Poisson ou viande','Legumes','2 oignons','Concentre de tomate','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Cuire le thiere","text":"Cuire le couscous de mil a la vapeur en plusieurs passages jusqu''a ce qu''il soit tendre."},{"step":2,"title":"Faire la sauce","text":"Faire revenir les oignons, ajouter le concentre de tomate, le netetou et le guedj toumboulane."},{"step":3,"title":"Mijoter","text":"Ajouter les legumes, le poisson (ou la viande) et l''eau. Le toumboulane epaissit la sauce."},{"step":4,"title":"Servir","text":"Servir le couscous de mil nappe de la sauce epaisse."}]',
  ARRAY['Le guedj toumboulane epaissit la sauce (effet gelatine) : une sauce epaisse = un bon plat.','Le toumboulane est tres rare : un accelerateur de gout precieux.'],
  NULL, false)

ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- Cablage des images (deja optimisees dans public/dishes/, deployees via git push)
-- ============================================================
UPDATE dishes SET image_url = '/dishes/ngalakh.jpg'                 WHERE slug = 'ngalakh';
UPDATE dishes SET image_url = '/dishes/niankatang-diola.jpg'        WHERE slug = 'niankatang-diola';
UPDATE dishes SET image_url = '/dishes/dakhine.jpg'                 WHERE slug = 'dakhine';
UPDATE dishes SET image_url = '/dishes/beugeuth.jpg'                WHERE slug = 'beugeuth';
UPDATE dishes SET image_url = '/dishes/thiebou-diaga.jpg'          WHERE slug = 'thiebou-diaga';
UPDATE dishes SET image_url = '/dishes/yassa-poisson.jpg'           WHERE slug = 'yassa-poisson';
UPDATE dishes SET image_url = '/dishes/sauce-thieboudienne.jpg'     WHERE slug = 'sauce-thieboudienne';
UPDATE dishes SET image_url = '/dishes/sauce-fruits-de-mer.jpg'     WHERE slug = 'sauce-fruits-de-mer';
UPDATE dishes SET image_url = '/dishes/sauce-netetou.jpg'           WHERE slug = 'sauce-netetou';
UPDATE dishes SET image_url = '/dishes/spaghetti-fruits-de-mer.jpg' WHERE slug = 'spaghetti-fruits-de-mer';
UPDATE dishes SET image_url = '/dishes/thiere-toumboulan.jpg'       WHERE slug = 'thiere-toumboulan';

-- Verification
SELECT slug, name, image_url FROM dishes WHERE slug IN
  ('ngalakh','niankatang-diola','dakhine','beugeuth','thiebou-diaga','yassa-poisson',
   'sauce-thieboudienne','sauce-fruits-de-mer','sauce-netetou','spaghetti-fruits-de-mer','thiere-toumboulan')
  ORDER BY slug;
