-- Louma Guide - Nouveaux plats (Phase 2)
-- A executer dans le SQL Editor de Supabase APRES le seed initial

-- ===================
-- NOUVEAUX PLATS (15 plats)
-- ===================

INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES

('diambane-dakkar', 'Diambane Dakkar', 'Diambane', 'Ragout de fruits de mer seches au tamarin', '🦐', 'Le diambane dakkar est un plat riche et parfume a base de fruits de mer seches (crevettes, guedj, yeet) mitonnes dans une sauce au tamarin. Le tamarin apporte une acidite unique qui equilibre la puissance des produits seches. Un plat de connaisseurs.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['500 g de tamarin (dakkar)','2 gros oignons','3 tomates fraiches','Concentre de tomate','Huile vegetale','Riz blanc','Sel, poivre, piment'],
  '[{"step":1,"title":"Preparer le tamarin","text":"Tremper le tamarin dans l''eau tiede 30 min. Filtrer pour obtenir un jus epais et acide. Reserver."},{"step":2,"title":"Rehydrater les fruits de mer","text":"Tremper les crevettes sechees et le guedj dans l''eau tiede 15 min. Egoutter."},{"step":3,"title":"Faire la base","text":"Faire revenir les oignons eminces dans l''huile. Ajouter le netetou et le yeet. Puis le concentre de tomate."},{"step":4,"title":"Assembler la sauce","text":"Ajouter les fruits de mer rehydrates, les tomates fraiches coupees et le jus de tamarin. Couvrir d''eau."},{"step":5,"title":"Mijoter","text":"Laisser mijoter 40 min a feu doux. La sauce doit epaissir et les saveurs se concentrer."},{"step":6,"title":"Servir","text":"Servir sur du riz blanc. L''acidite du tamarin equilibre la puissance des fruits de mer."}]',
  ARRAY['Le tamarin (dakkar) est la cle de ce plat : il apporte l''acidite qui contrebalance la puissance du guedj et du yeet.','Ne pas mettre trop de tamarin d''un coup, gouter et ajuster. L''equilibre acide-sale est delicat.','Ce plat est un classique des Iles du Saloum, ou les fruits de mer seches abondent.'],
  NULL, true),

('ceebu-yapp', 'Thiebou Yapp', 'Ceebu yapp', 'Riz a la viande senegalais', '🥩', 'Le thiebou yapp (ceebu yapp) est la version viande du thieboudienne : du riz cuit dans une sauce tomate avec de la viande (boeuf ou agneau) et des legumes. Moins connu que le thieboudienne mais tout aussi delicieux.', 30, 75, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz brise','1 kg de viande (boeuf ou agneau)','3 cuilleres de concentre de tomate','2 gros oignons','3 carottes','1 chou blanc','2 aubergines','1 morceau de citrouille','Persil, ail','Huile vegetale','Sel, poivre, piment'],
  '[{"step":1,"title":"Saisir la viande","text":"Couper la viande en morceaux. Faire dorer dans l''huile avec les oignons eminces."},{"step":2,"title":"Preparer la sauce","text":"Ajouter le concentre de tomate et le faire rotir. Ajouter le netetou et le yeet."},{"step":3,"title":"Cuire les legumes","text":"Ajouter l''eau, les carottes, le chou, les aubergines et la citrouille. Cuire 25 min."},{"step":4,"title":"Cuire le riz","text":"Retirer viande et legumes. Cuire le riz dans le bouillon. Etuvage sous torchon."},{"step":5,"title":"Dresser","text":"Riz en dome, viande au centre, legumes autour."}]',
  ARRAY['La viande doit etre bien saisie pour carameliser et donner du gout au bouillon.','Le netetou et le yeet sont optionnels mais recommandes pour plus de profondeur.'],
  NULL, true),

('dibi', 'Dibi', 'Dibi', 'Viande grillee senegalaise', '🔥', 'Le dibi est la grillade senegalaise par excellence : de l''agneau (ou du boeuf) grille au charbon, assaisonne simplement avec des oignons, de la moutarde et du piment. Servi dans du papier journal avec des frites, c''est le street food ultime.', 15, 30, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['1 kg d''agneau (cotes ou gigot decoupe)','3 gros oignons','Moutarde de Dijon','Huile d''arachide','Frites (optionnel)','Pain (optionnel)','Sel, poivre'],
  '[{"step":1,"title":"Preparer la viande","text":"Couper l''agneau en morceaux. Assaisonner avec sel, poivre et un peu de moutarde."},{"step":2,"title":"Griller","text":"Faire griller au charbon de bois (ou au four gril) jusqu''a ce que la viande soit doree a l''exterieur et juteuse a l''interieur."},{"step":3,"title":"Preparer la sauce oignon","text":"Emincer les oignons finement. Melanger avec la moutarde, l''huile et le piment."},{"step":4,"title":"Servir","text":"Servir la viande grillee avec la sauce oignon et le kani a cote. Accompagner de frites ou de pain."}]',
  ARRAY['Le vrai dibi se fait au charbon de bois, c''est ce qui donne le gout fume.','La sauce oignon-moutarde est indispensable, c''est elle qui fait le dibi.','Au Senegal, le dibi se mange a la main, emballe dans du papier.'],
  NULL, true),

('lakh', 'Lakh', 'Lakh', 'Bouillie de mil au lait caille', '🥣', 'Le lakh est une bouillie de mil onctueuse servie avec du lait caille sucre. Plus doux et plus cremeux que le fonde, c''est un dessert-gouter tres apprecie des enfants et des adultes.', 10, 25, '6 personnes', 'Facile', 'Dessert',
  ARRAY['500 ml de lait caille','200 ml de creme liquide','Sucre en poudre','Vanille','Muscade rapee','Raisins secs (optionnel)'],
  '[{"step":1,"title":"Cuire le mil","text":"Cuire l''arraw dans l''eau bouillante en remuant constamment pendant 20 min. La bouillie doit etre lisse et epaisse."},{"step":2,"title":"Preparer le lait","text":"Melanger le lait caille avec la creme, le sucre, la vanille et la muscade."},{"step":3,"title":"Servir","text":"Verser la bouillie chaude dans des bols. Napper de lait caille sucre. Ajouter un filet de miel."}]',
  ARRAY['Le lakh se mange tiede ou froid, selon les preferences.','L''arraw donne une texture plus epaisse et cremeuse que le sankal.','Le miel pur (lem) est le meilleur accompagnement pour le lakh.'],
  NULL, true),

('ndambe', 'Ndambe', 'Ndambe', 'Ragout de haricots niebe epice', '🫘', 'Le ndambe est un ragout de haricots niebe mitonnes dans une sauce tomate epicee. Servi avec du pain (ndambe sandwich) ou du riz, c''est un plat du quotidien nourrissant et economique.', 20, 45, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['2 gros oignons','3 tomates fraiches','Concentre de tomate','Huile vegetale','Pain ou riz','Persil','Sel, poivre'],
  '[{"step":1,"title":"Cuire les niebe","text":"Tremper les niebe 2h. Les cuire dans l''eau jusqu''a ce qu''ils soient tendres (30-40 min)."},{"step":2,"title":"Preparer la sauce","text":"Faire revenir les oignons. Ajouter le netetou dans l''huile chaude. Puis le concentre de tomate et les tomates fraiches."},{"step":3,"title":"Assembler","text":"Ajouter les niebe cuits a la sauce. Ajouter le piment. Mijoter 15 min."},{"step":4,"title":"Servir","text":"Servir avec du pain (en sandwich) ou du riz blanc."}]',
  ARRAY['Le ndambe sandwich est le petit-dejeuner populaire au Senegal.','Les niebe du Saloum cuisent plus vite et sont plus tendres.','Le netetou est optionnel mais donne une profondeur de gout incomparable.'],
  NULL, false),

('bassi-sale', 'Bassi Sale', 'Bassi sale', 'Couscous de mil a la sauce de viande sechee', '🍖', 'Le bassi sale est un couscous de mil servi avec une sauce concentree a base de viande sechee, guedj et legumes. Plat rustique et nourrissant, c''est un classique du monde rural senegalais.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['Viande sechee (kethiakh ou guedj)','Legumes varies (carottes, chou, navets)','2 oignons','Concentre de tomate','Huile vegetale','Sel, poivre'],
  '[{"step":1,"title":"Cuire le thiere","text":"Cuire le couscous de mil a la vapeur en 2-3 passages. Egrener entre chaque passage."},{"step":2,"title":"Preparer la sauce","text":"Faire revenir oignons et viande sechee. Ajouter le netetou, le guedj et le yeet. Puis le concentre de tomate."},{"step":3,"title":"Cuire les legumes","text":"Ajouter les legumes et l''eau. Mijoter 30 min."},{"step":4,"title":"Servir","text":"Disposer le thiere en dome, arroser de sauce, disposer les legumes autour."}]',
  ARRAY['Le bassi sale est la version rusique et campagnarde du thiere mboum.','La viande sechee et le guedj donnent toute la saveur a ce plat.'],
  NULL, false),

('sombi', 'Sombi', 'Sombi', 'Riz au lait senegalais', '🍚', 'Le sombi est un riz au lait senegalais, parfume a la vanille et a la fleur d''oranger. Cremeux et reconfortant, c''est un dessert populaire surtout pendant le Ramadan.', 5, 30, '6 personnes', 'Facile', 'Dessert',
  ARRAY['500 g de riz brise','1 L de lait','300 g de sucre','Vanille liquide','Fleur d''oranger','Muscade rapee','Beurre'],
  '[{"step":1,"title":"Cuire le riz","text":"Rincer le riz. Le cuire dans l''eau jusqu''a ce qu''il soit tres tendre et gonflé."},{"step":2,"title":"Ajouter le lait","text":"Ajouter le lait, le sucre, la vanille et la muscade. Cuire a feu doux en remuant 15 min."},{"step":3,"title":"Parfumer","text":"Ajouter la fleur d''oranger et un filet de miel en fin de cuisson."},{"step":4,"title":"Servir","text":"Servir tiede ou froid dans des bols. Saupoudrer de muscade."}]',
  ARRAY['Le sombi est le dessert incontournable du Ramadan au Senegal.','Ajouter un filet de miel pur (lem) pour une touche naturelle.','Le riz doit etre tres cuit, presque en puree, pour une texture cremeuse.'],
  NULL, false),

('pastels', 'Pastels', 'Pastels', 'Beignets farcis au poisson', '🥟', 'Les pastels sont des beignets farcis au poisson (ou a la viande) et frits. Street food senegalais par excellence, on les trouve a chaque coin de rue. Croustillants dehors, savoureux dedans.', 45, 20, '20 pieces', 'Moyen', 'Plat principal',
  ARRAY['500 g de farine','1 sachet de levure','Eau tiede','500 g de poisson (thon ou autre)','2 oignons','Persil','1 cube bouillon','Huile de friture','Sel, poivre'],
  '[{"step":1,"title":"Preparer la pate","text":"Melanger farine, levure, sel et eau tiede. Petrir jusqu''a obtenir une pate souple. Laisser reposer 1h."},{"step":2,"title":"Preparer la farce","text":"Emietter le poisson cuit. Melanger avec oignons eminces, persil, crevettes sechees, piment et assaisonnement."},{"step":3,"title":"Former les pastels","text":"Etaler la pate, decouper des ronds. Deposer la farce au centre, plier en demi-lune, sceller les bords a la fourchette."},{"step":4,"title":"Frire","text":"Plonger dans l''huile chaude (180°C). Frire 3-4 min de chaque cote jusqu''a dore."},{"step":5,"title":"Servir","text":"Servir chaud avec du kani (piment) et de la sauce oignon."}]',
  ARRAY['La farce peut contenir des crevettes sechees pour plus de saveur marine.','L''huile doit etre bien chaude pour que les pastels soient croustillants, pas gras.','Les pastels se mangent chauds, juste sortis de la friture.'],
  NULL, true),

('fataya', 'Fataya', 'Fataya', 'Chausson frit a la viande', '🥟', 'Les fataya sont des chaussons frits farcis a la viande hachee et aux oignons. Cousins des pastels mais avec une farce de viande. Un incontournable du street food senegalais.', 40, 20, '20 pieces', 'Moyen', 'Plat principal',
  ARRAY['500 g de farine','1 sachet de levure','Eau tiede','500 g de viande hachee','3 oignons','Persil','1 oeuf dur','Huile de friture','Sel, poivre'],
  '[{"step":1,"title":"Preparer la pate","text":"Meme pate que les pastels : farine, levure, sel, eau tiede. Petrir et laisser reposer 1h."},{"step":2,"title":"Preparer la farce","text":"Faire revenir la viande hachee avec les oignons, le persil et le piment. Ajouter l''oeuf dur emiette."},{"step":3,"title":"Former les fataya","text":"Etaler la pate, decouper des ronds. Deposer la farce, plier et sceller."},{"step":4,"title":"Frire","text":"Frire dans l''huile chaude 3-4 min de chaque cote."},{"step":5,"title":"Servir","text":"Servir chaud avec du kani."}]',
  ARRAY['La difference entre pastels et fataya : les pastels sont au poisson, les fataya a la viande.','On peut aussi les cuire au four pour une version plus legere.'],
  NULL, false),

('accara', 'Accara', 'Accara', 'Beignets de niebe croustillants', '🧆', 'Les accara sont des beignets de haricots niebe, croustillants a l''exterieur et moelleux a l''interieur. Un classique du petit-dejeuner et du gouter senegalais.', 30, 15, '20 pieces', 'Facile', 'Plat principal',
  ARRAY['Eau','1 oignon','Piment frais','Sel','Huile de friture'],
  '[{"step":1,"title":"Tremper les niebe","text":"Tremper les niebe toute la nuit. Frotter pour retirer la peau."},{"step":2,"title":"Mixer","text":"Mixer les niebe avec l''oignon et le piment jusqu''a obtenir une pate lisse et aeree."},{"step":3,"title":"Assaisonner","text":"Saler et melanger. La pate doit etre legere et mousseuse."},{"step":4,"title":"Frire","text":"Former des petites boules avec une cuillere. Plonger dans l''huile chaude. Frire jusqu''a dore."},{"step":5,"title":"Servir","text":"Servir chaud avec du pain et du kani."}]',
  ARRAY['Le secret des bons accara : bien retirer la peau des niebe pour une pate lisse.','La pate doit etre aeree et mousseuse, pas dense.','Les niebe du Saloum sont ideaux pour les accara grace a leur tendrete.'],
  NULL, false),

('chere', 'Chere', 'Cere', 'Couscous de mil au lait caille sucre', '🥣', 'Le chere est du couscous de mil fin (thiakry) servi avec du lait caille sucre et de la creme. Plus simple que le thiakry car il n''est pas cuit a la vapeur mais juste melange. Un gouter rapide et delicieux.', 10, 0, '4 personnes', 'Facile', 'Petit-dejeuner',
  ARRAY['500 ml de lait caille','Sucre en poudre','Creme liquide','Vanille'],
  '[{"step":1,"title":"Preparer le couscous","text":"Humidifier legerement le couscous de mil (thiakry) avec un peu d''eau. Egrener a la main."},{"step":2,"title":"Melanger","text":"Ajouter le lait caille, la creme, le sucre et la vanille. Bien melanger."},{"step":3,"title":"Servir","text":"Ajouter un filet de miel. Servir frais ou a temperature ambiante."}]',
  ARRAY['Le chere est la version express du thiakry : pas de cuisson vapeur necessaire.','Le miel pur (lem) remplace avantageusement le sucre.'],
  NULL, false),

('thiou', 'Thiou', 'Thiou', 'Sauce legumes au poisson', '🥘', 'Le thiou est une sauce de legumes au poisson, plus legere et plus rapide que le thieboudienne. C''est le plat du quotidien par excellence, simple mais savoureux grace aux condiments seches.', 20, 40, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['500 g de poisson','2 oignons','3 tomates fraiches','Legumes au choix (carottes, aubergines, gombo)','Concentre de tomate','Huile vegetale','Riz blanc','Sel, poivre'],
  '[{"step":1,"title":"Faire la base","text":"Faire revenir les oignons. Ajouter le netetou et le yeet dans l''huile chaude. Puis le concentre de tomate."},{"step":2,"title":"Ajouter les legumes","text":"Ajouter les tomates fraiches, les legumes et l''eau. Cuire 20 min."},{"step":3,"title":"Cuire le poisson","text":"Ajouter le poisson (et le guedj si utilise). Cuire 15 min a feu doux."},{"step":4,"title":"Servir","text":"Servir la sauce avec le poisson et les legumes sur du riz blanc."}]',
  ARRAY['Le thiou est le plat de tous les jours au Senegal. Simple et rapide.','Le netetou et le yeet suffisent a donner de la profondeur a ce plat simple.'],
  NULL, false),

('firire', 'Firire', 'Firire', 'Poisson frit croustillant', '🐟', 'Le firire est du poisson frit a la senegalaise : assaisonne avec du roff (marinade persil-ail-piment) puis frit jusqu''a devenir croustillant. Servi avec une sauce oignon-tomate et des frites.', 20, 15, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['1 kg de poisson (yaboye, diargne ou autre)','Persil','4 gousses d''ail','Piment','1 cube bouillon','Huile de friture','Frites','Sauce oignon-tomate','Sel, poivre'],
  '[{"step":1,"title":"Preparer le roff","text":"Mixer persil, ail, oignon et piment. Assaisonner le poisson avec cette marinade. Laisser reposer 30 min."},{"step":2,"title":"Frire","text":"Chauffer l''huile. Frire le poisson 5-7 min de chaque cote selon l''epaisseur. Il doit etre dore et croustillant."},{"step":3,"title":"Servir","text":"Servir avec des frites, de la sauce oignon-tomate et du kani."}]',
  ARRAY['Le roff (marinade) doit penetrer le poisson : faire des incisions sur les cotes.','L''huile doit etre bien chaude pour un poisson croustillant.','Le kani est indispensable avec le firire.'],
  NULL, false),

('bissap-jus', 'Jus de Bissap', 'Bissap', 'Boisson rafraichissante a l''hibiscus', '🌺', 'Le jus de bissap est LA boisson senegalaise par excellence : une infusion de fleurs d''hibiscus sechees, sucree et parfumee a la menthe et a la fleur d''oranger. Rouge rubis, rafraichissante et pleine de vitamine C.', 10, 15, '2 litres', 'Facile', 'Boisson',
  ARRAY['1,5 L d''eau','300 g de sucre','Feuilles de menthe fraiche','Fleur d''oranger','Vanille','Glaçons'],
  '[{"step":1,"title":"Infuser","text":"Porter l''eau a ebullition. Ajouter les fleurs de bissap. Infuser 15 min puis filtrer."},{"step":2,"title":"Sucrer et parfumer","text":"Ajouter le sucre dans l''infusion chaude. Melanger. Ajouter la menthe, la vanille et la fleur d''oranger."},{"step":3,"title":"Refroidir","text":"Laisser refroidir puis mettre au refrigerateur minimum 2h."},{"step":4,"title":"Servir","text":"Servir bien frais avec des glaçons."}]',
  ARRAY['Le bissap peut se preparer a froid (infusion 4h au frigo) pour un gout plus doux.','Ajouter du jus de citron pour plus de peps.','Se conserve 3-4 jours au refrigerateur.'],
  NULL, true),

('bouye-jus', 'Jus de Bouye', 'Bouye', 'Boisson au fruit de baobab', '🌳', 'Le jus de bouye est une boisson onctueuse et acidulee a base de poudre de fruit de baobab. Riche en vitamine C et en fibres, c''est une boisson saine et delicieuse, tres populaire au Senegal.', 10, 0, '2 litres', 'Facile', 'Boisson',
  ARRAY['1,5 L d''eau froide','300 g de sucre','Vanille liquide','Fleur d''oranger','Glaçons'],
  '[{"step":1,"title":"Dissoudre","text":"Verser la poudre de bouye dans l''eau froide. Melanger energiquement au fouet ou au mixeur pour eviter les grumeaux."},{"step":2,"title":"Sucrer et parfumer","text":"Ajouter le sucre, la vanille et la fleur d''oranger. Melanger bien."},{"step":3,"title":"Filtrer","text":"Filtrer a travers un tamis fin pour retirer les fibres."},{"step":4,"title":"Servir","text":"Servir bien frais avec des glaçons. Le bouye epaissit au repos, ajouter de l''eau si necessaire."}]',
  ARRAY['Le bouye a 6 fois plus de vitamine C que l''orange.','Bien filtrer pour une texture lisse.','Se conserve 2-3 jours au refrigerateur.'],
  NULL, true);


-- ===================
-- ASSOCIATIONS PLAT-PRODUIT (nouveaux plats)
-- ===================

-- Diambane Dakkar
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', '100 g', true, 1, 'Les crevettes sechees du Saloum sont la base du diambane.'),
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 morceau', true, 2, 'Le yeet renforce la profondeur des fruits de mer.'),
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout', '1 morceau', true, 3, 'Le guedj beurre se marie parfaitement avec l''acidite du tamarin.'),
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 4, NULL),
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', false, 5, NULL);

-- Ceebu Yapp
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='ceebu-yapp'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 1, NULL),
((SELECT id FROM dishes WHERE slug='ceebu-yapp'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', false, 2, 'Optionnel mais recommande pour plus de profondeur.'),
((SELECT id FROM dishes WHERE slug='ceebu-yapp'), (SELECT id FROM products WHERE slug='diwnior-500'), 'Touche finale (beurre clarifie)', 'Un filet en fin de cuisson', false, 3, 'Les thiebou (yapp, dieune, kethiakh) prennent du diwnior (beurre clarifie), jamais d''huile de palme. La couleur rouge vient de la tomate double concentre caramelisee.'),
((SELECT id FROM dishes WHERE slug='ceebu-yapp'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', false, 4, NULL);

-- Dibi
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='dibi'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 1, 'Le kani est indispensable avec le dibi.');

-- Lakh
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='lakh'), (SELECT id FROM products WHERE slug='arraw-dugup'), 'Base de la bouillie', '300 g', true, 1, 'L''arraw donne une texture epaisse et cremeuse ideale pour le lakh.'),
((SELECT id FROM dishes WHERE slug='lakh'), (SELECT id FROM products WHERE slug='lem-miel'), 'Sucrant naturel', '2 cuilleres a soupe', false, 2, 'Le miel pur est bien meilleur que le sucre pour le lakh.');

-- Ndambe
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='ndambe'), (SELECT id FROM products WHERE slug='niebe-saloum'), 'Haricots niebe', '300 g', true, 1, 'Les niebe du Saloum cuisent plus vite et sont plus tendres.'),
((SELECT id FROM dishes WHERE slug='ndambe'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a cafe', false, 2, NULL),
((SELECT id FROM dishes WHERE slug='ndambe'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 3, 'Le ndambe sans piment n''est pas du ndambe.');

-- Bassi Sale
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='bassi-sale'), (SELECT id FROM products WHERE slug='thiere-champion'), 'Couscous de mil', '500 g', true, 1, NULL),
((SELECT id FROM dishes WHERE slug='bassi-sale'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout', '1 morceau', true, 2, NULL),
((SELECT id FROM dishes WHERE slug='bassi-sale'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 3, NULL),
((SELECT id FROM dishes WHERE slug='bassi-sale'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 4, NULL);

-- Sombi
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='sombi'), (SELECT id FROM products WHERE slug='lem-miel'), 'Sucrant naturel', '2 cuilleres a soupe', false, 1, 'Un filet de miel en fin de cuisson sublime le sombi.');

-- Pastels
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='pastels'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Dans la farce', '30 g', false, 1, 'Les crevettes sechees ajoutent une saveur marine a la farce.'),
((SELECT id FROM dishes WHERE slug='pastels'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 2, NULL);

-- Fataya
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='fataya'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 1, NULL);

-- Accara
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='accara'), (SELECT id FROM products WHERE slug='niebe-saloum'), 'Base de la pate', '300 g', true, 1, 'Les niebe du Saloum sont parfaits pour les accara.'),
((SELECT id FROM dishes WHERE slug='accara'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 2, NULL);

-- Chere
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='chere'), (SELECT id FROM products WHERE slug='ciakri'), 'Couscous de mil', '300 g', true, 1, NULL),
((SELECT id FROM dishes WHERE slug='chere'), (SELECT id FROM products WHERE slug='lem-miel'), 'Sucrant naturel', '2 cuilleres a soupe', false, 2, NULL);

-- Thiou
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='thiou'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 1, NULL),
((SELECT id FROM dishes WHERE slug='thiou'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 2, NULL),
((SELECT id FROM dishes WHERE slug='thiou'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout', '1 morceau', false, 3, NULL);

-- Firire
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='firire'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', true, 1, 'Le kani est indispensable avec le poisson frit.');

-- Jus de Bissap
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='bissap-jus'), (SELECT id FROM products WHERE slug='bissap-rouge'), 'Fleurs de bissap', '100 g', true, 1, 'Le bissap rouge donne la couleur rubis et l''acidite caracteristique.');

-- Jus de Bouye
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='bouye-jus'), (SELECT id FROM products WHERE slug='bouye-baobab'), 'Poudre de baobab', '100 g', true, 1, '6x plus de vitamine C que l''orange. Boisson saine et delicieuse.');


-- ===================
-- PLATS SIMILAIRES (nouveaux plats)
-- ===================
INSERT INTO related_dishes (dish_id, related_dish_id) VALUES
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM dishes WHERE slug='soupoukandja')),
((SELECT id FROM dishes WHERE slug='diambane-dakkar'), (SELECT id FROM dishes WHERE slug='caldou')),
((SELECT id FROM dishes WHERE slug='ceebu-yapp'), (SELECT id FROM dishes WHERE slug='thieboudienne')),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM dishes WHERE slug='ceebu-yapp')),
((SELECT id FROM dishes WHERE slug='dibi'), (SELECT id FROM dishes WHERE slug='yassa-poulet')),
((SELECT id FROM dishes WHERE slug='yassa-poulet'), (SELECT id FROM dishes WHERE slug='dibi')),
((SELECT id FROM dishes WHERE slug='lakh'), (SELECT id FROM dishes WHERE slug='fonde')),
((SELECT id FROM dishes WHERE slug='lakh'), (SELECT id FROM dishes WHERE slug='thiakry')),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM dishes WHERE slug='lakh')),
((SELECT id FROM dishes WHERE slug='ndambe'), (SELECT id FROM dishes WHERE slug='domoda')),
((SELECT id FROM dishes WHERE slug='domoda'), (SELECT id FROM dishes WHERE slug='ndambe')),
((SELECT id FROM dishes WHERE slug='bassi-sale'), (SELECT id FROM dishes WHERE slug='thiere-mboum')),
((SELECT id FROM dishes WHERE slug='thiere-mboum'), (SELECT id FROM dishes WHERE slug='bassi-sale')),
((SELECT id FROM dishes WHERE slug='sombi'), (SELECT id FROM dishes WHERE slug='thiakry')),
((SELECT id FROM dishes WHERE slug='thiakry'), (SELECT id FROM dishes WHERE slug='sombi')),
((SELECT id FROM dishes WHERE slug='pastels'), (SELECT id FROM dishes WHERE slug='fataya')),
((SELECT id FROM dishes WHERE slug='fataya'), (SELECT id FROM dishes WHERE slug='pastels')),
((SELECT id FROM dishes WHERE slug='accara'), (SELECT id FROM dishes WHERE slug='ndambe')),
((SELECT id FROM dishes WHERE slug='chere'), (SELECT id FROM dishes WHERE slug='thiakry')),
((SELECT id FROM dishes WHERE slug='thiou'), (SELECT id FROM dishes WHERE slug='caldou')),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM dishes WHERE slug='thiou')),
((SELECT id FROM dishes WHERE slug='firire'), (SELECT id FROM dishes WHERE slug='thiou')),
((SELECT id FROM dishes WHERE slug='bissap-jus'), (SELECT id FROM dishes WHERE slug='bouye-jus')),
((SELECT id FROM dishes WHERE slug='bouye-jus'), (SELECT id FROM dishes WHERE slug='bissap-jus'));
