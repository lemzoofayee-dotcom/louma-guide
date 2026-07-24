-- Corrige la fiche "Netetou Mix" du guide.
-- Avant : decrit a tort comme un "assortiment de netetou sous plusieurs formes".
-- Reel (confirme par Lamine) : une CREATION du Guedjologue = netetou torrefie
--   + crevettes sechees + kethiakh (poisson seche), le tout en poudre, avec un peu de piment.
-- A passer sur Supabase (SQL editor).

UPDATE products
SET
  name          = 'Netetou Mix',
  name_local    = 'Netetou mixte',
  description   = 'Une creation du Guedjologue : netetou torrefie, crevettes sechees et kethiakh (poisson seche), reduits en poudre et releves d''un peu de piment. Un condiment tout-en-un, plein d''umami, pret a l''emploi.',
  origin        = 'Creation Louma by Seggfaye (Senegal)',
  taste_profile = 'Umami puissant et torrefie, avec la profondeur marine des crevettes et du kethiakh, une pointe de piment.',
  usage_advice  = 'Une cuillere dans une sauce, un riz, une marinade ou un sandwich (populaire pour le Magal) : il remplace bouillon cube et assaisonnements.'
WHERE slug = 'netetu-mix';
