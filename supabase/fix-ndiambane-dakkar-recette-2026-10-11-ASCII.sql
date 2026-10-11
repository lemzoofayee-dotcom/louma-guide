-- 11/10/2026 : la recette des 2 fiches ndiambane du guide etait fausse (ragout cuit 60 min avec guedj, yeet,
-- netetou et riz). La vraie recette de Lamine = A FROID, tamarin + kethiakh + pagne + crevettes + yokhos + citron
-- + huile d'olive, conservee au frigo (article publie : https://seggfaye.com/blog/ndiambane-dakkar.html).
-- Les 2 slugs restent (decision du 12/08 : couvrir les 2 graphies) ; seuls name / name_wolof different.
-- A coller dans Supabase  SQL Editor  Run, puis redeployer le guide (commit vide + push : pages SSG).

UPDATE dishes SET
  subtitle = U&'M\00E9lange sal\00E9 au tamarin et aux fruits de mer s\00E9ch\00E9s',
  description = U&'En wolof, ndiambane veut dire \00AB m\00E9lange \00BB. Le ndiambane dakkar du Guedjologue est la version sal\00E9e, au tamarin (dakkar) et aux fruits de mer s\00E9ch\00E9s des \00CEles du Saloum : k\00E9thiakh, pagne, crevettes s\00E9ch\00E9es et yokhos, avec du citron et un filet d''huile d''olive. Il se pr\00E9pare \00E0 froid, sans cuisson, et se garde au frigo.',
  prep_time_minutes = 20,
  cook_time_minutes = NULL,  --  0  s'afficherait tel quel sur la page (test {x && ...})
  servings = NULL,
  difficulty = 'Facile',
  category = 'Sauce',
  other_ingredients = ARRAY['Dakkar (tamarin), en gousses', 'Le jus d''un citron', 'Un filet d''huile d''olive'],
  steps = U&'[
    {"step": 1, "title": "D\00E9cortique le dakkar", "text": "Enl\00E8ve la coque des gousses de tamarin pour garder la pulpe. Garde quelques gousses et des graines pour d\00E9corer."},
    {"step": 2, "title": "K\00E9thiakh et tamarin", "text": "Mets le k\00E9thiakh et la pulpe de tamarin ensemble dans un grand bol."},
    {"step": 3, "title": "Les fruits de mer s\00E9ch\00E9s", "text": "Rajoute le pagne, les crevettes s\00E9ch\00E9es et les yokhos."},
    {"step": 4, "title": "Le citron", "text": "Presse un citron et verse le jus sur le m\00E9lange."},
    {"step": 5, "title": "M\00E9lange, doucement", "text": "M\00E9lange longuement \00E0 la cuill\00E8re, \00E0 froid, jusqu''\00E0 obtenir une p\00E2te o\00F9 tout se tient, avec un filet d''huile d''olive. Pas de cuisson : le ndiambane dakkar se garde ensuite au frigo."}
  ]'::jsonb,
  tips = ARRAY[
    U&'Sur une salade fra\00EEche, \00E7a change tout. Il se mange aussi en condiment, \00E0 c\00F4t\00E9 d''un plat.',
    U&'Le ndiambane de la rue, devant les \00E9coles, est sucr\00E9 (bouye, tamarin, mangue verte) ; le ndiambane dakkar est sal\00E9.',
    U&'Il existe aussi un ndiambane sans tamarin : le ndiambane pagne, avec les coques s\00E9ch\00E9es, l''oignon et le piment.'
  ],
  blog_url = 'https://seggfaye.com/blog/ndiambane-dakkar.html'
WHERE slug IN ('ndiambane-dakkar', 'diambane-dakkar');

-- Produits Louma de la recette : on retire guedj beurre, yeet, netetou, puree de piment ; on met les 4 de l'article.
DELETE FROM dish_products
WHERE dish_id IN (SELECT id FROM dishes WHERE slug IN ('ndiambane-dakkar', 'diambane-dakkar'));

INSERT INTO dish_products (dish_id, product_id, role, is_essential, display_order)
SELECT d.id, p.id, x.role, true, x.ord
FROM dishes d
CROSS JOIN (VALUES
  ('kethiakh', U&'Fruit de mer s\00E9ch\00E9', 1),
  ('pagne', U&'Fruit de mer s\00E9ch\00E9', 2),
  ('crevettes-sechees', U&'Fruit de mer s\00E9ch\00E9', 3),
  ('yoxos', U&'Fruit de mer s\00E9ch\00E9', 4)
) AS x(slug, role, ord)
JOIN products p ON p.slug = x.slug
WHERE d.slug IN ('ndiambane-dakkar', 'diambane-dakkar');

-- Controle : 2 lignes attendues, 4 produits chacune
SELECT d.slug, d.cook_time_minutes, count(dp.id) AS nb_produits
FROM dishes d LEFT JOIN dish_products dp ON dp.dish_id = d.id
WHERE d.slug IN ('ndiambane-dakkar', 'diambane-dakkar')
GROUP BY d.slug, d.cook_time_minutes;
