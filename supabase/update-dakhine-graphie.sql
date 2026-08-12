-- Graphies alternatives wolof (validées Lamine + confrontées au net, 12/08/2026).
-- Le gabarit du guide ajoute name_wolof entre parenthèses dans le titre → couvre les 2
-- orthographes en SEO ("ratisser large").
-- À exécuter dans Supabase > SQL Editor (chaque UPDATE = "1 row").

-- Dakhine : riz + pâte d'arachide + viande. Variante = Deukine (net : deukhine/deukine).
UPDATE dishes SET name_wolof = 'Deukine' WHERE slug = 'dakhine';

-- Caldou : sauce légère poisson frais + guedj (Casamance). Variante SEO n°1 = Kaldou (K).
UPDATE dishes SET name_wolof = 'Kaldou' WHERE slug = 'caldou';

-- Vérif :
-- SELECT slug, name, name_wolof FROM dishes WHERE slug IN ('dakhine','caldou');
