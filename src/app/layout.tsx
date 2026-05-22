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
    default: "Louma Guide | Le Guedjologue vous guide",
    template: "%s | Louma Guide",
  },
  description:
    "Decouvrez quels produits (guedj, netetou, yeet) utiliser dans chaque plat senegalais. Guide interactif par le Guedjologue de Louma by Seggfaye.",
  metadataBase: new URL("https://guide.seggfaye.com"),
  openGraph: {
    siteName: "Louma Guide",
    locale: "fr_FR",
    type: "website",
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
