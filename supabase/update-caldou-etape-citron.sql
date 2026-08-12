-- Caldou : enrichit l'étape 4 (Assaisonner) avec la nuance de Lamine sur le citron
-- (jus dans la sauce en standard, OU en option faire mariner le poisson dedans).
UPDATE dishes
SET steps = jsonb_set(steps, '{3,text}',
  '"Ajouter le jus de citron vert dans la sauce en fin de cuisson, avec le persil et la ciboulette. Option : on peut aussi faire mariner le poisson dans le jus de citron avant de le cuire."')
WHERE slug = 'caldou';
