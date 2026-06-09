-- ============================================================
-- Corrections du 9 juin 2026 — a executer dans Supabase > SQL Editor
--  1) Basse Salte : nom + vraie recette
--  2) Thiebou Yapp (accent)
--  3) Thiere Mboum (accent)
--  4) Produit "Thiere" -> "Thiere" accentue
-- ============================================================

-- 1) BASSÉ SALTÉ : nom (Bassé, pas Bassi) + vraie recette
update dishes
set name       = 'Bassé Salté',
    name_wolof = 'Bassé Salté',
    subtitle   = 'Thiéré à la sauce épaisse d''arachide et kéthiakh',
    description = 'Le Bassé Salté est un thiéré (couscous de mil) servi avec une sauce épaisse à base de pâte d''arachide, de kéthiakh, de tomate fraîche et de niébé. Proche du mafé, mais SANS netetou ni yeet. Certains y ajoutent de la viande ou du guedj.',
    other_ingredients = array[
      'Thiéré (couscous de mil)',
      'Pâte d''arachide (tiguadégué)',
      'Kéthiakh',
      'Tomate fraîche',
      '2 poignées de niébé'
    ],
    steps = '[
      {"step":1,"title":"Cuire le thiéré","text":"Cuire le thiéré (couscous de mil) à la vapeur en 2-3 passages, en égrenant entre chaque passage."},
      {"step":2,"title":"Préparer la sauce","text":"Délayer la pâte d''arachide. Ajouter le kéthiakh émietté, la tomate fraîche et les niébés. Laisser mijoter jusqu''à une sauce épaisse. (Pas de netetou ni de yeet.)"},
      {"step":3,"title":"Option","text":"Certains y ajoutent de la viande ou du guedj, selon les goûts."},
      {"step":4,"title":"Servir","text":"Dresser le thiéré en dôme et napper de la sauce épaisse."}
    ]'::jsonb
where slug = 'basse-sale';

-- Retirer netetou + yeet (pas dans cette recette)
delete from dish_products
where dish_id = (select id from dishes where slug = 'basse-sale')
  and product_id in (select id from products where slug in ('netetu-dom','yeet-maggi'));

-- Guedj Beurre -> optionnel
update dish_products
set is_essential = false,
    role = 'Optionnel (certains en ajoutent)'
where dish_id = (select id from dishes where slug = 'basse-sale')
  and product_id = (select id from products where slug = 'guej-beurre');

-- Ajouter Pâte d'arachide (essentiel) si absent
insert into dish_products (dish_id, product_id, role, quantity, is_essential, display_order)
select (select id from dishes where slug='basse-sale'),
       (select id from products where slug='tiguadegue-500'),
       'Base de la sauce (pâte d''arachide)', '4 cuilleres', true, 2
where not exists (
  select 1 from dish_products
  where dish_id=(select id from dishes where slug='basse-sale')
    and product_id=(select id from products where slug='tiguadegue-500'));

-- Ajouter Niébé (essentiel) si absent
insert into dish_products (dish_id, product_id, role, quantity, is_essential, display_order)
select (select id from dishes where slug='basse-sale'),
       (select id from products where slug='niebe-saloum'),
       'Légumineuse', '2 poignées', true, 3
where not exists (
  select 1 from dish_products
  where dish_id=(select id from dishes where slug='basse-sale')
    and product_id=(select id from products where slug='niebe-saloum'));

-- 2) THIÉBOU YAPP (accent) — renomme l'ancien "Ceebu Yapp" (slug inchangé)
update dishes
set name = 'Thiébou Yapp',
    description = 'Le thiébou yapp (ceebu yapp) est la version viande du thieboudienne : du riz cuit dans une sauce tomate avec de la viande (boeuf ou agneau) et des legumes. Moins connu que le thieboudienne mais tout aussi delicieux.'
where slug = 'ceebu-yapp';

-- 3) THIÉRÉ MBOUM (accent) — on garde name_wolof "Thiere mboum" pour la recherche
update dishes
set name = 'Thiéré Mboum'
where slug = 'thiere-mboum';

-- 4) Produit "Thiere (couscous de mil)" -> accentue
update products
set name = 'Thiéré (couscous de mil)'
where slug = 'thiere-champion';

-- 5) Creer le produit KÉTHIAKH (n'existait pas dans le guide). Graphies : Kéthiakh + Keciax.
insert into products (slug, name, name_local, category_id, price_unit, badge, description, origin, taste_profile, usage_advice, image_main, image_gallery, in_stock, seggfaye_url)
select 'kethiakh', 'Kéthiakh', 'Keciax', (select id from categories where slug='mer'),
       'par 100g', null,
       'Poisson séché et fermenté, plus sec et plus piquant que le guedj classique. Le kéthiakh (keciax) est obtenu par un séchage prolongé qui concentre les saveurs au maximum.',
       'Sénégal — Pêche artisanale côtière',
       'Goût très concentré, plus fort que le guedj. À utiliser en petite quantité.',
       'Émietter dans les sauces. Excellent dans le bassé salté et le thiébou kéthiakh.',
       'kethiakh1.webp', array['kethiakh1.webp','kethiakh2.webp','kethiakh3.webp'], true,
       'https://www.seggfaye.com/produits/keciax.html'
where not exists (select 1 from products where slug='kethiakh');

-- 6) Lier le Kéthiakh au Bassé Salté (essentiel)
insert into dish_products (dish_id, product_id, role, quantity, is_essential, display_order)
select (select id from dishes where slug='basse-sale'),
       (select id from products where slug='kethiakh'),
       'Poisson séché (goût de fond)', 'A volonté', true, 4
where not exists (
  select 1 from dish_products
  where dish_id=(select id from dishes where slug='basse-sale')
    and product_id=(select id from products where slug='kethiakh'));
