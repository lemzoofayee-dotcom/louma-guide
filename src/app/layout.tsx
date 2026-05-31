import type { Metadata } from "next";
import { Playfair_Display, Plus_Jakarta_Sans } from "next/font/google";
import "./globals.css";

const playfair = Playfair_Display({
  variable: "--font-heading",
  subsets: ["latin"],
  weight: ["700", "900"],
  style: ["normal", "italic"],
  display: "swap",
});

const jakarta = Plus_Jakarta_Sans({
  variable: "--font-body",
  subsets: ["latin"],
  weight: ["400", "500", "600", "700", "800"],
  display: "swap",
});

export const metadata: Metadata = {
  title: {
    default: "Louma Guide | Produits exotiques africains pour la cuisine senegalaise",
    template: "%s | Louma Guide",
  },
  description:
    "Guide interactif des produits exotiques africains et produits halieutiques seches du Senegal : guedj, netetou, yeet, crevettes sechees. Decouvrez quel produit utiliser dans chaque plat senegalais. Livraison France et Europe.",
  keywords: [
    "produits exotiques africains",
    "produits exotiques senegalais",
    "produits halieutiques seches",
    "produits halieutiques seches senegal",
    "poisson seche senegalais",
    "guedj",
    "netetou",
    "yeet",
    "crevettes sechees",
    "cuisine senegalaise",
    "produits africains france",
    "epicerie africaine en ligne",
    "recettes senegalaises",
    "thieboudienne",
    "produits du terroir senegalais",
    "fruits de mer seches",
    "iles du saloum",
  ],
  metadataBase: new URL("https://guide.seggfaye.com"),
  icons: {
    icon: "/favicon.svg",
  },
  openGraph: {
    siteName: "Louma Guide",
    locale: "fr_FR",
    type: "website",
    title: "Louma Guide | Produits exotiques africains pour la cuisine senegalaise",
    description: "Guide interactif des produits halieutiques seches du Senegal et produits exotiques africains. Guedj, netetou, yeet, crevettes sechees. Livraison France et Europe.",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr" className={`${playfair.variable} ${jakarta.variable}`}>
      <body className="min-h-dvh flex flex-col bg-bg text-cream">
        {children}
      </body>
    </html>
  );
}
