-- 23/10/2026 : la fiche niankatang-diola du guide était fausse (guedj BEURRE, oignons revenus, il manquait
-- toufa, yokhos, guedj sole, gombo pilé, netetou mix, citron). Vraie recette de Lamine (validée le 23/10) =
-- article https://seggfaye.com/blog/niankatang-riz-casamance.html
-- Temps et nombre de personnes : non donnés par Lamine → mis à NULL (rien d'inventé ; NULL = non affiché).
-- À coller dans Supabase → SQL Editor → Run.

UPDATE dishes SET
  subtitle = 'Riz blanc de la Casamance, mer séchée et filet d''huile de palme rouge',
  description = 'Le niankatang, c''est le fameux riz blanc de la Casamance. Un plat léger, rapide et économique, qui ne passe pas par la friture : tout son goût vient de la mer séchée. Toufa, yokhos, pagne, crevettes séchées et guedj sole. Et à la fin, un filet d''huile de palme rouge, pure, non raffinée. En Casamance, c''est la tradition.',
  prep_time_minutes = NULL,
  cook_time_minutes = NULL,
  servings = NULL,
  other_ingredients = ARRAY['Du riz blanc', 'Du gombo (kandja)', 'Du citron vert', 'Du sel'],
  steps = '[
    {"step": 1, "title": "La mer séchée", "text": "Réhydrate le toufa, les yokhos, le pagne et les crevettes séchées, puis égoutte. Coupe le toufa en morceaux : on voit la chair, c''est là qu''on juge la qualité."},
    {"step": 2, "title": "Le guedj sole", "text": "Coupe le guedj sole en morceaux sur la planche."},
    {"step": 3, "title": "Le riz", "text": "Lave le riz à la main, jusqu''à ce que l''eau soit claire."},
    {"step": 4, "title": "Le gombo", "text": "Fais bouillir le gombo avec une pincée de sel, puis sors-le à l''écumoire."},
    {"step": 5, "title": "Le mortier", "text": "Passe le gombo au mortier et pile-le à la main, jusqu''à obtenir une purée verte."},
    {"step": 6, "title": "La cuisson du riz", "text": "Fais cuire le riz."},
    {"step": 7, "title": "La vapeur", "text": "Pose la mer séchée sur le riz pour qu''elle cuise à la vapeur. Pas de friture : c''est la mer qui donne le goût."},
    {"step": 8, "title": "Le dressage", "text": "Sers le riz, pose le guedj sole, ajoute le netetou mix, la purée de gombo et le citron vert. Termine par un filet d''huile de palme rouge pure, versé cru, à la fin."}
  ]'::jsonb,
  tips = ARRAY[
    'Ne pas confondre avec le mbakhalou Saloum : le niankatang n''a pas de poudre d''arachide.',
    'L''huile de palme rouge ne sert pas à cuire : un filet, cru, au dressage. Elle doit être pure, non raffinée.',
    'On le mange à la main ou à la cuillère.'
  ],
  blog_url = 'https://seggfaye.com/blog/niankatang-riz-casamance.html'
WHERE slug = 'niankatang-diola';

-- Produits Louma : on retire tout (dont le guedj beurre) et on met ceux de la recette.
DELETE FROM dish_products WHERE dish_id = (SELECT id FROM dishes WHERE slug = 'niankatang-diola');

INSERT INTO dish_products (dish_id, product_id, role, is_essential, display_order)
SELECT d.id, p.id, x.role, x.ess, x.ord
FROM dishes d
CROSS JOIN (VALUES
  ('tuffa', 'Fruit de mer séché', true, 1),
  ('yoxos', 'Fruit de mer séché', true, 2),
  ('pagne', 'Fruit de mer séché', true, 3),
  ('crevettes-sechees', 'Fruit de mer séché', true, 4),
  ('guej-sol', 'Guedj', true, 5),
  ('diwtir-pure', 'Huile de palme rouge (un filet, à la fin)', true, 6),
  ('netetu-mix', 'Au dressage', true, 7),
  ('beugeuc-feuille-bissap', 'Au dressage', false, 8)
) AS x(slug, role, ess, ord)
JOIN products p ON p.slug = x.slug
WHERE d.slug = 'niankatang-diola';

-- Contrôle : 1 ligne, 8 produits, blog_url rempli
SELECT d.slug, d.blog_url, count(dp.id) AS nb_produits
FROM dishes d LEFT JOIN dish_products dp ON dp.dish_id = d.id
WHERE d.slug = 'niankatang-diola' GROUP BY d.slug, d.blog_url;
