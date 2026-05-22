-- Louma Guide - Schema Supabase
-- Execute ce script dans le SQL Editor de Supabase

-- Categories de produits
CREATE TABLE categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  emoji TEXT NOT NULL DEFAULT '',
  display_order INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Produits (migres depuis produits.js de seggfaye.com)
CREATE TABLE products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  name_local TEXT,
  category_id UUID REFERENCES categories(id),
  price DECIMAL(10,2) NOT NULL,
  price_unit TEXT NOT NULL DEFAULT 'par 100g',
  price_old DECIMAL(10,2),
  badge TEXT,
  description TEXT NOT NULL,
  origin TEXT,
  taste_profile TEXT,
  usage_advice TEXT,
  image_main TEXT NOT NULL,
  image_gallery TEXT[],
  in_stock BOOLEAN DEFAULT true,
  seggfaye_url TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Plats senegalais
CREATE TABLE dishes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  name_wolof TEXT,
  subtitle TEXT,
  emoji TEXT NOT NULL DEFAULT '',
  description TEXT NOT NULL,
  image_url TEXT,
  prep_time_minutes INT,
  cook_time_minutes INT,
  servings TEXT,
  difficulty TEXT,
  category TEXT NOT NULL DEFAULT 'Plat principal',
  other_ingredients TEXT[] DEFAULT '{}',
  steps JSONB DEFAULT '[]',
  tips TEXT[] DEFAULT '{}',
  blog_url TEXT,
  is_featured BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Table de jonction produit-plat
CREATE TABLE dish_products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  dish_id UUID REFERENCES dishes(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  role TEXT NOT NULL,
  quantity TEXT,
  is_essential BOOLEAN DEFAULT true,
  is_substitute BOOLEAN DEFAULT false,
  display_order INT DEFAULT 0,
  expert_note TEXT,
  UNIQUE(dish_id, product_id)
);

-- Plats similaires
CREATE TABLE related_dishes (
  dish_id UUID REFERENCES dishes(id) ON DELETE CASCADE,
  related_dish_id UUID REFERENCES dishes(id) ON DELETE CASCADE,
  PRIMARY KEY (dish_id, related_dish_id)
);

-- Index pour les recherches frequentes
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_slug ON products(slug);
CREATE INDEX idx_dishes_slug ON dishes(slug);
CREATE INDEX idx_dishes_featured ON dishes(is_featured) WHERE is_featured = true;
CREATE INDEX idx_dish_products_dish ON dish_products(dish_id);
CREATE INDEX idx_dish_products_product ON dish_products(product_id);

-- RLS : lecture publique uniquement
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE dishes ENABLE ROW LEVEL SECURITY;
ALTER TABLE dish_products ENABLE ROW LEVEL SECURITY;
ALTER TABLE related_dishes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read" ON categories FOR SELECT USING (true);
CREATE POLICY "Public read" ON products FOR SELECT USING (true);
CREATE POLICY "Public read" ON dishes FOR SELECT USING (true);
CREATE POLICY "Public read" ON dish_products FOR SELECT USING (true);
CREATE POLICY "Public read" ON related_dishes FOR SELECT USING (true);
