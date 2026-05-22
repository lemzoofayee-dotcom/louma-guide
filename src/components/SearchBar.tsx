"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

export default function SearchBar({ big = false }: { big?: boolean }) {
  const [query, setQuery] = useState("");
  const router = useRouter();

  function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (query.trim()) {
      router.push(`/recherche?q=${encodeURIComponent(query.trim())}`);
    }
  }

  return (
    <form onSubmit={handleSubmit} className="w-full">
      <div className="relative">
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
          placeholder="Quel plat voulez-vous cuisiner ?"
          className={`w-full bg-[linear-gradient(145deg,rgba(255,255,255,0.06),rgba(255,255,255,0.02))] border-[1.5px] border-border rounded-full pl-12 pr-5 text-cream font-[family-name:var(--font-body)] outline-none transition-colors focus:border-border-highlight placeholder:text-muted ${
            big ? "py-3.5 text-[0.95rem]" : "py-2.5 text-[0.85rem]"
          }`}
        />
      </div>
    </form>
  );
}
