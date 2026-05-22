import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { getCategories, getProducts } from "@/lib/queries";
import type { Metadata } from "next";
import CategoryFilter from "./CategoryFilter";

export const metadata: Metadata = {
  title: "Nos produits",
  description:
    "Tous les produits authentiques senegalais : guedj, netetou, yeet, cereales, epices et poissons frais.",
};

export default async function ProduitsPage() {
  const [categories, products] = await Promise.all([
    getCategories(),
    getProducts(),
  ]);

  return (
    <>
      <Navbar />
      <main className="flex-1">
        <section className="px-5 pt-8 pb-6 md:px-8 md:pt-12 md:pb-8 text-center bg-[radial-gradient(ellipse_80%_50%_at_50%_0%,rgba(201,168,76,0.08),transparent)]">
          <h1 className="font-[family-name:var(--font-heading)] text-[1.8rem] md:text-[2.8rem] font-black text-cream leading-tight">
            Nos produits
          </h1>
          <p className="text-muted text-[0.85rem] mt-2 max-w-md mx-auto">
            54 produits authentiques senegalais pour sublimer vos plats.
          </p>
        </section>

        <div className="px-5 md:px-8 max-w-5xl mx-auto py-8">
          <CategoryFilter
            categories={categories}
            products={products}
          />
        </div>
      </main>
      <Footer />
    </>
  );
}
