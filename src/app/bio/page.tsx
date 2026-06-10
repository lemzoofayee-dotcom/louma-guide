import Link from "next/link";
import type { Metadata } from "next";
import { getDishes } from "@/lib/queries";

export const metadata: Metadata = {
  title: "Liens — Louma by Seggfaye",
  description:
    "Tous les liens Louma by Seggfaye : recettes senegalaises, produits (guedj, netetou, yeet) et boutique.",
  alternates: { canonical: "https://guide.seggfaye.com/bio" },
};

export default async function BioPage() {
  const dishes = await getDishes();

  return (
    <main className="min-h-dvh flex flex-col items-center px-5 py-12 bg-[radial-gradient(ellipse_80%_45%_at_50%_0%,rgba(201,168,76,0.12),transparent)]">
      <div className="w-full max-w-[440px] flex flex-col items-center">
        {/* Header */}
        <h1 className="font-[family-name:var(--font-heading)] text-[2.1rem] font-black text-cream text-center leading-[1.1]">
          Louma <em className="text-gold italic font-[family-name:var(--font-heading)]">by Seggfaye</em>
        </h1>
        <p className="text-muted text-[0.85rem] text-center mt-2 mb-8">
          Le Guedjologue — produits & recettes du Senegal 🇸🇳
        </p>

        {/* CTAs principaux */}
        <div className="w-full flex flex-col gap-3 mb-9">
          <a
            href="https://seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] bg-gold text-bg font-bold text-[0.95rem] px-4 py-4 hover:bg-[#e0c070] transition-colors"
          >
            🛒 Commander sur la boutique
          </a>
          <a
            href="https://wa.me/33652650395"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] border border-[#25D366]/50 text-cream font-semibold text-[0.9rem] px-4 py-3.5 hover:bg-surface transition-colors"
          >
            💬 WhatsApp <span className="text-[#25D366] font-bold">+33 6 52 65 03 95</span>
          </a>
          <a
            href="https://www.tiktok.com/@seggfaye"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] border border-border-highlight text-cream font-semibold text-[0.9rem] px-4 py-3.5 hover:bg-surface transition-colors"
          >
            ▶️ TikTok @seggfaye
          </a>
          <Link
            href="/produits"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] border border-border-highlight text-cream font-semibold text-[0.9rem] px-4 py-3.5 hover:bg-surface transition-colors"
          >
            🐟 Tous les produits
          </Link>
        </div>

        {/* Recettes */}
        <p className="text-[0.7rem] font-bold tracking-[0.15em] uppercase text-gold/80 self-start mb-3">
          Recettes — quel produit pour quel plat
        </p>
        <div className="w-full flex flex-col gap-2.5">
          {dishes.map((dish) => (
            <Link
              key={dish.id}
              href={`/plats/${dish.slug}`}
              className="flex items-center gap-3 w-full rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] px-4 py-3.5 hover:border-border-highlight transition-colors"
            >
              <span className="text-[1.3rem] shrink-0">{dish.emoji}</span>
              <span className="font-semibold text-cream text-[0.92rem]">
                {dish.name}
              </span>
              <span className="ml-auto text-muted">→</span>
            </Link>
          ))}
        </div>

        <p className="text-[0.7rem] text-muted/60 mt-10 text-center">
          guide.seggfaye.com
        </p>
      </div>
    </main>
  );
}
