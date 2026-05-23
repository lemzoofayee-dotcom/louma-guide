import Link from "next/link";
import Image from "next/image";
import type { Dish } from "@/types/database";

export default function DishCard({ dish }: { dish: Dish }) {
  return (
    <Link
      href={`/plats/${dish.slug}`}
      className="group block rounded-[var(--radius-lg)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.07),rgba(255,255,255,.02))] overflow-hidden transition-all duration-300 ease-[cubic-bezier(0.34,1.56,0.64,1)] hover:-translate-y-2 hover:border-border-highlight hover:shadow-[0_20px_60px_rgba(201,168,76,.15)]"
    >
      {dish.image_url ? (
        <div className="relative aspect-[4/3] overflow-hidden">
          <Image
            src={dish.image_url.startsWith('/') ? dish.image_url : `https://www.seggfaye.com/${dish.image_url}`}
            alt={dish.name}
            fill
            className="object-cover transition-transform duration-500 group-hover:scale-105"
            sizes="(max-width: 768px) 50vw, 33vw"
          />
        </div>
      ) : (
        <div className="flex items-center justify-center pt-4 pb-2">
          <span className="text-[2.4rem]">{dish.emoji}</span>
        </div>
      )}
      <div className="p-3.5 text-center">
        <h3 className="font-[family-name:var(--font-heading)] text-[0.95rem] font-bold text-cream group-hover:text-gold transition-colors">
          {dish.name}
        </h3>
        {dish.name_wolof && (
          <p className="text-[0.78rem] text-gold italic mb-1">{dish.name_wolof}</p>
        )}
        <p className="text-[0.72rem] text-muted mb-2.5 line-clamp-2 leading-relaxed">
          {dish.subtitle}
        </p>
        <span className="inline-flex items-center bg-[rgba(201,168,76,0.12)] border border-border rounded-full px-2.5 py-0.5 text-[0.65rem] font-bold text-gold">
          {dish.difficulty ?? "Plat"}
        </span>
      </div>
    </Link>
  );
}
