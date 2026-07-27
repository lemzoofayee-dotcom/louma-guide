-- Insertion de la fiche manquante 'diambane-dakkar' (elle etait dans add-new-dishes.sql
-- mais jamais inseree en base live -> page 404). Contenu identique au fichier d'origine.
-- ON CONFLICT DO NOTHING : sans effet si la fiche existe deja.
-- A executer dans le SQL Editor de Supabase.

INSERT INTO dishes (slug, name, name_wolof, subtitle, emoji, description, prep_time_minutes, cook_time_minutes, servings, difficulty, category, other_ingredients, steps, tips, blog_url, is_featured) VALUES
('diambane-dakkar', 'Diambane Dakkar', 'Diambane', 'Ragout de fruits de mer seches au tamarin', '🦐', 'Le diambane dakkar est un plat riche et parfume a base de fruits de mer seches (crevettes, guedj, yeet) mitonnes dans une sauce au tamarin. Le tamarin apporte une acidite unique qui equilibre la puissance des produits seches. Un plat de connaisseurs.', 30, 60, '6 personnes', 'Moyen', 'Plat principal',
  ARRAY['500 g de tamarin (dakkar)','2 gros oignons','3 tomates fraiches','Concentre de tomate','Huile vegetale','Riz blanc','Sel, poivre, piment'],
  '[{"step":1,"title":"Preparer le tamarin","text":"Tremper le tamarin dans l''eau tiede 30 min. Filtrer pour obtenir un jus epais et acide. Reserver."},{"step":2,"title":"Rehydrater les fruits de mer","text":"Tremper les crevettes sechees et le guedj dans l''eau tiede 15 min. Egoutter."},{"step":3,"title":"Faire la base","text":"Faire revenir les oignons eminces dans l''huile. Ajouter le netetou et le yeet. Puis le concentre de tomate."},{"step":4,"title":"Assembler la sauce","text":"Ajouter les fruits de mer rehydrates, les tomates fraiches coupees et le jus de tamarin. Couvrir d''eau."},{"step":5,"title":"Mijoter","text":"Laisser mijoter 40 min a feu doux. La sauce doit epaissir et les saveurs se concentrer."},{"step":6,"title":"Servir","text":"Servir sur du riz blanc. L''acidite du tamarin equilibre la puissance des fruits de mer."}]',
  ARRAY['Le tamarin (dakkar) est la cle de ce plat : il apporte l''acidite qui contrebalance la puissance du guedj et du yeet.','Ne pas mettre trop de tamarin d''un coup, gouter et ajuster. L''equilibre acide-sale est delicat.','Ce plat est un classique des Iles du Saloum, ou les fruits de mer seches abondent.'],
  NULL, true)
ON CONFLICT (slug) DO NOTHING;

-- Cabler son image (deja deployee sur Vercel)
UPDATE dishes SET image_url = '/dishes/diambane-dakkar.jpg' WHERE slug = 'diambane-dakkar';
