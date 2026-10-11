-- 11/10/2026 : la recette des 2 fiches ndiambane du guide était fausse (ragoût cuit 60 min avec guedj, yeet,
-- netetou et riz). La vraie recette de Lamine = À FROID, tamarin + kéthiakh + pagne + crevettes + yokhos + citron
-- + huile d'olive, conservée au frigo (article publié : https://seggfaye.com/blog/ndiambane-dakkar.html).
-- Les 2 slugs restent (décision du 12/08 : couvrir les 2 graphies) ; seuls name / name_wolof diffèrent.
-- À coller dans Supabase → SQL Editor → Run, puis redéployer le guide (commit vide + push : pages SSG).

UPDATE dishes SET
  subtitle = 'Mélange salé au tamarin et aux fruits de mer séchés',
  description = 'En wolof, ndiambane veut dire « mélange ». Le ndiambane dakkar du Guedjologue est la version salée, au tamarin (dakkar) et aux fruits de mer séchés des Îles du Saloum : kéthiakh, pagne, crevettes séchées et yokhos, avec du citron et un filet d''huile d''olive. Il se prépare à froid, sans cuisson, et se garde au frigo.',
  prep_time_minutes = 20,
  cook_time_minutes = NULL,  -- « 0 » s'afficherait tel quel sur la page (test {x && ...})
  servings = NULL,
  difficulty = 'Facile',
  category = 'Sauce',
  other_ingredients = ARRAY['Dakkar (tamarin), en gousses', 'Le jus d''un citron', 'Un filet d''huile d''olive'],
  steps = '[
    {"step": 1, "title": "Décortique le dakkar", "text": "Enlève la coque des gousses de tamarin pour garder la pulpe. Garde quelques gousses et des graines pour décorer."},
    {"step": 2, "title": "Kéthiakh et tamarin", "text": "Mets le kéthiakh et la pulpe de tamarin ensemble dans un grand bol."},
    {"step": 3, "title": "Les fruits de mer séchés", "text": "Rajoute le pagne, les crevettes séchées et les yokhos."},
    {"step": 4, "title": "Le citron", "text": "Presse un citron et verse le jus sur le mélange."},
    {"step": 5, "title": "Mélange, doucement", "text": "Mélange longuement à la cuillère, à froid, jusqu''à obtenir une pâte où tout se tient, avec un filet d''huile d''olive. Pas de cuisson : le ndiambane dakkar se garde ensuite au frigo."}
  ]'::jsonb,
  tips = ARRAY[
    'Sur une salade fraîche, ça change tout. Il se mange aussi en condiment, à côté d''un plat.',
    'Le ndiambane de la rue, devant les écoles, est sucré (bouye, tamarin, mangue verte) ; le ndiambane dakkar est salé.',
    'Il existe aussi un ndiambane sans tamarin : le ndiambane pagne, avec les coques séchées, l''oignon et le piment.'
  ],
  blog_url = 'https://seggfaye.com/blog/ndiambane-dakkar.html'
WHERE slug IN ('ndiambane-dakkar', 'diambane-dakkar');

-- Produits Louma de la recette : on retire guedj beurre, yeet, netetou, purée de piment ; on met les 4 de l'article.
DELETE FROM dish_products
WHERE dish_id IN (SELECT id FROM dishes WHERE slug IN ('ndiambane-dakkar', 'diambane-dakkar'));

INSERT INTO dish_products (dish_id, product_id, role, is_essential, display_order)
SELECT d.id, p.id, x.role, true, x.ord
FROM dishes d
CROSS JOIN (VALUES
  ('kethiakh', 'Fruit de mer séché', 1),
  ('pagne', 'Fruit de mer séché', 2),
  ('crevettes-sechees', 'Fruit de mer séché', 3),
  ('yoxos', 'Fruit de mer séché', 4)
) AS x(slug, role, ord)
JOIN products p ON p.slug = x.slug
WHERE d.slug IN ('ndiambane-dakkar', 'diambane-dakkar');

-- Contrôle : 2 lignes attendues, 4 produits chacune
SELECT d.slug, d.cook_time_minutes, count(dp.id) AS nb_produits
FROM dishes d LEFT JOIN dish_products dp ON dp.dish_id = d.id
WHERE d.slug IN ('ndiambane-dakkar', 'diambane-dakkar')
GROUP BY d.slug, d.cook_time_minutes;
