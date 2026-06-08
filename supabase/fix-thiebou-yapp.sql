-- Harmonisation : "Ceebu Yapp" -> "Thiebou Yapp" (Thiebou en principal, Ceebu en phonetique via name_wolof).
-- Le slug 'ceebu-yapp' reste inchange (ne pas casser les URLs / le SEO).
-- A executer une fois dans Supabase > SQL Editor.

update dishes
set name        = 'Thiebou Yapp',
    description  = 'Le thiebou yapp (ceebu yapp) est la version viande du thieboudienne : du riz cuit dans une sauce tomate avec de la viande (boeuf ou agneau) et des legumes. Moins connu que le thieboudienne mais tout aussi delicieux.'
where slug = 'ceebu-yapp';
