"use client";

import { useState, useMemo } from "react";
import { useSearchParams } from "next/navigation";
import DishCard from "@/components/DishCard";
import ProductCard from "@/components/ProductCard";
import type { Dish, Product } from "@/types/database";

function normalize(str: string): string {
  return str
    .toLowerCase()
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "");
}

function matches(item: string, query: string): boolean {
  return normalize(item).includes(normalize(query));
}

export default function SearchClient({
  dishes,
  products,
}: {
  dishes: Dish[];
  products: Product[];
}) {
  const searchParams = useSearchParams();
  const initialQuery = searchParams.get("q") ?? "";
  const [query, setQuery] = useState(initialQuery);

  const filteredDishes = useMemo(() => {
    if (!query.trim()) return [];
    return dishes.filter(
      (d) =>
        matches(d.name, query) ||
        matches(d.name_wolof ?? "", query) ||
        matches(d.subtitle ?? "", query) ||
        matches(d.description, query)
    );
  }, [query, dishes]);

  const filteredProducts = useMemo(() => {
    if (!query.trim()) return [];
    return products.filter(
      (p) =>
        matches(p.name, query) ||
        matches(p.name_local ?? "", query) ||
        matches(p.description, query)
    );
  }, [query, products]);

  const hasResults = filteredDishes.length > 0 || filteredProducts.length > 0;

  return (
    <>
      <div className="mb-8">
        <div className="relative max-w-xl mx-auto">
          <span className="absolute left-4 top-1/2 -translate-y-1/2 text-gold pointer-events-none">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <circle cx="11" cy="11" r="8" />
              <path d="m21 21-4.35-4.35" />
            </svg>
          </span>
          <input
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Rechercher un plat ou un produit..."
            className="w-full bg-[linear-gradient(145deg,rgba(255,255,255,0.06),rgba(255,255,255,0.02))] border-[1.5px] border-border rounded-full pl-12 pr-12 py-3.5 text-cream text-[0.95rem] font-[family-name:var(--font-body)] outline-none transition-colors focus:border-border-highlight placeholder:text-muted"
            autoFocus
          />
          {query && (
            <button
              onClick={() => setQuery("")}
              className="absolute right-4 top-1/2 -translate-y-1/2 text-muted hover:text-cream transition-colors text-lg"
            >
              &times;
            </button>
          )}
        </div>
      </div>

      {query.trim() && !hasResults && (
        <div className="text-center py-16">
          <div className="w-16 h-16 rounded-full bg-[rgba(201,168,76,0.1)] flex items-center justify-center mx-auto mb-4">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="text-gold">
              <circle cx="11" cy="11" r="8" />
              <path d="m21 21-4.35-4.35" />
            </svg>
          </div>
          <p className="text-[0.9rem] text-muted">
            Aucun resultat pour &laquo;{" "}
            <span className="text-cream font-bold">{query}</span> &raquo;
          </p>
          <p className="text-[0.78rem] text-muted/60 mt-2">
            Essayez : thieboudienne, guedj, netetou, mafe...
          </p>
        </div>
      )}

      {filteredDishes.length > 0 && (
        <section className="mb-10">
          <div className="flex items-center gap-2 text-[0.7rem] font-bold tracking-[0.18em] uppercase text-gold mb-4">
            Plats ({filteredDishes.length})
            <span className="flex-1 h-px bg-[linear-gradient(90deg,var(--color-border),transparent)]" />
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
            {filteredDishes.map((dish) => (
              <DishCard key={dish.id} dish={dish} />
            ))}
          </div>
        </section>
      )}

      {filteredProducts.length > 0 && (
        <section className="mb-10">
          <div className="flex items-center gap-2 text-[0.7rem] font-bold tracking-[0.18em] uppercase text-gold mb-4">
            Produits ({filteredProducts.length})
            <span className="flex-1 h-px bg-[linear-gradient(90deg,var(--color-border),transparent)]" />
          </div>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
            {filteredProducts.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
        </section>
      )}

      {!query.trim() && (
        <div className="text-center py-16">
          <div className="w-16 h-16 rounded-full bg-[rgba(201,168,76,0.1)] flex items-center justify-center mx-auto mb-4">
            <span className="text-[1.5rem]">🍛</span>
          </div>
          <p className="text-[0.85rem] text-muted">
            Tapez le nom d&apos;un plat ou d&apos;un produit pour commencer
          </p>
        </div>
      )}
    </>
  );
}
