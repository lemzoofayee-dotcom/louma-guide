-- Louma Guide - Seed Data
-- Execute APRES schema.sql dans le SQL Editor de Supabase

-- ===================
-- CATEGORIES
-- ===================
INSERT INTO categories (slug, name, emoji, display_order) VALUES
  ('mer', 'Fruits de mer seches', '🦐', 1),
  ('epices', 'Epices & Condiments', '🌶️', 2),
  ('cereales', 'Cereales & Farines', '🌾', 3),
  ('beurres', 'Pates & Beurres', '🧈', 4),
  ('frais', 'Poissons frais', '🐟', 5);

-- ===================
-- PRODUITS (54 produits depuis produits.js)
-- ===================

-- Fruits de mer seches
INSERT INTO products (slug, name, name_local, category_id, price, price_unit, price_old, badge, description, origin, taste_profile, usage_advice, image_main, image_gallery, in_stock, seggfaye_url) VALUES
('crevettes-sechees', 'Crevettes sechees', 'Cipakh', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', NULL, 'Bestseller', 'Peche artisanale nocturne en duo dans les Iles du Saloum, cuisson a la vapeur, decortiquage a la main, puis sechage au soleil pendant 2 jours.', 'Iles du Saloum, Foundiougne', 'Aucune sensation de sable sous la dent : la zone argileuse du Saloum garantit une qualite bien superieure aux crevettes sablonneuses.', 'Rehydrater a l''eau tiede (jamais chaude) pour preserver le gout. Condiment polyvalent : se marie avec presque tous les plats senegalais.', 'crevette1.webp', ARRAY['crevette1.webp','crevette2.webp','crevette3.webp'], true, 'https://www.seggfaye.com/produits/crevettes-sechees.html'),

('yoxos', 'Yoxos', 'Huitres sechees', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', NULL, NULL, 'Cueillette a la main par les femmes du Saloum, sur les racines des paletuviers en pleine mangrove. Bouillies, decoquillees a la main, sechees au soleil.', 'Mangrove des Iles du Saloum', 'Chair sechee allongee/ovale. Recolte respectueuse, repos biologique de 6 mois par an.', 'Condiment aromatique pour rehausser tous les plats traditionnels. Rehydrater a l''eau tiede avant cuisson.', 'yoxos-saloum-1.webp', ARRAY['yoxos-saloum-1.webp','yoxos-saloum-2.webp','yoxos-saloum-3.webp'], true, 'https://www.seggfaye.com/produits/yoxos.html'),

('pagne', 'Pagne (coques)', 'Pagne', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', NULL, NULL, 'Coques cueillies a la main par les femmes dans la vase de la mangrove. Bouillies, decoquillees a la main, essorees au filet puis sechees au soleil 2 a 3 jours.', 'Mangrove des Iles du Saloum', 'Gout agreable de fruits de mer. Chair sechee arrondie.', 'Frais : parfait en sauce spaghetti. Seche : dans tous les thieb et le riz blanc.', 'pagne-conv.webp', NULL, true, 'https://www.seggfaye.com/produits/pagne.html'),

('tuffa', 'Tuffa', 'Touffa', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', NULL, NULL, 'Escargot de mer des Iles du Saloum, cueilli a la main dans la mangrove. Sorti de sa coquille puis seche au soleil pendant 3 a 4 jours.', 'Iles du Saloum, Foundiougne', 'Condiment puissant au gout marin concentre. Le sechage direct preserve une saveur plus intense.', 'Assaisonnement pour les sauces et le riz. Emietter dans la sauce en debut de cuisson.', 'tuffa.webp', NULL, true, 'https://www.seggfaye.com/produits/tuffa.html'),

('yeet-maggi', 'Yeet Maggi', 'Cymbium', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', NULL, NULL, 'Le yeet est un cymbium, gros mollusque marin. Seche et fermente, surnomme le Maggi africain, c''est le condiment roi de la cuisine senegalaise.', 'Senegal', 'Un petit morceau transforme completement une sauce grace a son gout umami puissant.', 'Emietter dans la sauce en debut de cuisson pour parfumer tout le plat.', 'yeet1.webp', ARRAY['yeet1.webp','yeet2.webp','yeet3.webp','yeet4.webp','yeet5.webp','yeet6.webp'], true, 'https://www.seggfaye.com/produits/yeet-maggi.html'),

('guej-yass', 'Guej Yass', 'Guedj Yass', (SELECT id FROM categories WHERE slug='mer'), 6.00, 'par 100g', 7.00, NULL, 'Guedj de yass (sardinelle plate), seche au soleil selon la methode traditionnelle senegalaise. Poisson plat a chair fine, gout prononce et texture ferme.', 'Senegal', 'Gout intense et sale qui releve puissamment les sauces. Forme plate pour un sechage uniforme.', 'Ideal dans le thieboudienne et les sauces a base de tomate. Casser en morceaux avant cuisson.', 'guedj-yass-1.webp', ARRAY['guedj-yass-1.webp','guedj-yass-3.webp','guedj-yass-5.webp','guedj-yass-2.webp','guedj-yass-4.webp'], true, 'https://www.seggfaye.com/produits/guej-yass.html'),

('guej-beurre', 'Guej Beurre', 'Guedj Berr', (SELECT id FROM categories WHERE slug='mer'), 4.00, 'par 100g', 6.00, NULL, 'Le guedj le plus connu de la diaspora. Fait a partir de courbine (Berr), un poisson a chair blanche et grasse. Gout doux et polyvalent.', 'Senegal', 'Sa texture grasse et sa saveur douce en font le guedj le plus accessible. Ideal pour debuter.', 'Se marie avec presque tous les plats senegalais. Incontournable dans le thieboudienne.', 'guedji-beurre.webp', NULL, true, 'https://www.seggfaye.com/produits/guej-beurre.html'),

('guej-beur-casamance', 'Guej Beur Casamance', 'Guedj Berr bi Casamance', (SELECT id FROM categories WHERE slug='mer'), 12.00, 'par 300g', 18.00, 'Casamance', 'Meme poisson que le Guedj Beurre (courbine), mais avec un sechage suivi d''un fumage au bois selon la technique casamancaise.', 'Casamance', 'Le fumage au bois apporte une dimension fumee unique. Version premium du Guedj Beurre.', 'Ideal pour les sauces qui demandent de la profondeur. A utiliser avec parcimonie.', 'guedji-beur_casamance.webp', NULL, true, 'https://www.seggfaye.com/produits/guej-beur-casamance.html'),

('guej-sol', 'Guej Sole', 'Guedj Sole', (SELECT id FROM categories WHERE slug='mer'), 4.00, 'par 100g', 6.00, NULL, 'Guedj de sole, un poisson plat a chair delicate. Sechage traditionnel au soleil. Finesse appreciee pour les sauces legeres.', 'Senegal', 'Plus doux que le kong ou le beurre, saveur subtile sans dominer le plat.', 'Se marie bien avec les sauces claires et le riz blanc.', 'guedj-sole-1.webp', ARRAY['guedj-sole-1.webp','guedj-sole-2.webp','guedj-sole-3.webp','guedj-sole-4.webp'], true, 'https://www.seggfaye.com/produits/guej-sol.html'),

('guej-kong', 'Guej Kong', 'Guedj Kong', (SELECT id FROM categories WHERE slug='mer'), 3.00, 'par 100g', 5.00, NULL, 'Guedj de machoiron (Kong). Avec le Beurre, c''est l''un des 2 guedj les plus connus de la diaspora. Gout prononce.', 'Senegal', 'Gout puissant et caracteristique qui donne du corps aux sauces. Le guedj que la diaspora reconnait les yeux fermes.', 'Incontournable dans le thieboudienne et les plats en sauce. Un petit morceau suffit.', 'guedj-kong-1.webp', ARRAY['guedj-kong-1.webp','guedj-kong-3.webp','guedj-kong-2.webp','guedj-kong-4.webp'], true, 'https://www.seggfaye.com/produits/guej-kong.html'),

('guej-tambajang', 'Guej Tambajang', 'Guedj Tambajang', (SELECT id FROM categories WHERE slug='mer'), 3.00, 'par 100g', 5.00, NULL, 'Petit poisson seche entier. Tres utilise comme condiment pour son gout concentre et sa praticite.', 'Senegal', 'Petite taille = sechage complet = saveurs intensement concentrees. Le guedj du quotidien.', 'Ajouter entier ou emietter dans les sauces en debut de cuisson. Excellent dans les soupes et le domoda.', 'guedj-tambajang-1.webp', ARRAY['guedj-tambajang-1.webp','guedj-tambajang-3.webp','guedj-tambajang-2.webp'], true, 'https://www.seggfaye.com/produits/guej-tambajang.html'),

('guej-toumboulan', 'Guej Toumboulan', 'Toumboulane', (SELECT id FROM categories WHERE slug='mer'), 3.00, 'par 100g', 5.00, 'Rare', 'Cartilages seches d''ailerons de raies ou de requin. Tres rare. Accelerateur de gout et epaississant naturel.', 'Senegal', 'Son secret : il epaissit la sauce grace a un effet gelatine naturel. Le guedj des connaisseurs.', 'A ajouter dans les sauces pour epaissir et intensifier le gout. Un petit morceau suffit.', 'toumbulan.webp', ARRAY['toumbulan.webp','toumbulan1.webp','toumbulan2.webp'], true, 'https://www.seggfaye.com/produits/guej-toumboulan.html'),

('kongfume', 'Kongfume', 'Kong fume', (SELECT id FROM categories WHERE slug='mer'), 30.00, 'par 500g', 35.00, 'Fume', 'Machoiron (kong) fume puis seche. Double transformation pour une saveur boisee profonde incomparable.', 'Senegal', 'Le fumage au bois donne au kong une dimension aromatique que le simple sechage n''atteint pas. Version premium.', 'Casser en morceaux et ajouter dans les sauces. Parfait pour le thieboudienne et les soupes.', 'kong-fume-sec.webp', NULL, true, 'https://www.seggfaye.com/produits/kongfume.html'),

('kongfume-gambie', 'Kongfume Gambie', 'Kong fume de Gambie', (SELECT id FROM categories WHERE slug='mer'), 30.00, 'par 500g', NULL, 'Gambie', 'Kong fume importe de Gambie. Fume selon la technique gambienne, plus intense.', 'Gambie', 'Fumage gambien repute pour son intensite. Arome boise plus puissant.', 'Meme utilisation que le kongfume senegalais. A doser selon preference.', 'kong-fume1.webp', NULL, true, 'https://www.seggfaye.com/produits/kongfume-gambie.html'),

('pack-saloum', 'Pack Saloum', 'Pack bi Saloum', (SELECT id FROM categories WHERE slug='mer'), 60.00, 'par kg', NULL, 'Pack 4 produits', '4 tresors des Iles du Saloum reunis : Tuffa + Yokhos + Cipakh + Pagne. Rarement disponibles en meme temps.', 'Iles du Saloum', 'Chaque produit vient de la meme zone mais avec des gouts totalement differents.', 'Le cadeau parfait pour decouvrir 4 saveurs du Saloum d''un coup.', 'packsaloum-sachetdebout1.webp', NULL, true, 'https://www.seggfaye.com/produits/pack-saloum.html'),

-- Epices & Condiments
('netetu-dom', 'Netetu Dom', 'Netetou', (SELECT id FROM categories WHERE slug='epices'), 5.00, 'par 100g', 6.00, NULL, 'Graines de nere bouillies, fermentees puis sechees. Condiment emblematique de la cuisine ouest-africaine. Circuit court.', 'Mali & Casamance', 'Exhausteur de gout naturel. Sous vide = pas d''odeur au transport, mais tout le gout en cuisine.', 'Emietter dans les sauces en debut de cuisson. Indispensable dans le mafe.', 'netetou-dome.webp', NULL, true, 'https://www.seggfaye.com/produits/netetu-dom.html'),

('netetu-barre', 'Netetu Barre', 'Netetou en barre', (SELECT id FROM categories WHERE slug='epices'), 5.00, 'par 100g', 6.00, NULL, 'Netetou presse en forme de barre compacte. Meme produit que le netetu dome, mais dosage plus facile.', 'Mali & Casamance', 'Format pratique : on casse la quantite voulue de la barre. Exhausteur de gout naturel.', 'Casser un morceau et emietter dans la sauce. Remplace les cubes aromatiques industriels.', 'netetou-barre.webp', NULL, true, 'https://www.seggfaye.com/produits/netetu-barre.html'),

('netetu-poudre', 'Netetu Poudre', 'Netetou poudre', (SELECT id FROM categories WHERE slug='epices'), 5.00, 'par 100g', 6.00, NULL, 'Netetou reduit en poudre fine. Format le plus pratique pour saupoudrer directement. Dissolution instantanee.', 'Mali & Casamance', 'Se fond dans la sauce sans laisser de morceaux. Dosage ultra-precis.', 'Saupoudrer directement dans la sauce ou sur les oeufs, les legumes sautes.', 'netetou-poudre.webp', NULL, true, 'https://www.seggfaye.com/produits/netetu-poudre.html'),

('netetu-mix', 'Netetu Mix', 'Netetou mixte', (SELECT id FROM categories WHERE slug='epices'), 15.00, 'par 200g', 20.00, 'Mix', 'Assortiment de netetou sous plusieurs formes (dome, barre, poudre) pour decouvrir et comparer.', 'Mali & Casamance', 'Le pack decouverte du netetou : chaque forme a sa texture et son usage.', 'Tester chaque forme sur un plat different pour trouver sa preference.', 'netetou-mixte.webp', NULL, true, 'https://www.seggfaye.com/produits/netetu-mix.html'),

('sauce-netetu-beugeuc', 'Sauce Netetu Beugeuc', 'Sauce netetou beugeuc', (SELECT id FROM categories WHERE slug='epices'), 10.00, '250g', NULL, 'Sauce', 'Sauce prete a l''emploi a base de netetou et de feuilles de bissap (beugeuc). Artisanale.', 'Senegal', 'Le mariage netetou + feuilles de bissap donne une sauce umami avec une touche d''acidite vegetale.', 'Ajouter 2 a 3 cuilleres dans la sauce en cours de cuisson. Parfait pour le mafe et le soupoukandja.', 'sauce-netetou.webp', NULL, true, 'https://www.seggfaye.com/produits/sauce-netetu-beugeuc.html'),

('beugeuc-feuille-bissap', 'Beugeuc Feuille Bissap', 'Beugeuc bi', (SELECT id FROM categories WHERE slug='epices'), 10.00, '300g', 15.00, 'Bissap', 'Feuilles de bissap sechees et broyees. Ingredient de base pour les sauces feuilles senegalaises.', 'Senegal', 'Texture visqueuse caracteristique et gout vegetal unique. Indispensable pour le mafe aux feuilles.', 'Rehydrater dans l''eau tiede puis ajouter a la sauce.', 'beugeuth-bissap2.webp', NULL, true, 'https://www.seggfaye.com/produits/beugeuc-feuille-bissap.html'),

('keciax', 'Keciax', 'Kethiakh', (SELECT id FROM categories WHERE slug='epices'), 3.00, 'par 100g', 5.00, NULL, 'Poisson seche et fermente, plus sec et plus piquant que le guedj classique. Saveurs ultra-concentrees.', 'Senegal', 'Gout tres concentre, plus fort que le guedj. Petite quantite = maximum d''impact.', 'Emietter en petits morceaux dans les sauces. Excellent dans le riz au poisson.', 'kethiakh1.webp', ARRAY['kethiakh1.webp','kethiakh2.webp','kethiakh3.webp'], true, 'https://www.seggfaye.com/produits/keciax.html'),

('bissap-rouge', 'Bissap Rouge', 'Bissap', (SELECT id FROM categories WHERE slug='epices'), 5.00, 'par 150g', 6.00, 'Bissap', 'Fleurs d''hibiscus sechees, couleur rouge intense. La base du jus de bissap, boisson emblematique du Senegal.', 'Kaolack / Keur Madiabel', 'Acidite naturelle rafraichissante. Effet gelifiant naturel (mucilage).', 'Infuser a froid ou a chaud. Ajouter sucre, menthe, fleur d''oranger.', 'Bissap-rouge.webp', NULL, true, 'https://www.seggfaye.com/produits/bissap-rouge.html'),

('bissap-blanc', 'Bissap Blanc', 'Bissap bu weex', (SELECT id FROM categories WHERE slug='epices'), 5.00, 'par 200g', 6.00, 'Bissap', 'Variete blanche du bissap, plus douce que la rouge. Utilisee autant en jus qu''en cuisine.', 'Kaolack / Keur Madiabel', 'Plus polyvalent que le rouge : meme acidite mais sans colorer.', 'En jus : infusion douce. En cuisine : dans les sauces ou la couleur rouge n''est pas souhaitee.', 'Bissap-blanc.webp', NULL, false, 'https://www.seggfaye.com/produits/bissap-blanc.html'),

('bouye-baobab', 'Bouye (poudre baobab)', 'Bouye', (SELECT id FROM categories WHERE slug='epices'), 6.00, 'par 200g', NULL, 'Baobab', 'Poudre de fruit de baobab, riche en vitamine C et en fibres. Base du jus de bouye.', 'Senegal', 'Gout acidule et legerement sucre. 6x plus de vitamine C que l''orange.', 'Melanger dans de l''eau froide avec du sucre et de la vanille pour un jus de bouye.', 'poudre-baobab.webp', NULL, true, 'https://www.seggfaye.com/produits/bouye-baobab.html'),

('puree-piment', 'Puree Piment Fort', 'Kani', (SELECT id FROM categories WHERE slug='epices'), 10.00, '200g', 12.00, 'Piment', 'Puree de piment fort artisanale, a partir de piments frais broyes. Piquant intense mais savoureux.', 'Senegal', 'Piment pur sans conservateur. Le gout du piment frais est preserve.', 'Ajouter en fin de cuisson ou servir a cote du plat. Indispensable avec le thieboudienne et le yassa.', 'kani-puree.webp', NULL, true, 'https://www.seggfaye.com/produits/puree-piment.html'),

('maad-confi', 'Maad Confi', 'Maad', (SELECT id FROM categories WHERE slug='epices'), 25.00, 'par kg', NULL, 'Confiture', 'Confiture artisanale de maad, fruit sauvage acidule typique du Senegal.', 'Senegal', 'Gout acidule-sucre unique, entre le citron vert et la mangue verte.', 'Se tartine comme une confiture classique. Excellent avec du pain ou dans un yaourt.', 'maad-confi2.webp', NULL, true, 'https://www.seggfaye.com/produits/maad-confi.html'),

('maad-fruit', 'Maad Fruit', 'Maad', (SELECT id FROM categories WHERE slug='epices'), 10.00, 'par kg', NULL, 'Fruit', 'Maad frais (Saba senegalensis), fruit sauvage de saison tres recherche.', 'Senegal', 'Fruit de saison rare. Gout acidule-sucre addictif.', 'Ouvrir le fruit, extraire la pulpe et consommer avec sel, sucre ou piment.', 'maad-fruit.webp', NULL, true, 'https://www.seggfaye.com/produits/maad-fruit.html'),

-- Cereales & Farines
('thiere-champion', 'Thiere (couscous de mil)', 'Thiere', (SELECT id FROM categories WHERE slug='cereales'), 18.00, 'par kg', NULL, 'Champion du Monde', 'Couscous de mil roule a la main, base du plat national thiere mboum. Champion du Monde du couscous.', 'Senegal', 'Grains irreguliers, texture unique, gout de mil authentique. Le roulage a la main change tout.', 'Cuire a la vapeur comme un couscous classique. Se sert avec des sauces de legumes.', 'thiere1.webp', NULL, true, 'https://www.seggfaye.com/produits/thiere-champion.html'),

('arraw-dugup', 'Arraw Dugup (mil)', 'Arraw', (SELECT id FROM categories WHERE slug='cereales'), 18.00, 'par kg', NULL, 'Mil', 'Granules de mil roulees a la main, plus grosses que le thiere. Base de bouillies traditionnelles.', 'Senegal', 'Texture plus epaisse, bouillies cremeuses et consistantes.', 'Cuire dans du lait ou de l''eau pour une bouillie epaisse. Ideal au petit-dejeuner.', 'arraw.webp', NULL, true, 'https://www.seggfaye.com/produits/arraw-dugup.html'),

('ciakri', 'Thiakry', 'Cere / Thiakry', (SELECT id FROM categories WHERE slug='cereales'), 18.00, 'par kg', NULL, 'Couscous', 'Couscous de mil fin roule a la main, specialement prepare pour le dessert thiakry.', 'Senegal', 'Grains fins qui absorbent parfaitement le lait caille. Texture cremeuse et granuleuse.', 'Melanger avec du lait caille, sucre, creme, vanille et muscade. Servir frais.', 'thiakry1.webp', NULL, true, 'https://www.seggfaye.com/produits/ciakri.html'),

('sankal-duggup', 'Sankal Duggup', 'Sankal', (SELECT id FROM categories WHERE slug='cereales'), 9.00, '500g', NULL, NULL, 'Semoule de mil grossiere pour le fonde (bouillie traditionnelle).', 'Senegal', 'Gout de mil brut et terreux. Texture grossiere pour des plats consistants.', 'Cuire dans l''eau ou le lait pour un fonde. Se sert avec du lait caille sucre.', 'sankal.webp', NULL, true, 'https://www.seggfaye.com/produits/sankal-duggup.html'),

('niebe-saloum', 'Niebe Saloum', 'Niebe', (SELECT id FROM categories WHERE slug='cereales'), 5.00, '250g', 6.00, 'Saloum', 'Haricots niebe des Iles du Saloum, riches en proteines. Cuisson rapide.', 'Iles du Saloum', 'Repute pour sa cuisson rapide et sa saveur douce. Plus tendre que les varietes importees.', 'Tremper 2h puis cuire. En ragout, accompagnement du riz, ou en accara.', 'niebe-saloum.webp', NULL, true, 'https://www.seggfaye.com/produits/niebe-saloum.html'),

('guerte-noflay', 'Guerte Noflay', 'Poudre d''arachide', (SELECT id FROM categories WHERE slug='cereales'), 5.00, 'par 250g', 7.00, 'Poudre arachide', 'Poudre d''arachide grillee finement moulue. Ingredient de base de nombreux plats emblematiques.', 'Senegal', 'Gout plus intense qu''une poudre industrielle. Se dissout facilement dans les sauces chaudes.', 'Delayer dans un peu d''eau tiede avant d''ajouter a la sauce. Indispensable dans le mbakhalou saloum.', 'Guerte-noflay.webp', NULL, true, 'https://www.seggfaye.com/produits/guerte-noflay.html'),

('guerte-tooy', 'Guerte Tooy', 'Arachides grillees', (SELECT id FROM categories WHERE slug='cereales'), 8.00, 'par kg', NULL, NULL, 'Arachides grillees a sec dans du sable chaud pour une cuisson uniforme et un croquant parfait.', 'Senegal', 'Le grillage au sable chaud donne un gout et un croquant impossibles a reproduire au four.', 'A grignoter nature ou pour preparer la pate d''arachide maison.', 'guerte-toye.webp', NULL, false, 'https://www.seggfaye.com/produits/guerte-tooy.html'),

-- Pates & Beurres
('tiguadegue-500', 'Tiguadegue (pate d''arachide)', 'Tigadegue', (SELECT id FROM categories WHERE slug='beurres'), 12.00, '500g', NULL, 'Pate arachide', 'Pate d''arachide pure 100% artisanale. Sans sucre, sans huile de palme, sans additif.', 'Senegal', 'Texture epaisse et gout d''arachide grillee intense. 100% arachide, rien d''autre.', 'Base du mafe et du domoda. Se tartine aussi sur du pain.', 'tiagadegue.webp', NULL, true, 'https://www.seggfaye.com/produits/tiguadegue-500.html'),

('tigadegue-250', 'Tigadegue', 'Tigadegue', (SELECT id FROM categories WHERE slug='beurres'), 6.00, 'par 250g', NULL, 'Pate arachide', 'Format 250g de la pate d''arachide artisanale. Meme qualite que le format 500g.', 'Senegal', 'Petit format pratique, meme pate d''arachide 100% pure.', 'Un pot de 250g suffit pour un mafe familial.', 'tiagadegue.webp', NULL, true, 'https://www.seggfaye.com/produits/tigadegue-250.html'),

('diwnior-500', 'Diwnior (beurre clarifie)', 'Diw nior', (SELECT id FROM categories WHERE slug='beurres'), 20.00, 'par 0,5L', 25.00, 'Beurre vache', 'Beurre clarifie traditionnel senegalais, a partir de lait de vache peul.', 'Senegal', 'Gout de noisette prononce impossible a retrouver dans le beurre clarifie occidental.', 'Pour la cuisson ou en touche finale sur le riz et le couscous.', 'diwnior.webp', NULL, false, 'https://www.seggfaye.com/produits/diwnior-500.html'),

('diwnior-1l', 'Diwnior (beurre clarifie)', 'Diw nior', (SELECT id FROM categories WHERE slug='beurres'), 40.00, 'par 1L', NULL, 'Beurre vache', 'Format 1L du beurre clarifie traditionnel peul. Pour grandes familles.', 'Senegal', 'Grand format plus economique. Se conserve longtemps sans refrigeration.', 'Conserver a temperature ambiante dans un endroit sec.', 'diwnior.webp', NULL, false, 'https://www.seggfaye.com/produits/diwnior-1l.html'),

('diwtir-pure', 'Diwtir Pure', 'Diw tir', (SELECT id FROM categories WHERE slug='beurres'), 25.00, 'par 1L', 30.00, 'Huile', 'Huile de palme rouge non raffinee, extraite artisanalement. Couleur rouge-orangee naturelle.', 'Senegal', 'Gout fruite et terreux, couleur rouge vif naturelle. Pur jus, non traite.', 'Utilisee dans le soupoukandja et d''autres sauces traditionnelles a l''huile de palme.', 'diwtir.webp', NULL, true, 'https://www.seggfaye.com/produits/diwtir-pure.html'),

('lem-miel', 'Lem miel Pure', 'Lem', (SELECT id FROM categories WHERE slug='beurres'), 25.00, '1,5L', 27.00, 'Miel', 'Miel pur non pasteurise, recolte traditionnellement. Non chauffe, non filtre. Format 1,5L.', 'Senegal', 'Aromes floraux complexes, bien different des miels industriels.', 'En tartine, dans le the, le lait chaud ou les tisanes.', 'lem-pure.webp', NULL, true, 'https://www.seggfaye.com/produits/lem-miel.html'),

-- Poissons frais
('thiof-decoupe', 'Thiof decoupe', 'Thiof', (SELECT id FROM categories WHERE slug='frais'), 55.00, 'carton 5kg', NULL, 'Carton 5kg', 'Thiof (merou blanc) decoupe en tranches, congele en carton de 5kg. Le poisson noble du vrai thieboudienne.', 'Senegal', NULL, 'Decongeler au refrigerateur. Ideal pour le thieboudienne, grille ou en sauce.', 'thiof.webp', NULL, false, 'https://www.seggfaye.com/produits/thiof-decoupe.html'),

('diargne-colafil', 'Diargne Colafil', 'Diargne', (SELECT id FROM categories WHERE slug='frais'), 49.00, 'carton 5kg', NULL, 'Carton 5kg', 'Diargne (pageot) decoupe en filets, congele en carton de 5kg. Chair blanche et delicate.', 'Senegal', NULL, 'Decongeler au refrigerateur. Se cuisine grille, en sauce ou frit.', 'sompate2.webp', NULL, false, 'https://www.seggfaye.com/produits/diargne-colafil.html'),

('beurre-capitaine', 'Beurre (Capitaine)', 'Berr / Capitaine', (SELECT id FROM categories WHERE slug='frais'), 45.00, 'carton 5kg', NULL, 'Carton 5kg', 'Capitaine (courbine) congele en carton de 5kg. C''est le meme poisson qui donne le guedj beurre une fois seche.', 'Senegal', NULL, 'Decongeler au refrigerateur. Parfait grille ou en thieboudienne.', 'thiof4.webp', NULL, false, 'https://www.seggfaye.com/produits/beurre-capitaine.html'),

('chanchar-dieye', 'Chanchar (Dieye)', 'Dieye', (SELECT id FROM categories WHERE slug='frais'), 25.00, 'carton 5kg', NULL, 'Carton 5kg', 'Petit poisson savoureux a prix accessible, tres populaire dans la cuisine quotidienne.', 'Senegal', NULL, 'Decongeler au refrigerateur. Excellent frit ou en sauce tomate.', 'yakh4.webp', NULL, false, 'https://www.seggfaye.com/produits/chanchar-dieye.html'),

('poisson-eau-douce', 'Poisson Eau Douce', NULL, (SELECT id FROM categories WHERE slug='frais'), 10.00, 'carton 5kg', NULL, 'Carton 5kg', 'Assortiment de poissons d''eau douce congeles en carton de 5kg. Prix imbattable.', 'Senegal', NULL, 'Decongeler au refrigerateur. Se cuisine en sauce, frit ou grille.', 'sompate3.webp', NULL, false, 'https://www.seggfaye.com/produits/poisson-eau-douce.html'),

('yaye-boye', 'Yaye Boye', 'Yaboye', (SELECT id FROM categories WHERE slug='frais'), 7.50, '/ kilo', NULL, 'Au kilo', 'Sardinelles fraiches congelees, le poisson le plus consomme au Senegal.', 'Senegal', NULL, 'Decongeler au refrigerateur. Se frit, se grille ou se cuisine en sauce tomate.', 'yaboye.webp', NULL, false, 'https://www.seggfaye.com/produits/yaye-boye.html'),

('poisson-sompate', 'Poisson Sompate', 'Sompate', (SELECT id FROM categories WHERE slug='frais'), 45.00, 'carton 5kg', NULL, 'Carton 5kg', 'Poisson de mer a chair ferme et gouteuse. Un des poissons preferes de la diaspora.', 'Senegal', NULL, 'Decongeler au refrigerateur. Excellent grille au charbon ou en thieboudienne.', 'sompate.webp', NULL, false, 'https://www.seggfaye.com/produits/poisson-sompate.html'),

('tilapia-rouge', 'Tilapia Rouge', 'Tilapia', (SELECT id FROM categories WHERE slug='frais'), 22.00, 'carton 5kg', NULL, 'Carton 5kg', 'Tilapia rouge congele en carton de 5kg. Chair blanche et douce, polyvalent.', 'Senegal', NULL, 'Decongeler au refrigerateur. Frit, grille, en sauce ou au four.', 'yakh.webp', NULL, false, 'https://www.seggfaye.com/produits/tilapia-rouge.html'),

('seude-baracouda', 'Seude Baracouda', 'Seude', (SELECT id FROM categories WHERE slug='frais'), 40.00, 'carton 5kg', NULL, 'Carton 5kg', 'Barracuda (seude) congele en carton de 5kg. Chair ferme et gouteuse.', 'Senegal', NULL, 'Decongeler au refrigerateur. Ideal grille ou en darnes dans le thieboudienne.', 'seude.webp', NULL, false, 'https://www.seggfaye.com/produits/seude-baracouda.html'),

('yakh-carpe-rouge', 'Yakh (Carpe Rouge)', 'Yakh', (SELECT id FROM categories WHERE slug='frais'), 60.00, 'carton 5kg', NULL, 'Carton 5kg', 'Carpe rouge congelee en carton de 5kg. Poisson noble de fete.', 'Senegal', NULL, 'Poisson de choix pour les grandes occasions. Grille ou en thieboudienne de luxe.', 'yakh2.webp', NULL, false, 'https://www.seggfaye.com/produits/yakh-carpe-rouge.html'),

('iler-bi', 'Iler Bi (Plapla)', 'Iler', (SELECT id FROM categories WHERE slug='frais'), 45.00, 'carton 5kg', NULL, 'Carton 5kg', 'Poisson plat a chair fine et delicate, tres recherche pour sa saveur subtile.', 'Senegal', NULL, 'Decongeler au refrigerateur. Frit (croustillant) ou en sauce legere.', 'iler.webp', NULL, false, 'https://www.seggfaye.com/produits/iler-bi.html'),

('melange-poisson-10kg', 'Melange de Poisson 10kg', NULL, (SELECT id FROM categories WHERE slug='frais'), 110.00, 'carton 10kg', NULL, 'Best Deal', 'Melange de plusieurs especes de poissons congeles. Meilleur rapport quantite/prix.', 'Senegal', NULL, 'Decongeler au refrigerateur selon le besoin. Varier les repas pendant des semaines.', 'melange-poisson.webp', NULL, false, 'https://www.seggfaye.com/produits/melange-poisson-10kg.html');


-- ===================
-- PLATS (10 plats initiaux)
-- ===================
INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES

('thieboudienne', 'Thieboudienne', 'Ceebu jen', 'Le plat national du Senegal', '🍛', 'Le thieboudienne est LE plat national senegalais : du riz cuit dans une sauce tomate riche avec du poisson frais, des legumes et des condiments seches (guedj, yeet, netetou) qui lui donnent son gout unique et profond.', 45, 90, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz brise','1 poisson entier (1,5 kg)','3 cuilleres de concentre de tomate','Huile vegetale d''arachide (pour la friture)','Un filet de diwnior (beurre clarifie) en fin de cuisson','2 gros oignons','3 carottes','1 chou blanc','2 aubergines','1 morceau de citrouille','4 gombos','1 manioc','Persil et oignons verts (roff)','Sel, poivre, piment'],
  '[{"step":1,"title":"Preparer la farce (roff)","text":"Mixer persil, oignons verts, ail et piment. Farcir le poisson avec ce melange."},{"step":2,"title":"Saisir le poisson","text":"Dans une grande marmite, chauffer l''huile vegetale d''arachide. Faire dorer le poisson farci des deux cotes. Reserver."},{"step":3,"title":"Preparer la sauce","text":"Dans la meme huile, faire revenir les oignons emincés. Ajouter le concentre de tomate et le faire rotir 90 secondes. Ajouter le guedj, le yeet et le netetou."},{"step":4,"title":"Cuire les legumes","text":"Ajouter l''eau, porter a ebullition. Ajouter les legumes durs en premier (carottes, manioc, chou), puis les plus tendres. Cuire 20 min."},{"step":5,"title":"Cuire le riz","text":"Retirer poisson et legumes. Filtrer le bouillon. Y cuire le riz. Couvrir d''un torchon puis du couvercle pour l''etuvage final."},{"step":6,"title":"Dresser","text":"Disposer le riz en dome, le poisson au centre, les legumes autour. Arroser d''un filet de diwnior (beurre clarifie). Servir avec le kani (piment) a cote."}]',
  ARRAY['Le secret d''un bon thieboudienne : le rotissage du concentre de tomate. 90 secondes dans l''huile chaude, pas plus.','Le guedj et le yeet doivent aller dans le bouillon AVANT les legumes pour diffuser leur gout.','Une sauce epaisse = signe d''un bon thieboudienne. Le toumboulane aide a epaissir naturellement.','Variante : Thieboudienne blanc (sans tomate, au citron) pour un gout plus leger.'],
  'https://www.seggfaye.com/blog/recette-thieboudienne-authentique.html', true),

('mafe', 'Mafe', 'Maafe', 'Sauce d''arachide onctueuse', '🥜', 'Le mafe est une sauce onctueuse a base de pate d''arachide, servie avec du riz. Un classique de la cuisine senegalaise et ouest-africaine, riche et reconfortant.', 30, 60, '6 personnes', 'Facile', 'Plat principal',
  ARRAY['500 g de viande (boeuf, agneau ou poulet)','2 gros oignons','3 cuilleres de concentre de tomate','2 carottes','1 patate douce','1 chou','Riz blanc','Sel, poivre'],
  '[{"step":1,"title":"Saisir la viande","text":"Dans une grande marmite, faire dorer la viande dans l''huile avec les oignons eminces."},{"step":2,"title":"Le secret : le netetou d''abord","text":"Ajouter le netetou DANS L''HUILE CHAUDE avec les oignons, AVANT la pate d''arachide. Cette etape est cruciale pour liberer les aromes."},{"step":3,"title":"Ajouter la pate d''arachide","text":"Delayer le tiguadegue dans de l''eau tiede. Verser dans la marmite. Bien melanger."},{"step":4,"title":"Cuire la sauce","text":"Ajouter le concentre de tomate, les legumes et l''eau. Laisser mijoter 45 min a feu doux en remuant regulierement."},{"step":5,"title":"Servir","text":"Servir la sauce onctueuse sur du riz blanc. Accompagner de kani (piment)."}]',
  ARRAY['Le netetou va dans l''huile chaude EN PREMIER. C''est la que la magie se passe.','Remuer souvent pour eviter que la pate d''arachide n''attache au fond.','La sauce doit etre epaisse et brillante, pas liquide.'],
  'https://www.seggfaye.com/blog/recette-mafe-authentique.html', true),

('yassa-poulet', 'Yassa Poulet', 'Yassa ginaar', 'Poulet marine aux oignons caramelises', '🍗', 'Le yassa est un plat emblematique de la Casamance : poulet marine au citron puis grille, servi dans une sauce d''oignons caramelises. Le trio oignon-citron-piment est la signature du plat.', 30, 45, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['1 poulet entier decoupe','2 kg d''oignons','6 citrons verts','4 gousses d''ail','Huile d''arachide','Moutarde de Dijon','Vinaigre','1 cube bouillon','Riz blanc','Sel, poivre'],
  '[{"step":1,"title":"Mariner le poulet","text":"Melanger jus de citron, oignons eminces, ail, moutarde, huile et piment. Mariner le poulet minimum 2h (idealement une nuit)."},{"step":2,"title":"Griller le poulet","text":"Sortir le poulet de la marinade. Le griller au four ou au charbon jusqu''a ce qu''il soit bien dore."},{"step":3,"title":"Carameliser les oignons","text":"Recuperer les oignons de la marinade. Les faire carameliser lentement dans l''huile a feu moyen pendant 30 min."},{"step":4,"title":"Assembler","text":"Ajouter le poulet grille dans les oignons caramelises. Ajouter le jus de marinade. Mijoter 15 min."},{"step":5,"title":"Servir","text":"Servir avec du riz blanc et le kani a cote."}]',
  ARRAY['La marinade doit etre longue : minimum 2h, idealement toute la nuit.','Les oignons doivent etre caramelises, pas juste cuits. C''est la patience qui fait le yassa.','Le citron vert senegalais est plus parfume que le citron jaune europeen.'],
  'https://www.seggfaye.com/blog/recette-yassa-poulet.html', true),

('soupoukandja', 'Soupoukandja', 'Suppu kandia', 'Sauce gombo aux fruits de mer', '🥬', 'Le soupoukandja (soupou kandia) est une sauce a base de gombo (okra) onctueuse et parfumee. Les fruits de mer seches (crevettes, guedj, kongfume) lui donnent une profondeur de gout exceptionnelle.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['500 g de gombo frais ou surgelé','500 g de viande ou poisson','2 gros oignons','Concentre de tomate','Huile de palme rouge','Sel, poivre','Riz blanc'],
  '[{"step":1,"title":"Preparer le gombo","text":"Couper le gombo en fines rondelles. Plus il est coupe fin, plus la sauce sera onctueuse."},{"step":2,"title":"Faire la base","text":"Chauffer l''huile de palme. Faire revenir les oignons. Ajouter le netetou et les fruits de mer seches (crevettes, guedj, kongfume)."},{"step":3,"title":"Cuire la sauce","text":"Ajouter le concentre de tomate, la viande ou le poisson, et l''eau. Laisser mijoter 30 min."},{"step":4,"title":"Ajouter le gombo","text":"Ajouter le gombo coupe. Cuire encore 20 min en remuant pour eviter les grumeaux."},{"step":5,"title":"Servir","text":"Servir la sauce epaisse et visqueuse sur du riz blanc."}]',
  ARRAY['Le gombo doit etre coupe tres fin pour une texture optimale.','Ajouter le yeet en debut de cuisson pour parfumer toute la sauce.','Le kongfume apporte une dimension fumee unique a ce plat.'],
  'https://www.seggfaye.com/blog/recette-soupoukandja.html', true),

('caldou', 'Caldou', 'Kaldou', 'Bouillon de poisson parfume', '🍲', 'Le caldou est un bouillon de poisson clair et parfume, plus leger que le thieboudienne. Le poisson est cuit entier dans un bouillon aromatise aux condiments seches. Simple mais delicieux.', 20, 40, '4 personnes', 'Facile', 'Plat principal',
  ARRAY['1 poisson entier (1 kg)','2 oignons','2 tomates fraiches','1 citron vert','Persil, ciboulette','Carottes','Pommes de terre','Sel, poivre','Riz blanc'],
  '[{"step":1,"title":"Preparer le bouillon","text":"Dans une marmite, faire revenir les oignons. Ajouter les tomates coupees, le guedj, le yeet et le netetou. Couvrir d''eau."},{"step":2,"title":"Cuire les legumes","text":"Ajouter carottes et pommes de terre. Laisser cuire 15 min."},{"step":3,"title":"Cuire le poisson","text":"Ajouter le poisson entier delicatement. Cuire 15-20 min a feu doux."},{"step":4,"title":"Assaisonner","text":"Ajouter le jus de citron, le persil et la ciboulette en fin de cuisson."},{"step":5,"title":"Servir","text":"Servir le bouillon avec le poisson et les legumes sur du riz blanc."}]',
  ARRAY['Le caldou est le plat ideal quand on veut quelque chose de leger mais savoureux.','Le bouillon doit rester clair, ne pas le faire reduire trop longtemps.','Un filet de citron vert en fin de cuisson fait toute la difference.'],
  'https://www.seggfaye.com/blog/recette-caldou.html', true),

('thiakry', 'Thiakry', 'Cere / Thiakry', 'Dessert au couscous de mil et lait caille', '🥛', 'Le thiakry est LE dessert senegalais par excellence : couscous de mil fin melange avec du lait caille sucre, de la creme et de la vanille. Servi frais, c''est un delice cremeux et granuleux.', 15, 20, '6 personnes', 'Facile', 'Dessert',
  ARRAY['500 ml de lait caille (soow)','200 ml de creme liquide','Sucre en poudre','Vanille liquide','Muscade rapee','Raisins secs (optionnel)'],
  '[{"step":1,"title":"Cuire le thiakry","text":"Cuire le couscous de mil a la vapeur pendant 15-20 minutes. Egrener avec un peu de beurre."},{"step":2,"title":"Preparer le melange","text":"Dans un grand saladier, melanger le lait caille, la creme, le sucre, la vanille et la muscade."},{"step":3,"title":"Assembler","text":"Ajouter le couscous de mil refroidi au melange. Bien remuer. Ajouter le miel si desire."},{"step":4,"title":"Refrigerer et servir","text":"Mettre au frais minimum 1h. Servir bien frais dans des bols."}]',
  ARRAY['Le thiakry se mange FROID. Ne pas le servir tiede.','Le lait caille senegalais (soow) a un gout unique, mais un yaourt nature peut depanner.','Ajouter un filet de miel pur (lem) pour une touche de douceur naturelle.'],
  NULL, true),

('fonde', 'Fonde', 'Fonde', 'Bouillie de mil traditionnelle', '🥣', 'Le fonde est une bouillie de mil epaisse et reconfortante, servie au petit-dejeuner ou au gouter. Accompagnee de lait caille et de miel, c''est un classique du quotidien senegalais.', 5, 20, '4 personnes', 'Facile', 'Petit-dejeuner',
  ARRAY['500 ml de lait caille','Sucre en poudre','Beurre (optionnel)'],
  '[{"step":1,"title":"Cuire le sankal","text":"Porter l''eau a ebullition. Verser le sankal en pluie en remuant constamment pour eviter les grumeaux."},{"step":2,"title":"Epaissir","text":"Cuire a feu doux 15 min en remuant. La bouillie doit etre epaisse et lisse."},{"step":3,"title":"Servir","text":"Verser dans des bols. Ajouter le lait caille, le miel et le sucre. Melanger ou laisser en couches."}]',
  ARRAY['Remuer sans arret pour eviter les grumeaux. C''est la cle d''un bon fonde.','Le miel pur (lem) est le meilleur accompagnement, bien meilleur que le sucre seul.'],
  NULL, true),

('domoda', 'Domoda', 'Domoda', 'Ragout d''arachide aux haricots', '🫘', 'Le domoda est un ragout riche et nourrissant a base de pate d''arachide et de haricots niebe. Plat du quotidien au Senegal, c''est un concentre de proteines vegetales et de saveurs.', 30, 60, '6 personnes', 'Facile', 'Plat principal',
  ARRAY['500 g de viande (boeuf ou agneau)','2 oignons','2 tomates','Concentre de tomate','Carottes','Sel, poivre','Riz blanc'],
  '[{"step":1,"title":"Preparer les niebe","text":"Tremper les niebe 2h dans l''eau froide. Egoutter."},{"step":2,"title":"Saisir et mijoter","text":"Faire dorer la viande avec les oignons. Ajouter le netetou dans l''huile chaude. Puis ajouter la pate d''arachide delayee."},{"step":3,"title":"Ajouter les legumes","text":"Ajouter les niebe, les tomates, les carottes et le concentre. Couvrir d''eau."},{"step":4,"title":"Cuire longuement","text":"Laisser mijoter 45 min a feu doux jusqu''a ce que les niebe soient tendres et la sauce epaisse."},{"step":5,"title":"Servir","text":"Servir sur du riz blanc."}]',
  ARRAY['Les niebe du Saloum cuisent plus vite que les varietes importees.','Le netetou est essentiel ici aussi : il va dans l''huile AVANT la pate d''arachide.'],
  NULL, true),

('mbakhalou-saloum', 'Mbakhalou Saloum', 'Mbaxal bu Saloum', 'Riz a la poudre d''arachide du Saloum', '🥜', 'Le mbakhalou saloum est un plat signature des Iles du Saloum : du riz cuit dans une sauce a base de poudre d''arachide, parfume au netetou et au guedj. Un plat riche et parfume.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['1 kg de riz','500 g de viande ou poisson','2 oignons','Concentre de tomate','Legumes varies','Sel, poivre'],
  '[{"step":1,"title":"Preparer la base","text":"Faire revenir oignons et viande. Ajouter le netetou dans l''huile chaude."},{"step":2,"title":"La sauce arachide","text":"Delayer la poudre d''arachide (guerte noflay) dans de l''eau tiede. Ajouter a la marmite avec le guedj et le yeet."},{"step":3,"title":"Ajouter le concentre","text":"Ajouter le concentre de tomate et les legumes. Laisser mijoter 30 min."},{"step":4,"title":"Cuire le riz","text":"Ajouter le riz dans la sauce. Cuire jusqu''a absorption. Etuvage final sous torchon."},{"step":5,"title":"Servir","text":"Servir en dome avec viande et legumes disposes autour."}]',
  ARRAY['La poudre d''arachide (guerte noflay) donne une texture et un gout differents de la pate (tiguadegue).','C''est le plat emblematique des Iles du Saloum, la terre natale du Guedjologue.'],
  NULL, true),

('thiere-mboum', 'Thiere Mboum', 'Thiere mboum', 'Couscous de mil aux legumes', '🥗', 'Le thiere mboum est un couscous de mil servi avec une sauce de legumes riche. Champion du Monde du couscous, le thiere senegalais est roule a la main et cuit a la vapeur.', 30, 45, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['Legumes varies (carottes, chou, navets, courge, gombo)','Viande (agneau ou boeuf)','2 oignons','Concentre de tomate','Sel, poivre'],
  '[{"step":1,"title":"Cuire le thiere","text":"Cuire le couscous de mil a la vapeur en 2 ou 3 passages. Egrener entre chaque passage avec un peu d''eau et de beurre."},{"step":2,"title":"Preparer la sauce","text":"Faire revenir la viande et les oignons. Ajouter le netetou. Puis le concentre de tomate et la poudre d''arachide."},{"step":3,"title":"Les legumes","text":"Ajouter tous les legumes coupes en gros morceaux. Couvrir d''eau et laisser mijoter 30 min."},{"step":4,"title":"Servir","text":"Disposer le thiere en dome. Arroser de sauce et disposer viande et legumes autour."}]',
  ARRAY['Le thiere doit etre cuit a la vapeur, pas bouilli dans l''eau.','La poudre d''arachide (guerte noflay) epaissit et enrichit la sauce.','Champion du Monde du couscous : un titre merite pour ce plat exceptionnel.'],
  NULL, true);


-- ===================
-- ASSOCIATIONS PLAT-PRODUIT
-- ===================

-- Thieboudienne
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='thiof-decoupe'), 'Poisson principal', '1 poisson entier (1,5 kg)', true, 1, 'Le thiof est le poisson noble du vrai thieboudienne. Le capitaine (beurre) est une excellente alternative.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='beurre-capitaine'), 'Poisson principal (alternative)', '1 poisson entier (1,5 kg)', false, 2, NULL),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout dans la sauce', '1 morceau', true, 3, 'Le guedj beurre donne de la profondeur a la sauce. A ajouter avec le yeet et le netetou AVANT les legumes.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='guej-kong'), 'Exhausteur de gout (alternative)', '1 morceau', false, 4, 'Alternative au guedj beurre, avec un gout plus prononce.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 5, 'Le yeet est indispensable. Il apporte l''umami profond qui fait le thieboudienne.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout naturel', '1 cuillere a soupe', true, 6, 'Le netetou remplace les cubes industriels. A mettre dans le bouillon.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='diwnior-500'), 'Touche finale (beurre clarifie)', 'Un filet en fin de cuisson', false, 7, 'En fin de cuisson, un filet de diwnior (beurre clarifie) parfume le riz. La couleur rouge vient du concentre de tomate, pas de l''huile de palme.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', false, 8, 'Le kani se sert A COTE du plat, pas dedans. Chacun dose selon son gout.'),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM products WHERE slug='guej-toumboulan'), 'Epaississant naturel', '1 petit morceau', false, 9, 'Le secret des connaisseurs : le toumboulane epaissit la sauce grace a son effet gelatine. Une sauce epaisse = un bon thieboudienne.');

-- Mafe
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM products WHERE slug='tiguadegue-500'), 'Base de la sauce', '500 g (1 pot)', true, 1, 'Delayer dans un peu d''eau tiede avant d''ajouter. La pate doit etre lisse.'),
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 morceau', true, 2, 'SECRET : le netetou va dans l''huile CHAUDE avec les oignons, AVANT la pate d''arachide. C''est la que la magie se passe.'),
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM products WHERE slug='puree-piment'), 'Accompagnement piquant', 'A volonte', false, 3, NULL),
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Profondeur de gout (optionnel)', '1 petit morceau', false, 4, 'Optionnel dans le mafe, mais un petit morceau de yeet ajoute une dimension supplementaire.');

-- Yassa Poulet
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='yassa-poulet'), (SELECT id FROM products WHERE slug='puree-piment'), 'Piment de la marinade', '1 a 2 cuilleres', true, 1, 'Le piment fait partie du trio sacre du yassa : oignon-citron-piment.');

-- Soupoukandja
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Base aromatique', '1 cuillere a soupe', true, 1, NULL),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', '50 g', true, 2, 'Les crevettes sechees apportent une saveur marine concentree a la sauce.'),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout', '1 morceau', true, 3, NULL),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='kongfume'), 'Dimension fumee', '1 morceau', false, 4, 'Le kongfume apporte une dimension fumee unique au soupoukandja.'),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 5, NULL),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM products WHERE slug='diwtir-pure'), 'Huile de cuisson', '100 ml', false, 6, NULL);

-- Caldou
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Parfum du bouillon', '1 morceau', true, 1, 'Le guedj beurre parfume le bouillon sans le dominer.'),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM products WHERE slug='guej-toumboulan'), 'Epaississant du bouillon', '1 petit morceau', false, 2, 'Optionnel : le toumboulane donne du corps au bouillon.'),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 3, NULL),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a cafe', true, 4, NULL),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM products WHERE slug='crevettes-sechees'), 'Fruits de mer seches', '30 g', false, 5, 'Optionnel mais les crevettes ajoutent une belle saveur marine au bouillon.');

-- Thiakry
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='thiakry'), (SELECT id FROM products WHERE slug='ciakri'), 'Base du dessert', '500 g', true, 1, 'Le couscous de mil fin specifiquement roule pour le thiakry.'),
((SELECT id FROM dishes WHERE slug='thiakry'), (SELECT id FROM products WHERE slug='lem-miel'), 'Sucrant naturel', '2 cuilleres a soupe', false, 2, 'Le miel pur ajoute une touche de douceur naturelle incomparable.');

-- Fonde
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='sankal-duggup'), 'Base de la bouillie', '250 g', true, 1, 'Le sankal donne une bouillie epaisse et rustique.'),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM products WHERE slug='lem-miel'), 'Accompagnement sucre', '2 cuilleres a soupe', false, 2, 'Bien meilleur que le sucre seul. Le miel pur transforme le fonde.');

-- Domoda
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='domoda'), (SELECT id FROM products WHERE slug='niebe-saloum'), 'Haricots du ragout', '250 g', true, 1, 'Les niebe du Saloum cuisent plus vite que les varietes importees.'),
((SELECT id FROM dishes WHERE slug='domoda'), (SELECT id FROM products WHERE slug='tiguadegue-500'), 'Base de la sauce', '250 g', true, 2, NULL),
((SELECT id FROM dishes WHERE slug='domoda'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 morceau', true, 3, 'Meme regle : netetou dans l''huile chaude AVANT la pate d''arachide.');

-- Mbakhalou Saloum
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='mbakhalou-saloum'), (SELECT id FROM products WHERE slug='guerte-noflay'), 'Poudre d''arachide', '200 g', true, 1, 'La poudre d''arachide donne une texture et un gout differents de la pate.'),
((SELECT id FROM dishes WHERE slug='mbakhalou-saloum'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 2, NULL),
((SELECT id FROM dishes WHERE slug='mbakhalou-saloum'), (SELECT id FROM products WHERE slug='guej-beurre'), 'Exhausteur de gout', '1 morceau', true, 3, NULL),
((SELECT id FROM dishes WHERE slug='mbakhalou-saloum'), (SELECT id FROM products WHERE slug='yeet-maggi'), 'Condiment umami', '1 petit morceau', true, 4, NULL);

-- Thiere Mboum
INSERT INTO dish_products (dish_id, product_id, role, quantity, is_essential, display_order, expert_note) VALUES
((SELECT id FROM dishes WHERE slug='thiere-mboum'), (SELECT id FROM products WHERE slug='thiere-champion'), 'Couscous de mil', '500 g', true, 1, 'Le thiere Champion du Monde roule a la main. Cuire a la vapeur, jamais bouilli.'),
((SELECT id FROM dishes WHERE slug='thiere-mboum'), (SELECT id FROM products WHERE slug='guerte-noflay'), 'Poudre d''arachide pour la sauce', '100 g', true, 2, 'La poudre d''arachide epaissit et enrichit la sauce de legumes.'),
((SELECT id FROM dishes WHERE slug='thiere-mboum'), (SELECT id FROM products WHERE slug='netetu-dom'), 'Exhausteur de gout', '1 cuillere a soupe', true, 3, NULL);


-- ===================
-- PLATS SIMILAIRES
-- ===================
INSERT INTO related_dishes (dish_id, related_dish_id) VALUES
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM dishes WHERE slug='caldou')),
((SELECT id FROM dishes WHERE slug='thieboudienne'), (SELECT id FROM dishes WHERE slug='mbakhalou-saloum')),
((SELECT id FROM dishes WHERE slug='caldou'), (SELECT id FROM dishes WHERE slug='thieboudienne')),
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM dishes WHERE slug='domoda')),
((SELECT id FROM dishes WHERE slug='mafe'), (SELECT id FROM dishes WHERE slug='soupoukandja')),
((SELECT id FROM dishes WHERE slug='domoda'), (SELECT id FROM dishes WHERE slug='mafe')),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM dishes WHERE slug='mafe')),
((SELECT id FROM dishes WHERE slug='soupoukandja'), (SELECT id FROM dishes WHERE slug='caldou')),
((SELECT id FROM dishes WHERE slug='thiakry'), (SELECT id FROM dishes WHERE slug='fonde')),
((SELECT id FROM dishes WHERE slug='fonde'), (SELECT id FROM dishes WHERE slug='thiakry')),
((SELECT id FROM dishes WHERE slug='mbakhalou-saloum'), (SELECT id FROM dishes WHERE slug='thiere-mboum')),
((SELECT id FROM dishes WHERE slug='thiere-mboum'), (SELECT id FROM dishes WHERE slug='mbakhalou-saloum')),
((SELECT id FROM dishes WHERE slug='yassa-poulet'), (SELECT id FROM dishes WHERE slug='mafe'));
