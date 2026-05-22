"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const NAV_ITEMS = [
  { href: "/", label: "Accueil", key: "home" },
  { href: "/plats", label: "Plats", key: "plats" },
  { href: "/produits", label: "Produits", key: "produits" },
  { href: "/recherche", label: "Recherche", key: "recherche" },
];

const BOTTOM_ICONS: Record<string, React.ReactNode> = {
  home: (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="w-[22px] h-[22px]">
      <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
      <polyline points="9 22 9 12 15 12 15 22" />
    </svg>
  ),
  plats: (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="w-[22px] h-[22px]">
      <path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2" />
      <path d="M7 2v20" />
      <path d="M21 15V2a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3zm0 0v7" />
    </svg>
  ),
  produits: (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="w-[22px] h-[22px]">
      <path d="m7.5 4.27 9 5.15" />
      <path d="M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z" />
      <path d="m3.3 7 8.7 5 8.7-5" />
      <path d="M12 22V12" />
    </svg>
  ),
  recherche: (
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="w-[22px] h-[22px]">
      <circle cx="11" cy="11" r="8" />
      <path d="m21 21-4.35-4.35" />
    </svg>
  ),
};

function LogoMark({ size = "sm" }: { size?: "sm" | "md" }) {
  const s = size === "md" ? "w-11 h-11 text-base" : "w-9 h-9 text-sm";
  return (
    <div className={`${s} rounded-full bg-[linear-gradient(135deg,var(--color-gold),#a07830)] flex items-center justify-center text-bg font-black font-[family-name:var(--font-heading)] shrink-0`}>
      L
    </div>
  );
}

function LogoText() {
  return (
    <div className="flex flex-col leading-none">
      <span className="text-[0.55rem] font-bold tracking-[0.15em] uppercase text-muted">
        Louma
      </span>
      <span className="text-[0.75rem] font-bold tracking-[0.12em] uppercase text-cream">
        GUIDE
      </span>
    </div>
  );
}

export default function Navbar() {
  const pathname = usePathname();

  const isActive = (href: string) =>
    href === "/" ? pathname === "/" : pathname.startsWith(href);

  return (
    <>
      {/* Desktop nav */}
      <nav className="sticky top-0 z-50 hidden md:flex items-center justify-between px-8 py-4 bg-bg/92 backdrop-blur-[20px] border-b border-border">
        <Link href="/" className="flex items-center gap-3">
          <LogoMark size="md" />
          <LogoText />
        </Link>
        <div className="flex items-center gap-1">
          {NAV_ITEMS.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className={`px-4 py-2 rounded-full text-[0.78rem] font-bold tracking-[0.05em] transition-all ${
                isActive(item.href)
                  ? "text-gold"
                  : "text-muted hover:text-cream hover:bg-[rgba(255,255,255,0.05)]"
              }`}
            >
              {item.label}
            </Link>
          ))}
        </div>
        <div className="flex items-center gap-2">
          <Link
            href="/recherche"
            className="w-[38px] h-[38px] rounded-full bg-[rgba(201,168,76,0.07)] border border-border flex items-center justify-center text-gold hover:bg-[rgba(201,168,76,0.15)] hover:border-border-highlight transition-all"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <circle cx="11" cy="11" r="8" />
              <path d="m21 21-4.35-4.35" />
            </svg>
          </Link>
          <a
            href="https://www.seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="w-[38px] h-[38px] rounded-full bg-[rgba(201,168,76,0.07)] border border-border flex items-center justify-center text-gold hover:bg-[rgba(201,168,76,0.15)] hover:border-border-highlight transition-all"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z" />
              <line x1="3" y1="6" x2="21" y2="6" />
              <path d="M16 10a4 4 0 0 1-8 0" />
            </svg>
          </a>
        </div>
      </nav>

      {/* Mobile top bar */}
      <nav className="sticky top-0 z-50 flex md:hidden items-center justify-between px-5 py-3.5 bg-bg/92 backdrop-blur-[20px] border-b border-border">
        <Link href="/" className="flex items-center gap-2.5">
          <LogoMark />
          <LogoText />
        </Link>
        <div className="flex items-center gap-2">
          <Link
            href="/recherche"
            className="w-[38px] h-[38px] rounded-full bg-[rgba(201,168,76,0.07)] border border-border flex items-center justify-center text-gold"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <circle cx="11" cy="11" r="8" />
              <path d="m21 21-4.35-4.35" />
            </svg>
          </Link>
          <a
            href="https://www.seggfaye.com"
            target="_blank"
            rel="noopener noreferrer"
            className="w-[38px] h-[38px] rounded-full bg-[rgba(201,168,76,0.07)] border border-border flex items-center justify-center text-gold"
          >
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z" />
              <line x1="3" y1="6" x2="21" y2="6" />
              <path d="M16 10a4 4 0 0 1-8 0" />
            </svg>
          </a>
        </div>
      </nav>

      {/* Mobile bottom nav */}
      <nav className="fixed bottom-0 left-0 right-0 z-50 flex md:hidden h-[72px] bg-[rgba(24,19,16,0.96)] backdrop-blur-[20px] border-t border-border">
        {NAV_ITEMS.map((item) => {
          const active = isActive(item.href);
          return (
            <Link
              key={item.href}
              href={item.href}
              className={`flex-1 flex flex-col items-center justify-center gap-1 text-[0.6rem] font-bold tracking-[0.08em] uppercase transition-all ${
                active ? "text-gold" : "text-muted"
              }`}
            >
              <span className={`transition-transform ${active ? "scale-[1.15]" : ""}`}>
                {BOTTOM_ICONS[item.key]}
              </span>
              {item.label}
              <span
                className={`w-1 h-1 rounded-full bg-gold transition-opacity ${
                  active ? "opacity-100" : "opacity-0"
                }`}
              />
            </Link>
          );
        })}
      </nav>
    </>
  );
}
