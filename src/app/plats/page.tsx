import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import DishCard from "@/components/DishCard";
import SectionLabel from "@/components/SectionLabel";
import { getDishes } from "@/lib/queries";
import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "Tous les plats senegalais",
  description:
    "Parcourez tous les plats senegalais et decouvrez quels produits utiliser pour chacun.",
};

export default async function PlatsPage() {
  const dishes = await getDishes();

  const categories = ["Plat principal", "Dessert", "Petit-dejeuner", "Boisson"];
  const grouped = categories
    .map((cat) => ({
      label: cat === "Plat principal" ? "Plats principaux" : cat + "s",
      dishes: dishes.filter((d) => d.category === cat),
    }))
    .filter((g) => g.dishes.length > 0);

  return (
    <>
      <Navbar />
      <main className="flex-1">
        <section className="px-5 pt-8 pb-6 md:px-8 md:pt-12 md:pb-8 text-center bg-[radial-gradient(ellipse_80%_50%_at_50%_0%,rgba(201,168,76,0.08),transparent)]">
          <h1 className="font-[family-name:var(--font-heading)] text-[1.8rem] md:text-[2.8rem] font-black text-cream leading-tight">
            Tous les plats
          </h1>
          <p className="text-muted text-[0.85rem] mt-2 max-w-md mx-auto">
            Parcourez nos recettes senegalaises et decouvrez les produits Louma a utiliser.
          </p>
        </section>

        <div className="px-5 md:px-8 max-w-5xl mx-auto py-8">
          {grouped.map((group) => (
            <section key={group.label} className="mb-10">
              <SectionLabel>{group.label}</SectionLabel>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                {group.dishes.map((dish) => (
                  <DishCard key={dish.id} dish={dish} />
                ))}
              </div>
            </section>
          ))}

          {dishes.length === 0 && (
            <p className="text-center text-muted py-20">
              Connectez Supabase pour voir les plats.
            </p>
          )}
        </div>
      </main>
      <Footer />
    </>
  );
}
