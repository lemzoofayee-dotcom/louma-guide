import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import SectionLabel from "@/components/SectionLabel";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";
import {
  getProductBySlug,
  getProductDishes,
  getAllSlugs,
} from "@/lib/queries";
import type { Metadata } from "next";

export async function generateStaticParams() {
  const slugs = await getAllSlugs("products");
  return slugs.map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  if (!product) return {};
  const local =
    product.name_local && product.name_local !== product.name
      ? ` (${product.name_local})`
      : "";
  const url = `https://guide.seggfaye.com/produits/${slug}`;
  return {
    title: `${product.name}${local}`,
    description: product.description,
    alternates: { canonical: url },
    openGraph: {
      title: product.name,
      description: product.description,
      url,
      type: "website",
      images: product.image_main ? [product.image_main] : undefined,
    },
  };
}

export default async function ProductPage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  if (!product) notFound();

  const productDishes = await getProductDishes(product.id);

  const gallery = product.image_gallery ?? [product.image_main];

  return (
    <>
      <Navbar />
      <main className="flex-1">
        <div className="px-5 md:px-8 max-w-4xl mx-auto py-8">
          {/* Breadcrumb */}
          <nav className="text-[0.75rem] text-muted mb-6">
            <Link
              href="/produits"
              className="hover:text-cream transition-colors"
            >
              Produits
            </Link>
            <span className="mx-2 text-border">/</span>
            <span className="text-cream">{product.name}</span>
          </nav>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-10">
            {/* Images */}
            <div>
              <div className="relative aspect-square rounded-[var(--radius-lg)] overflow-hidden bg-[linear-gradient(145deg,rgba(255,255,255,.07),rgba(255,255,255,.02))] border border-border">
                <Image
                  src={`https://seggfaye.com/${gallery[0]}`}
                  alt={product.name}
                  fill
                  className="object-cover"
                  sizes="(max-width: 768px) 100vw, 50vw"
                  priority
                />
                {product.badge && (
                  <span className="absolute top-3 left-3 text-[0.6rem] font-bold tracking-[0.12em] uppercase bg-gold text-bg px-2.5 py-1 rounded-full shadow-[0_4px_12px_rgba(201,168,76,0.3)]">
                    {product.badge}
                  </span>
                )}
              </div>
              {gallery.length > 1 && (
                <div className="flex gap-2 mt-3 overflow-x-auto">
                  {gallery.map((img, i) => (
                    <div
                      key={i}
                      className="shrink-0 w-16 h-16 rounded-[var(--radius-md)] overflow-hidden bg-[rgba(255,255,255,.05)] border border-border hover:border-border-highlight transition-colors cursor-pointer"
                    >
                      <Image
                        src={`https://seggfaye.com/${img}`}
                        alt={`${product.name} ${i + 1}`}
                        width={64}
                        height={64}
                        className="object-cover w-full h-full"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Info */}
            <div>
              <h1 className="font-[family-name:var(--font-heading)] text-[1.6rem] md:text-[2rem] font-black text-cream leading-tight">
                {product.name}
              </h1>
              {product.name_local &&
                product.name_local !== product.name && (
                  <p className="text-gold italic mt-1 text-[0.9rem] font-[family-name:var(--font-heading)]">{product.name_local}</p>
                )}

              {product.origin && (
                <p className="flex items-center gap-1.5 text-[0.78rem] text-muted mt-3">
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" className="text-gold">
                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" />
                    <circle cx="12" cy="10" r="3" />
                  </svg>
                  {product.origin}
                </p>
              )}

              <div className="flex items-baseline gap-3 mt-4">
                <span className="text-[1.5rem] font-bold text-gold">
                  {product.price.toFixed(2).replace(".", ",")} &euro;
                </span>
                <span className="text-[0.8rem] text-muted">{product.price_unit}</span>
                {product.price_old && (
                  <span className="text-[0.8rem] text-muted line-through">
                    {product.price_old.toFixed(2).replace(".", ",")} &euro;
                  </span>
                )}
              </div>

              <a
                href={product.seggfaye_url}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 mt-5 px-6 py-3 bg-[linear-gradient(135deg,var(--color-gold),#a07830)] text-bg font-bold rounded-full hover:shadow-[0_8px_30px_rgba(201,168,76,0.3)] transition-all text-[0.85rem]"
              >
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
                  <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z" />
                  <line x1="3" y1="6" x2="21" y2="6" />
                  <path d="M16 10a4 4 0 0 1-8 0" />
                </svg>
                Commander sur seggfaye.com
              </a>

              {/* Description sections */}
              <div className="mt-8 space-y-5">
                <div>
                  <h2 className="text-[0.65rem] font-bold tracking-[0.18em] uppercase text-gold mb-2">
                    Description
                  </h2>
                  <p className="text-[0.85rem] text-cream/80 leading-relaxed">
                    {product.description}
                  </p>
                </div>

                {product.taste_profile && (
                  <div className="rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] p-4">
                    <h2 className="text-[0.65rem] font-bold tracking-[0.18em] uppercase text-gold mb-2">
                      Le gout en +
                    </h2>
                    <p className="text-[0.85rem] text-cream/80">
                      {product.taste_profile}
                    </p>
                  </div>
                )}

                {product.usage_advice && (
                  <div>
                    <h2 className="text-[0.65rem] font-bold tracking-[0.18em] uppercase text-gold mb-2">
                      Conseil d&apos;utilisation
                    </h2>
                    <p className="text-[0.85rem] text-cream/80">
                      {product.usage_advice}
                    </p>
                  </div>
                )}
              </div>
            </div>
          </div>

          {/* Plats compatibles */}
          {productDishes.length > 0 && (
            <section className="mb-12">
              <SectionLabel>Utilise dans ces plats</SectionLabel>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                {productDishes.map((pd) => (
                  <Link
                    key={pd.id}
                    href={`/plats/${pd.dish!.slug}`}
                    className="flex items-center gap-4 rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] p-4 hover:border-border-highlight hover:-translate-y-1 transition-all duration-300 ease-[cubic-bezier(0.34,1.56,0.64,1)]"
                  >
                    <span className="text-[2rem]">{pd.dish!.emoji}</span>
                    <div>
                      <h3 className="font-bold text-[0.9rem] text-cream">{pd.dish!.name}</h3>
                      <p className="text-[0.72rem] text-muted mt-0.5">{pd.role}</p>
                      {pd.quantity && (
                        <p className="text-[0.72rem] text-cream/60">
                          {pd.quantity}
                        </p>
                      )}
                    </div>
                  </Link>
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
