export interface Category {
  id: string;
  slug: string;
  name: string;
  emoji: string;
  display_order: number;
}

export interface Product {
  id: string;
  slug: string;
  name: string;
  name_local: string | null;
  category_id: string;
  price: number;
  price_unit: string;
  price_old: number | null;
  badge: string | null;
  description: string;
  origin: string | null;
  taste_profile: string | null;
  usage_advice: string | null;
  image_main: string;
  image_gallery: string[] | null;
  in_stock: boolean;
  seggfaye_url: string;
}

export interface Dish {
  id: string;
  slug: string;
  name: string;
  name_wolof: string | null;
  subtitle: string | null;
  emoji: string;
  description: string;
  image_url: string | null;
  prep_time_minutes: number | null;
  cook_time_minutes: number | null;
  servings: string | null;
  difficulty: string | null;
  category: string;
  other_ingredients: string[];
  steps: DishStep[];
  tips: string[];
  blog_url: string | null;
  is_featured: boolean;
}

export interface DishStep {
  step: number;
  title: string;
  text: string;
}

export interface DishProduct {
  id: string;
  dish_id: string;
  product_id: string;
  role: string;
  quantity: string | null;
  is_essential: boolean;
  is_substitute: boolean;
  display_order: number;
  expert_note: string | null;
  product?: Product;
  dish?: Dish;
}

export interface Database {
  public: {
    Tables: {
      categories: {
        Row: Category;
      };
      products: {
        Row: Product;
      };
      dishes: {
        Row: Dish;
      };
      dish_products: {
        Row: DishProduct;
      };
      related_dishes: {
        Row: { dish_id: string; related_dish_id: string };
      };
    };
  };
}
