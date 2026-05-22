import { Suspense } from "react";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { getDishes, getProducts } from "@/lib/queries";
import type { Metadata } from "next";
import SearchClient from "./SearchClient";

export const metadata: Metadata = {
  title: "Recherche",
  description: "Recherchez un plat ou un produit senegalais.",
};

export default async function RecherchePage() {
  const [dishes, products] = await Promise.all([getDishes(), getProducts()]);

  return (
    <>
      <Navbar />
      <main className="flex-1">
        <section className="px-5 pt-8 pb-6 md:px-8 md:pt-12 md:pb-8 text-center bg-[radial-gradient(ellipse_80%_50%_at_50%_0%,rgba(201,168,76,0.08),transparent)]">
          <h1 className="font-[family-name:var(--font-heading)] text-[1.8rem] md:text-[2.8rem] font-black text-cream leading-tight">
            Recherche
          </h1>
          <p className="text-muted text-[0.85rem] mt-2 max-w-md mx-auto">
            Trouvez un plat ou un produit en quelques lettres.
          </p>
        </section>
        <div className="px-5 md:px-8 max-w-5xl mx-auto py-8">
          <Suspense>
            <SearchClient dishes={dishes} products={products} />
          </Suspense>
        </div>
      </main>
      <Footer />
    </>
  );
}
