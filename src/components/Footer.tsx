import Link from "next/link";

export default function Footer() {
  return (
    <footer className="border-t border-border py-8 px-5 md:px-8 text-center mb-[72px] md:mb-0">
      <div className="max-w-4xl mx-auto">
        <div className="flex items-center justify-center gap-6 mb-4">
          <Link href="/plats" className="text-[0.75rem] font-bold tracking-[0.1em] uppercase text-muted hover:text-cream transition-colors">
            Plats
          </Link>
          <Link href="/produits" className="text-[0.75rem] font-bold tracking-[0.1em] uppercase text-muted hover:text-cream transition-colors">
            Produits
          </Link>
          <a
            href="https://seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="text-[0.75rem] font-bold tracking-[0.1em] uppercase text-muted hover:text-cream transition-colors"
          >
            Boutique
          </a>
          <a
            href="https://www.tiktok.com/@seggfaye"
            target="_blank"
            rel="noopener noreferrer"
            className="text-[0.75rem] font-bold tracking-[0.1em] uppercase text-muted hover:text-cream transition-colors"
          >
            TikTok
          </a>
        </div>
        <p className="text-[0.72rem] text-muted/60">
          Propulse par{" "}
          <a
            href="https://seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="text-gold hover:text-[#e0c070] transition-colors"
          >
            Louma by Seggfaye
          </a>
        </p>
      </div>
    </footer>
  );
}
