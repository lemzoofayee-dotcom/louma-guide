-- 20/10/2026 : retire " 3x le prix " (faux depuis le prix du 17/10 : Casamance 40 EUR/kg < guedj beurre 50 EUR/kg)
-- SQL 100 % ASCII (accents en echappement U&) : a coller dans le SQL Editor de Supabase
UPDATE products SET taste_profile = U&'Le fumage au bois casaman\00e7ais apporte une dimension fum\00e9e unique. C''est la version premium du Guedj Beurre, au go\00fbt incomparable.' WHERE slug = 'guej-beur-casamance';
