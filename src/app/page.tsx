import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import SearchBar from "@/components/SearchBar";
import DishCard from "@/components/DishCard";
import SectionLabel from "@/components/SectionLabel";
import { getFeaturedDishes } from "@/lib/queries";

const STEPS = [
  {
    num: 1,
    emoji: "🍽️",
    title: "Choisissez un plat",
    text: "Parcourez nos 10 recettes traditionnelles senegalaises.",
  },
  {
    num: 2,
    emoji: "📋",
    title: "Decouvrez les ingredients",
    text: "Identifiez les produits Louma essentiels et optionnels.",
  },
  {
    num: 3,
    emoji: "🛒",
    title: "Commandez sur seggfaye.com",
    text: "Livraison en Europe, frais de port 6,90 €.",
  },
];

export default async function HomePage() {
  const dishes = await getFeaturedDishes();

  return (
    <>
      <Navbar />
      <main className="flex-1">
        {/* Hero */}
        <section className="px-5 pt-10 pb-8 md:px-8 md:pt-16 md:pb-12 text-center bg-[radial-gradient(ellipse_80%_50%_at_50%_0%,rgba(201,168,76,0.08),transparent)]">
          <h1 className="font-[family-name:var(--font-heading)] text-[2.2rem] md:text-[3.2rem] font-black text-cream leading-[1.15] mb-3">
            Le <em className="text-gold italic font-[family-name:var(--font-heading)]">Guedjologue</em>
            <br />
            vous guide
          </h1>
          <p className="text-muted text-[0.9rem] md:text-base leading-relaxed max-w-[300px] md:max-w-[420px] mx-auto mb-7">
            Decouvrez quels produits Louma utiliser dans chaque plat senegalais traditionnel.
          </p>
          <div className="max-w-[400px] md:max-w-[580px] mx-auto">
            <SearchBar big />
          </div>
        </section>

        {/* Comment ca marche */}
        <section className="px-5 py-8 md:px-8 md:py-10 max-w-4xl mx-auto">
          <SectionLabel>Comment ca marche</SectionLabel>
          <div className="flex flex-col md:flex-row gap-3">
            {STEPS.map((s) => (
              <div
                key={s.num}
                className="flex items-start gap-4 rounded-[var(--radius-md)] border border-border bg-[linear-gradient(145deg,rgba(255,255,255,.05),rgba(255,255,255,.02))] p-4"
              >
                <div className="w-8 h-8 shrink-0 rounded-full bg-gold text-bg font-black text-[0.85rem] flex items-center justify-center">
                  {s.num}
                </div>
                <span className="text-[1.4rem] shrink-0">{s.emoji}</span>
                <div>
                  <h3 className="font-bold text-[0.9rem] text-cream mb-0.5">
                    {s.title}
                  </h3>
                  <p className="text-[0.8rem] text-muted leading-relaxed">
                    {s.text}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Plats populaires */}
        <section className="px-5 pb-8 md:px-8 md:pb-10 max-w-5xl mx-auto">
          <SectionLabel>Plats populaires</SectionLabel>
          {dishes.length > 0 ? (
            <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
              {dishes.map((dish) => (
                <DishCard key={dish.id} dish={dish} />
              ))}
            </div>
          ) : (
            <p className="text-center text-muted py-12">
              Connectez Supabase pour voir les plats.
            </p>
          )}
        </section>
      </main>
      <Footer />
    </>
  );
}
