import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import DishCard from "@/components/DishCard";
import SectionLabel from "@/components/SectionLabel";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getDishBySlug,
  getDishProducts,
  getRelatedDishes,
  getAllSlugs,
} from "@/lib/queries";
import type { Metadata } from "next";

export async function generateStaticParams() {
  const slugs = await getAllSlugs("dishes");
  return slugs.map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const dish = await getDishBySlug(slug);
  if (!dish) return {};
  return {
    title: `${dish.name} - Ingredients et recette`,
    description: dish.description,
  };
}

export default async function DishPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const dish = await getDishBySlug(slug);
  if (!dish) notFound();

  const [dishProducts, relatedDishes] = await Promise.all([
    getDishProducts(dish.id),
    getRelatedDishes(dish.id),
  ]);

  const essential = dishProducts.filter((dp) => dp.is_essential);
  const optional = dishProducts.filter((dp) => !dp.is_essential);

  const allIngredients = [
    ...dishProducts.map((dp) => dp.product.name + (dp.quantity ? ` (${dp.quantity})` : "")),
    ...(dish.other_ingredients || []),
  ];

  const recipeJsonLd = {
    "@context": "https://schema.org",
    "@type": "Recipe",
    name: dish.name,
    description: dish.description,
    image: dish.image_url
      ? dish.image_url.startsWith("/")
        ? `https://guide.seggfaye.com${dish.image_url}`
        : `https://www.seggfaye.com/${dish.image_url}`
      : undefined,
    author: { "@type": "Person", name: "Le Guedjologue" },
    publisher: { "@type": "Organization", name: "Louma by Seggfaye", url: "https://www.seggfaye.com" },
    prepTime: dish.prep_time_minutes ? `PT${dish.prep_time_minutes}M` : undefined,
    cookTime: dish.cook_time_minutes ? `PT${dish.cook_time_minutes}M` : undefined,
    totalTime: dish.prep_time_minutes && dish.cook_time_minutes ? `PT${dish.prep_time_minutes + dish.cook_time_minutes}M` : undefined,
    recipeYield: dish.servings || undefined,
    recipeCategory: dish.category || "Plat principal",
    recipeCuisine: "Senegalaise",
    recipeIngredient: allIngredients.length > 0 ? allIngredients : undefined,
    recipeInstructions: dish.steps?.map((s: { step: number; title: string; text: string }) => ({
      "@type": "HowToStep",
      position: s.step,
      name: s.title,
      text: s.text,
    })),
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(recipeJsonLd) }}
      />
      <Navbar />
      <main className="flex-1">
        {/* Hero */}
        <section className="px-5 pt-8 pb-6 md:px-8 md:pt-12 md:pb-8 text-center bg-[radial-gradient(ellipse_80%_50%_at_50%_0%,rgba(201,168,76,0.08),transparent)]">
          {/* Breadcrumb */}
          <nav className="text-[0.75rem] text-muted mb-6 max-w-4xl mx-auto text-left">
            <Link href="/plats" className="hover:text-cream transition-colors">
              Plats
            </Link>
            <span className="mx-2 text-border">/</span>
            <span className="text-cream">{dish.name}</span>
          </nav>

          {dish.image_url ? (
            <div className="relative w-40 h-40 md:w-52 md:h-52 mx-auto mb-4 rounded-full overflow-hidden border-2 border-border">
              <Image
                src={dish.image_url.startsWith('/') ? dish.image_url : `https://www.seggfaye.com/${dish.image_url}`}
                alt={dish.name}
                fill
                className="object-cover"
                sizes="208px"
                priority
              />
            </div>
          ) : (
            <span className="text-[3.5rem] block mb-3">{dish.emoji}</span>
          )}
          <h1 className="font-[family-name:var(--font-heading)] text-[1.8rem] md:text-[2.8rem] font-black text-cream leading-tight">
            {dish.name}
          </h1>
          {dish.name_wolof && (
            <p className="text-gold italic mt-1 text-[1rem] font-[family-name:var(--font-heading)]">{dish.name_wolof}</p>
          )}
          {dish.subtitle && (
            <p className="text-muted mt-2 text-[0.85rem] max-w-md mx-auto">{dish.subtitle}</p>
          )}

          {/* Stats pills */}
          <div className="flex flex-wrap items-center justify-center gap-2 mt-5">
            {dish.prep_time_minutes && (
              <span className="text-[0.7rem] font-bold bg-[rgba(255,255,255,0.05)] border border-border px-3 py-1.5 rounded-full text-cream">
                ⏱ {dish.prep_time_minutes} min prep
              </span>
            )}
            {dish.cook_time_minutes && (
              <span className="text-[0.7rem] font-bold bg-[rgba(255,255,255,0.05)] border border-border px-3 py-1.5 rounded-full text-cream">
                🍳 {dish.cook_time_minutes} min cuisson
              </span>
            )}
            {dish.servings && (
              <span className="text-[0.7rem] font-bold bg-[rgba(255,255,255,0.05)] border border-border px-3 py-1.5 rounded-full text-cream">
                👥 {dish.servings}
              </span>
            )}
            {dish.difficulty && (
              <span className="text-[0.7rem] font-bold bg-[rgba(201,168,76,0.12)] text-gold border border-[rgba(201,168,76,0.25)] px-3 py-1.5 rounded-full">
                {dish.difficulty}
              </span>
            )}
          </div>
        </section>

        <div className="px-5 md:px-8 max-w-4xl mx-auto py-8">
          {/* Produits Louma */}
          {dishProducts.length > 0 && (
            <section className="mb-10">
              <SectionLabel>Produits Louma</SectionLabel>
              <p className="text-[0.8rem] text-muted mb-5 -mt-2">
                Les produits authentiques pour reussir ce plat
              </p>

              {essential.length > 0 && (
                <>
                  <p className="text-[0.65rem] font-bold tracking-[0.18em] uppercase text-gold mb-3">
                    Essentiels
                  </p>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mb-6">
                    {essential.map((dp) => (
                      <ProductIngredient key={dp.id} dp={dp} />
                    ))}
                  </div>
                </>
              )}

              {optional.length > 0 && (
                <>
                  <p className="text-[0.65rem] font-bold tracking-[0.18em] uppercase text-muted mb-3">
                    Optionnels
                  </p>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    {optional.map((dp) => (
                      <ProductIngredient key={dp.id} dp={dp} optional />
                    ))}
                  </div>
                </>
              )}
            </section>
          )}

          {/* Autres ingredients */}
          {dish.other_ingredients && dish.other_ingredients.length > 0 && (
            <section className="mb-10">
              <SectionLabel>Autres ingredients</SectionLabel>
              <div className="rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] p-5">
                <ul className="space-y-2">
                  {dish.other_ingredients.map((ing, i) => (
                    <li key={i} className="flex items-start gap-2.5 text-[0.85rem] text-cream/80">
                      <span className="text-gold mt-0.5 text-[0.7rem]">&#9679;</span>
                      <span>{ing}</span>
                    </li>
                  ))}
                </ul>
              </div>
            </section>
          )}

          {/* Preparation */}
          {dish.steps && dish.steps.length > 0 && (
            <section className="mb-10">
              <SectionLabel>Preparation</SectionLabel>
              <div className="space-y-3">
                {dish.steps.map((step) => (
                  <div
                    key={step.step}
                    className="flex gap-4 rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] p-4"
                  >
                    <div className="shrink-0 w-8 h-8 rounded-full border-2 border-gold text-gold font-bold flex items-center justify-center text-[0.8rem]">
                      {step.step}
                    </div>
                    <div>
                      <h3 className="font-bold text-[0.9rem] text-cream">{step.title}</h3>
                      <p className="text-[0.8rem] text-muted mt-1 leading-relaxed">{step.text}</p>
                    </div>
                  </div>
                ))}
              </div>
            </section>
          )}

          {/* Conseils du Guedjologue */}
          {dish.tips && dish.tips.length > 0 && (
            <section className="mb-10">
              <div className="rounded-[var(--radius-lg)] border-l-4 border-gold bg-[rgba(201,168,76,0.06)] p-5 md:p-6">
                <h2 className="font-[family-name:var(--font-heading)] text-[1rem] font-bold text-gold mb-3 flex items-center gap-2">
                  <span>💡</span> Conseil du Guedjologue
                </h2>
                <ul className="space-y-2">
                  {dish.tips.map((tip, i) => (
                    <li key={i} className="text-[0.8rem] text-cream/80 leading-relaxed">
                      {tip}
                    </li>
                  ))}
                </ul>
              </div>
            </section>
          )}

          {/* CTA Commander les ingredients */}
          {dishProducts.length > 0 && (
            <section className="mb-10">
              <a
                href="https://www.seggfaye.com/#produits"
                target="_blank"
                rel="noopener noreferrer"
                className="block rounded-[var(--radius-lg)] border border-[rgba(201,168,76,0.3)] bg-[linear-gradient(135deg,rgba(201,168,76,0.08),rgba(201,168,76,0.02))] p-5 md:p-6 text-center transition-all hover:border-[rgba(201,168,76,0.5)] hover:shadow-[0_8px_32px_rgba(201,168,76,0.1)]"
              >
                <p className="font-[family-name:var(--font-heading)] text-[1.1rem] md:text-[1.3rem] font-bold text-gold mb-2">
                  Envie de preparer ce {dish.name} ?
                </p>
                <p className="text-[0.8rem] text-cream/70 mb-4">
                  Retrouvez tous les produits authentiques du Saloum sur notre boutique
                </p>
                <span className="inline-flex items-center gap-2 bg-green text-white font-bold text-[0.8rem] px-5 py-2.5 rounded-full hover:brightness-110 transition">
                  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                    <circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/>
                  </svg>
                  Commander sur seggfaye.com
                </span>
              </a>
            </section>
          )}

          {/* Lien blog */}
          {dish.blog_url && (
            <div className="text-center mb-10">
              <a
                href={dish.blog_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 text-[0.8rem] text-gold hover:text-[#e0c070] transition-colors"
              >
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                  <path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6" />
                  <polyline points="15 3 21 3 21 9" />
                  <line x1="10" y1="14" x2="21" y2="3" />
                </svg>
                Lire l&apos;article complet sur seggfaye.com
              </a>
            </div>
          )}

          {/* Plats similaires */}
          {relatedDishes.length > 0 && (
            <section className="mb-12">
              <SectionLabel>Decouvrez aussi</SectionLabel>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                {relatedDishes.map((d) => (
                  <DishCard key={d.id} dish={d} />
                ))}
              </div>
            </section>
          )}
        </div>
      </main>
      <Footer />
    </>
  );
}

function ProductIngredient({
  dp,
  optional = false,
}: {
  dp: { product: { slug: string; name: string; image_main: string; price: number; price_unit: string; seggfaye_url: string }; role: string; quantity: string | null; expert_note: string | null };
  optional?: boolean;
}) {
  const p = dp.product;
  return (
    <div
      className={`flex items-center gap-3.5 rounded-[var(--radius-md)] border p-3.5 ${
        optional
          ? "border-dashed border-border bg-[linear-gradient(145deg,rgba(255,255,255,.03),rgba(255,255,255,.01))]"
          : "border-[rgba(201,168,76,.35)] bg-[linear-gradient(145deg,rgba(255,255,255,.07),rgba(255,255,255,.02))]"
      }`}
    >
      <Link href={`/produits/${p.slug}`} className="shrink-0">
        <Image
          src={`https://www.seggfaye.com/${p.image_main}`}
          alt={p.name}
          width={56}
          height={56}
          className="rounded-full object-cover w-14 h-14 border-2 border-border"
        />
      </Link>
      <div className="flex-1 min-w-0">
        <Link
          href={`/produits/${p.slug}`}
          className="font-bold text-cream hover:text-gold transition-colors text-[0.85rem]"
        >
          {p.name}
        </Link>
        <p className="text-[0.72rem] text-muted mt-0.5">{dp.role}</p>
        {dp.quantity && (
          <p className="text-[0.72rem] text-cream/60">{dp.quantity}</p>
        )}
        {dp.expert_note && (
          <p className="text-[0.7rem] text-gold/70 mt-1 italic leading-snug">{dp.expert_note}</p>
        )}
      </div>
      <div className="shrink-0 flex flex-col items-end gap-1.5">
        <span className="text-[0.78rem] text-gold font-bold whitespace-nowrap">
          {p.price.toFixed(2).replace(".", ",")} &euro;
        </span>
        <a
          href={p.seggfaye_url}
          target="_blank"
          rel="noopener noreferrer"
          className="text-[0.6rem] font-bold bg-green text-white px-2.5 py-1 rounded-full hover:brightness-110 transition whitespace-nowrap"
        >
          Commander
        </a>
      </div>
    </div>
  );
}
