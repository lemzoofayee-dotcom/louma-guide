import Link from "next/link";
import Image from "next/image";
import type { Product } from "@/types/database";

export default function ProductCard({ product }: { product: Product }) {
  return (
    <Link
      href={`/produits/${product.slug}`}
      className="group block rounded-[var(--radius-lg)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.07),rgba(255,255,255,.02))] overflow-hidden transition-all duration-300 ease-[cubic-bezier(0.34,1.56,0.64,1)] hover:-translate-y-2 hover:border-border-highlight hover:shadow-[0_12px_40px_rgba(201,168,76,.1)]"
    >
      <div className="relative aspect-square bg-surface overflow-hidden">
        <Image
          src={`https://www.seggfaye.com/${product.image_main}`}
          alt={product.name}
          fill
          className="object-cover transition-transform duration-500 group-hover:scale-105"
          sizes="(max-width: 768px) 50vw, 25vw"
        />
        {product.badge && (
          <span className="absolute top-3 left-3 text-[10px] font-bold tracking-[0.12em] uppercase bg-gold text-bg px-2.5 py-1 rounded-full">
            {product.badge}
          </span>
        )}
      </div>
      <div className="p-3.5">
        <h3 className="font-[family-name:var(--font-heading)] text-[0.9rem] font-bold text-cream group-hover:text-gold transition-colors">
          {product.name}
        </h3>
        {product.name_local && product.name_local !== product.name && (
          <p className="text-[0.7rem] text-gold/70 italic">{product.name_local}</p>
        )}
        <div className="flex items-baseline gap-2 mt-2">
          <span className="text-gold font-bold text-[0.85rem]">
            {product.price.toFixed(2).replace(".", ",")} &euro;
          </span>
          <span className="text-[0.7rem] text-muted">{product.price_unit}</span>
          {product.price_old && (
            <span className="text-[0.7rem] text-muted line-through">
              {product.price_old.toFixed(2).replace(".", ",")} &euro;
            </span>
          )}
        </div>
      </div>
    </Link>
  );
}
