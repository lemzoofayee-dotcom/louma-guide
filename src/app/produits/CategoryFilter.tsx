"use client";

import { useState } from "react";
import ProductCard from "@/components/ProductCard";
import type { Category, Product } from "@/types/database";

export default function CategoryFilter({
  categories,
  products,
}: {
  categories: Category[];
  products: Product[];
}) {
  const [active, setActive] = useState<string | null>(null);

  const filtered = active
    ? products.filter((p) => p.category_id === active)
    : products;

  return (
    <>
      <div className="flex flex-wrap gap-2 mb-6">
        <button
          onClick={() => setActive(null)}
          className={`text-[0.7rem] font-bold tracking-[0.1em] uppercase px-4 py-2 rounded-full border transition-all ${
            active === null
              ? "bg-gold text-bg border-gold shadow-[0_4px_20px_rgba(201,168,76,0.25)]"
              : "bg-transparent text-muted border-border hover:border-[rgba(201,168,76,.35)] hover:text-gold"
          }`}
        >
          Tous
        </button>
        {categories.map((cat) => (
          <button
            key={cat.id}
            onClick={() => setActive(cat.id)}
            className={`text-[0.7rem] font-bold tracking-[0.1em] uppercase px-4 py-2 rounded-full border transition-all ${
              active === cat.id
                ? "bg-gold text-bg border-gold shadow-[0_4px_20px_rgba(201,168,76,0.25)]"
                : "bg-transparent text-muted border-border hover:border-[rgba(201,168,76,.35)] hover:text-gold"
            }`}
          >
            {cat.emoji} {cat.name}
          </button>
        ))}
      </div>

      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
        {filtered.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </div>

      {filtered.length === 0 && (
        <p className="text-center text-muted py-20">Aucun produit trouve.</p>
      )}
    </>
  );
}
