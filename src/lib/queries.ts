import { supabase } from "./supabase";
import type { Category, Dish, DishProduct, Product } from "@/types/database";

export async function getCategories(): Promise<Category[]> {
  const { data } = await supabase
    .from("categories")
    .select("*")
    .order("display_order");
  return (data as Category[]) ?? [];
}

export async function getProducts(): Promise<Product[]> {
  const { data } = await supabase.from("products").select("*").order("name");
  return (data as Product[]) ?? [];
}

export async function getProductBySlug(
  slug: string
): Promise<Product | null> {
  const { data } = await supabase
    .from("products")
    .select("*")
    .eq("slug", slug)
    .single();
  return data as Product | null;
}

export async function getProductsByCategory(
  categorySlug: string
): Promise<Product[]> {
  const { data: cat } = await supabase
    .from("categories")
    .select("id")
    .eq("slug", categorySlug)
    .single();
  if (!cat) return [];
  const { data } = await supabase
    .from("products")
    .select("*")
    .eq("category_id", (cat as { id: string }).id)
    .order("name");
  return (data as Product[]) ?? [];
}

export async function getDishes(): Promise<Dish[]> {
  const { data } = await supabase.from("dishes").select("*").order("name");
  return (data as Dish[]) ?? [];
}

export async function getFeaturedDishes(): Promise<Dish[]> {
  const { data } = await supabase
    .from("dishes")
    .select("*")
    .eq("is_featured", true)
    .order("name");
  return (data as Dish[]) ?? [];
}

export async function getDishBySlug(slug: string): Promise<Dish | null> {
  const { data } = await supabase
    .from("dishes")
    .select("*")
    .eq("slug", slug)
    .single();
  return data as Dish | null;
}

export async function getDishProducts(
  dishId: string
): Promise<(DishProduct & { product: Product })[]> {
  const { data } = await supabase
    .from("dish_products")
    .select("*, product:products(*)")
    .eq("dish_id", dishId)
    .order("display_order");
  return (data as (DishProduct & { product: Product })[]) ?? [];
}

export async function getProductDishes(
  productId: string
): Promise<(DishProduct & { dish: Dish })[]> {
  const { data } = await supabase
    .from("dish_products")
    .select("*, dish:dishes(*)")
    .eq("product_id", productId)
    .order("display_order");
  return (data as (DishProduct & { dish: Dish })[]) ?? [];
}

export async function getRelatedDishes(dishId: string): Promise<Dish[]> {
  const { data } = await supabase
    .from("related_dishes")
    .select("related_dish:dishes!related_dishes_related_dish_id_fkey(*)")
    .eq("dish_id", dishId);
  if (!data) return [];
  return (data as unknown as { related_dish: Dish }[]).map((r) => r.related_dish);
}

export async function getAllSlugs(
  table: "dishes" | "products"
): Promise<string[]> {
  const { data } = await supabase.from(table).select("slug");
  return ((data as { slug: string }[]) ?? []).map((r) => r.slug);
}
