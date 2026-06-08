-- Correction factuelle thieboudienne (a executer une fois dans Supabase > SQL Editor) :
--  - PAS d'huile de palme (diwtir). Friture a l'huile vegetale d'arachide.
--  - Filet de diwnior (beurre clarifie) en finition.
--  - La couleur rouge vient de la TOMATE DOUBLE CONCENTRE CARAMELISEE.

-- 1. Fiche produit Diwtir : retirer la fausse mention thieboudienne + vrai usage
update products
set usage_advice = 'Entre dans le soupoukandja, le thiou diwtir, le borokhe, le niankatang diola, le fouty et l''etodie. Traditionnellement ajoute a une bouillie de farine de mil pour les jeunes mamans, afin de faciliter la cicatrisation apres l''accouchement.'
where slug = 'diwtir-pure';

-- 2. Lien plat->produit : remplacer Diwtir par Diwnior dans le thieboudienne
update dish_products
set product_id  = (select id from products where slug = 'diwnior-500'),
    role        = 'Touche finale (beurre clarifie)',
    quantity    = 'Un filet en fin de cuisson',
    is_essential = false,
    expert_note = 'En fin de cuisson, un filet de diwnior (beurre clarifie) parfume le riz. La couleur rouge vient de la tomate double concentre caramelisee, pas de l''huile de palme.'
where dish_id    = (select id from dishes   where slug = 'thieboudienne')
  and product_id = (select id from products where slug = 'diwtir-pure');

-- 3. Ingredients du plat thieboudienne
update dishes
set other_ingredients = array[
  '1 kg de riz brise','1 poisson entier (1,5 kg)','3 cuilleres de double concentre de tomate',
  'Huile vegetale d''arachide (pour la friture)','Un filet de diwnior (beurre clarifie) en fin de cuisson',
  '2 gros oignons','3 carottes','1 chou blanc','2 aubergines','1 morceau de citrouille',
  '4 gombos','1 manioc','Persil et oignons verts (roff)','Sel, poivre, piment']
where slug = 'thieboudienne';

-- 4. Etapes : huile d'arachide, tomate double concentre caramelisee (couleur), finition diwnior
update dishes
set steps = '[{"step":1,"title":"Preparer la farce (roff)","text":"Mixer persil, oignons verts, ail et piment. Farcir le poisson avec ce melange."},{"step":2,"title":"Saisir le poisson","text":"Dans une grande marmite, chauffer l''huile vegetale d''arachide. Faire dorer le poisson farci des deux cotes. Reserver."},{"step":3,"title":"Preparer la sauce","text":"Dans la meme huile, faire revenir les oignons emincés. Ajouter le double concentre de tomate et le faire caraméliser (rotir) 90 secondes — c''est lui qui donne au riz sa couleur rouge. Ajouter le guedj, le yeet et le netetou."},{"step":4,"title":"Cuire les legumes","text":"Ajouter l''eau, porter a ebullition. Ajouter les legumes durs en premier (carottes, manioc, chou), puis les plus tendres. Cuire 20 min."},{"step":5,"title":"Cuire le riz","text":"Retirer poisson et legumes. Filtrer le bouillon. Y cuire le riz. Couvrir d''un torchon puis du couvercle pour l''etuvage final."},{"step":6,"title":"Dresser","text":"Disposer le riz en dome, le poisson au centre, les legumes autour. Arroser d''un filet de diwnior (beurre clarifie). Servir avec le kani (piment) a cote."}]'::jsonb
where slug = 'thieboudienne';

-- 5. Ceebu yapp (thiebou yapp) : Diwtir -> Diwnior.
--    Les thiebou (yapp, dieune, kethiakh) prennent du diwnior, jamais d'huile de palme.
update dish_products
set product_id = (select id from products where slug = 'diwnior-500'),
    role = 'Touche finale (beurre clarifie)',
    quantity = 'Un filet en fin de cuisson',
    expert_note = 'Les thiebou (yapp, dieune, kethiakh) prennent du diwnior (beurre clarifie), jamais d''huile de palme. La couleur rouge vient de la tomate double concentre caramelisee.'
where dish_id    = (select id from dishes   where slug = 'ceebu-yapp')
  and product_id = (select id from products where slug = 'diwtir-pure');
