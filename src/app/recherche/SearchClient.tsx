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

const ALIASES: Record<string, string[]> = {
  "thieboudienne": ["tiep", "tiep bou dien", "tchep", "tcheb", "ceebu jen", "ceebu jenn", "thieboudienn", "thieboudiene", "thieboudiène", "tieboudienne", "riz au poisson", "thieb"],
  "ceebu-yapp": ["ceeb u yapp", "thieb yapp", "tiep yapp", "riz viande", "tcheb yapp"],
  "yassa-poulet": ["yassa", "yassa ginaar", "poulet yassa"],
  "mafe": ["mafé", "maffé", "maafe", "tigadegue", "tigadègue", "sauce arachide"],
  "soupoukandja": ["soupou kandja", "soupe kandja", "soupou kandia", "soup kandia", "soupe gombo"],
  "domoda": ["domada", "domodah"],
  "caldou": ["kaldou", "caldou poisson", "kaldou jen"],
  "thiakry": ["thiakri", "tiakri", "tiakry", "cere", "chakery", "tchakri", "degue"],
  "fonde": ["fondé", "fonde mil", "bouillie mil"],
  "thiere-mboum": ["tiere mboum", "thiere mbeum", "couscous mil sauce feuilles"],
  "ndiambane-dakkar": ["diambane", "ndiambane", "diambane dakar", "ndiambane dakar"],
  "mbakhalou-saloum": ["mbakhalou", "mbaxalou", "mbakalu", "mbakhalou saloum"],
  "basse-sale": ["bassé salé", "basse sale", "bassi sale", "bassi salé", "couscous mil sale"],
  "lakh": ["laax", "lax", "bouillie lakh"],
  "ndambe": ["ndambé", "ndambe niebe", "sandwich ndambe"],
  "sombi": ["sombie", "riz au lait senegalais"],
  "pastels": ["pastel", "pastel poisson", "beignets farcis"],
  "fataya": ["fataia", "chausson frit"],
  "accara": ["akara", "akkara", "beignets niebe"],
  "dibi": ["diby", "viande grille senegalaise", "braise"],
  "thiou": ["tiou", "sauce thiou"],
  "firire": ["frire", "poisson frit"],
  "bissap-jus": ["bissap", "hibiscus", "jus bissap", "foléré"],
  "bouye-jus": ["bouye", "baobab", "jus bouye", "jus baobab", "pain de singe"],
  "chere": ["céré", "cere", "thiakry lait"],
  "guedj": ["guej", "gejj", "guedji", "poisson seche", "poisson fermente"],
  "netetou": ["netetu", "netetou", "soumbala", "dawadawa", "iru woro", "iru", "soumbara"],
  "yeet": ["yet", "yete", "mollusque fermente"],
  "crevettes": ["crevettes sechees", "cipakh", "cipax"],
  "kethiakh": ["kethiakh", "kethiak", "ketiak", "poisson seche sale"],
  "diwtir": ["diw tir", "huile rouge", "huile palme"],
  "thiakry-produit": ["thiakry", "thiakri", "ciakri", "couscous mil"],
  "bissap": ["bissap rouge", "hibiscus", "karkade"],
  "niebe": ["niébé", "niebe", "haricots niebe", "black eyed peas"],
};

function getAliases(slug: string): string[] {
  return ALIASES[slug] || [];
}

function matchesWithAliases(item: { name: string; name_wolof?: string | null; subtitle?: string | null; description: string; slug: string }, query: string): boolean {
  const q = normalize(query);
  if (normalize(item.name).includes(q)) return true;
  if (item.name_wolof && normalize(item.name_wolof).includes(q)) return true;
  if (item.subtitle && normalize(item.subtitle).includes(q)) return true;
  if (normalize(item.description).includes(q)) return true;
  const aliases = getAliases(item.slug);
  return aliases.some((alias) => normalize(alias).includes(q) || q.includes(normalize(alias)));
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
    return dishes.filter((d) =>
      matchesWithAliases(
        { name: d.name, name_wolof: d.name_wolof, subtitle: d.subtitle, description: d.description, slug: d.slug },
        query
      )
    );
  }, [query, dishes]);

  const filteredProducts = useMemo(() => {
    if (!query.trim()) return [];
    return products.filter((p) =>
      matchesWithAliases(
        { name: p.name, name_wolof: p.name_local, subtitle: null, description: p.description, slug: p.slug },
        query
      )
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
