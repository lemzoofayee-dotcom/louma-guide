import Link from "next/link";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Liens — Louma by Seggfaye",
  description:
    "Tous les liens Louma by Seggfaye : guide des plats senegalais, boutique (guedj, netetou, yeet) et commande WhatsApp.",
  alternates: { canonical: "https://guide.seggfaye.com/bio" },
};

export default function BioPage() {
  return (
    <main className="min-h-dvh flex flex-col items-center justify-center px-5 py-12 bg-[radial-gradient(ellipse_80%_45%_at_50%_0%,rgba(201,168,76,0.12),transparent)]">
      <div className="w-full max-w-[440px] flex flex-col items-center">
        {/* Logo */}
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src="/logo.webp"
          alt="Louma by Seggfaye"
          width={110}
          height={110}
          className="rounded-full border-2 border-gold/40 shadow-[0_0_50px_rgba(201,168,76,0.18)] mb-5"
        />

        {/* Header */}
        <h1 className="font-[family-name:var(--font-heading)] text-[2.1rem] font-black text-cream text-center leading-[1.1]">
          Louma <em className="text-gold italic font-[family-name:var(--font-heading)]">by Seggfaye</em>
        </h1>
        <p className="text-muted text-[0.85rem] text-center mt-2 mb-9">
          Le Guedjologue — produits & recettes du Senegal 🇸🇳
        </p>

        {/* CTAs */}
        <div className="w-full flex flex-col gap-3">
          <Link
            href="/"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] bg-gold text-bg font-bold text-[0.95rem] px-4 py-4 hover:bg-[#e0c070] transition-colors"
          >
            📖 Le guide des plats
          </Link>
          <a
            href="https://seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] border border-border-highlight text-cream font-semibold text-[0.95rem] px-4 py-4 hover:bg-surface transition-colors"
          >
            🛒 La boutique — seggfaye.com
          </a>
          <a
            href="https://wa.me/33652650395"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-center gap-2 w-full rounded-[var(--radius-md)] border border-[#25D366]/50 text-cream font-semibold text-[0.95rem] px-4 py-4 hover:bg-surface transition-colors"
          >
            💬 WhatsApp <span className="text-[#25D366] font-bold">+33 6 52 65 03 95</span>
          </a>
        </div>

        <p className="text-[0.7rem] text-muted/60 mt-10 text-center">
          guide.seggfaye.com
        </p>
      </div>
    </main>
  );
}
